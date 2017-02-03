WM_INITDIALOG   = 0x110
WM_SETCURSOR    = 0x20
WM_CLOSE        = 0x10
IDC_CROSS       = 32515

uMsg            = 12
hWnd            = 8

.extern _ExitProcess@4
.set ExitProcess,_ExitProcess@4

.extern _GetModuleHandleA@4
.set GetModuleHandle,_GetModuleHandleA@4

.extern _DialogBoxParamA@20
.set DialogBoxParam,_DialogBoxParamA@20

.extern _EndDialog@8
.set EndDialog,_EndDialog@8

.extern _LoadCursorA@8
.set LoadCursor,_LoadCursorA@8

.extern _SetCursor@4
.set SetCursor,_SetCursor@4

