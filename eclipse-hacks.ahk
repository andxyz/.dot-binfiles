#IfWinActive, ahk_class SWT_Window0
XButton1::SEND, {ALTDOWN}{Left}{AltUp}
#IfWinActive, ahk_class SWT_Window0
XButton2::SEND, {ALTDOWN}{Right}{AltUp}
#IfWinActive ahk_class SWT_Window0
^Tab::Send ^{PgDn}
#IfWinActive ahk_class SWT_Window0
^+Tab::Send ^{PgUp}
#IfWinActive ahk_class SWT_Window0
^!right::Send ^{PgDn}
#IfWinActive ahk_class SWT_Window0
^!left::Send ^{PgUp}
