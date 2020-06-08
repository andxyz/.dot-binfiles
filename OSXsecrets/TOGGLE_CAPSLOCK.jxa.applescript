// LOL caplock was permalocked, I had to name this script in all caps
//   use with:
//
//  osascript -l JavaScript ~/bin/OSXsecrets/TOGGLE_CAPSLOCK.jxa.applescript

ObjC.import("IOKit");
ObjC.import("CoreServices");

(() => {
    var ioConnect = Ref();
    var state = Ref();

    $.IOServiceOpen(
        $.IOServiceGetMatchingService(
            $.kIOMasterPortDefault,
            $.IOServiceMatching(
                $.kIOHIDSystemClass
            )
        ),
        $.mach_task_self_,
        $.kIOHIDParamConnectType,
        ioConnect
    );
    $.IOHIDGetModifierLockState(ioConnect, $.kIOHIDCapsLockState, state);
    $.IOHIDSetModifierLockState(ioConnect, $.kIOHIDCapsLockState, !state[0]);
    $.IOServiceClose(ioConnect);
})();
