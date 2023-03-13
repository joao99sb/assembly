segment .data
  LF            equ 0xA ; break line
  sys_call      equ 0x80 ; pedi para o sistema execultar
  Null          equ 0xD ; final da string
  ;eax
  sys_exit      equ 0x1 ; finalizar
  sys_write     equ 0x4 ; operacao de escirta
  sys_read      equ 0x3 ; operacao de leitura
  ;ebx
  ret_exit      equ 0x0 ; operacao realizada com sucesso
  std_in        equ 0x0 ; operacao de entrada padrão 
  std_out       equ 0x1 ; saida padrão

section .data
  msg           db "Entre com seu nome: ", LF, Null
  tam           equ $- msg

  x             dd 0x100
  y             dd 0x101
   
  msg1          db "X maior que Y", LF, Null
  tam1          equ $- msg1

  msg2          db 'Y maior que X', LF, Null
  tam2          equ $- msg2


  msg3          db 'Os dois sao iguais', LF, Null
  tam3          equ $- msg3


section .text

global _start

_start:
  mov           eax, DWORD[x]
  mov           ebx, DWORD[y]

  ;if 
  cmp           eax, ebx
  ; slato condicional
  ; je =     jg >      jge >=     jl <     jle <=    jne !=
  ;salto incodicional: jmp
  jg            maior
  jl            menor
  je            igual




menor:
  mov         ecx, msg2
  mov         edx, tam2
  jmp           exit


maior:
  mov         ecx, msg1
  mov         edx, tam1
  jmp           exit


igual:
  mov         ecx, msg3
  mov         edx, tam3
  jmp           exit

  
exit: 

  mov           eax, sys_write
  mov           ebx, std_out
  int            sys_call

  ;exit
  mov         eax, sys_exit
  mov         ebx, ret_exit
  int         sys_call








