.intel_syntax noprefix
.global _start

.include "invoke.inc"
.include "Dlgbox.inc"

.data

DlgName:
.asciz "MyDialog"

.bss

hInstance:
    .long 0

hCursor:
    .long 0

.text

_start:

    invoke  GetModuleHandle,0
    mov     hInstance,eax
    
    invoke  DialogBoxParam,hInstance,"OFFSET DlgName",0,"OFFSET DlgProc",0
            
    invoke  ExitProcess,eax


// DlgProc PROC hWnd:DWORD,uMsg:DWORD,wParam:DWORD,lParam:DWORD

DlgProc:

    push    ebp
    mov     ebp,esp

    cmp     dword ptr [ebp+uMsg], WM_CLOSE
            jne     initdlg
            invoke  EndDialog,[ebp+hWnd],0
            jmp     true

initdlg:	

    cmp     dword ptr [ebp+uMsg], WM_INITDIALOG
            jne     setcursor
            invoke  LoadCursor,0,IDC_CROSS
            mov     hCursor,eax
            jmp     true

setcursor:

    cmp     dword ptr [ebp+uMsg], WM_SETCURSOR
	
		jne       false
		invoke    SetCursor,hCursor
		jmp       true

false:

    xor     eax,eax
    pop     ebp	
    ret     4*4

true:

    mov     eax,1
    pop     ebp
    ret     4*4

// DlgProc ENDP

// END start
