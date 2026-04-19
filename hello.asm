dseg   segment
    cr    equ 0dh       ; 回车
    lf    equ 0ah       ; 换行
    ; 边框说明：0dah(┌), 0bfh(┐), 0c0h(└), 0d9h(┘), 0c4h(─), 0b3h(│)
    msg   db cr, lf
          db 0dah, 50 dup(0c4h), 0bfh, cr, lf    ; 顶边框
          db 0b3h, '  Nanjing University of Science and Technology    ', 0b3h, cr, lf
          db 0b3h, ' ------------------------------------------------ ', 0b3h, cr, lf
          db 0b3h, '  Name  : Liu YiFei                               ', 0b3h, cr, lf
          db 0b3h, '  ID    : 923101870522                            ', 0b3h, cr, lf
          db 0b3h, '  Email : lyf050226@njust.edu.cn                  ', 0b3h, cr, lf
          db 0c0h, 50 dup(0c4h), 0d9h, cr, lf    ; 底边框
          db '$'                                 ; 结束符
dseg   ends

sseg   segment stack
    db 20 dup('stack')
sseg   ends

cseg   segment
       assume cs:cseg, ds:dseg, ss:sseg
start:
       ; 1. 初始化数据段寄存器 DS
       mov ax, dseg
       mov ds, ax
       
       ; 2. 调用 DOS 09H 功能显示字符串
       mov dx, offset msg
       mov ah, 09h
       int 21h
       
       ; 3. 调用 DOS 4CH 功能返回操作系统
       mov ah, 4ch
       int 21h
cseg   ends
       end start