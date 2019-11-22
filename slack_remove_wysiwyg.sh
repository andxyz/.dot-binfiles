#!/usr/bin/env bash
## taken from https://gist.github.com/scalp42/e869635c5b21f2395e5f4bd8e48ca2f4
##

set -e

SLACK_RESOURCES_DIR=/Applications/Slack.app/Contents/Resources

function command_exists() {
  command -v $1 > /dev/null
  return $?
}

if [ ! -d "$SLACK_RESOURCES_DIR" ]; then
  echo "Couldn't find Slack resources dir ($SLACK_RESOURCES_DIR)"
  echo "Is it installed?"
  exit 1
else
  echo "✅ Found dir $SLACK_RESOURCES_DIR"
fi

if ! command_exists npx; then
  echo "Could not find npx, please install"
else
  echo "✅ npx found"
fi

NPX_PATH=$(type -P npx)

# unpack
echo "🚀 unpacking asar archive for Slack (requires sudo)"
sudo "PATH=$PATH" $NPX_PATH asar extract $SLACK_RESOURCES_DIR/app.asar $SLACK_RESOURCES_DIR/app.asar.unpacked
echo "✅ done"

JS_FILE="$SLACK_RESOURCES_DIR/app.asar.unpacked/dist/ssb-interop.bundle.js"
HEADER="// WYSIWYG patch"

if grep -q "$HEADER" "$JS_FILE" >/dev/null; then
  echo "🎉 Patch is already installed, exiting early"
  exit 0
fi

echo "🚀 Patching $JS_FILE with code..."

cat << EOF | sudo tee -a "$JS_FILE" > /dev/null

$HEADER
const disableWysiwygEditor = (_ => {
  const redux = slackDebug[slackDebug.activeTeamId].redux;

  const {
    wysiwyg_composer,
    wysiwyg_composer_ios,
    wysiwyg_composer_webapp,
    ...payload
  } = redux.getState().experiments;

  redux.dispatch(
    {
      type: '[19] Bulk add experiment assignments to redux',
      payload
    }
  );
});

const disableInterval = setInterval(() => {
  const isLoaded = window.slackDebug &&
    window.slackDebug[window.slackDebug.activeTeamId] &&
    window.slackDebug[window.slackDebug.activeTeamId].redux;

  if (isLoaded) {
    clearInterval(disableInterval);
    setTimeout(disableWysiwygEditor, 2000);
  }
}, 50);
EOF

echo "✅ done"

echo "🚀 Repackaging asar for Slack..."
sudo "PATH=$PATH" $NPX_PATH asar pack $SLACK_RESOURCES_DIR/app.asar.unpacked $SLACK_RESOURCES_DIR/app.asar
echo "🎉 all done!"
