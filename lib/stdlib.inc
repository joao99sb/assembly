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


  tam_buffer    equ 0xA

segment .bss  
  buffer        resb 0x1


segment .text

exit:
  mov         eax, sys_exit
  mov         ebx, ret_exit
  int         sys_call

saidaResultado:
  mov           eax, sys_write
  mov           ebx, std_out
  mov           ecx, buffer
  mov           edx, tam_buffer
  int           sys_call
  ret