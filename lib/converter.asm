%include 'stdlib.inc'

section .data 
  vl           dw '105', LF,Null

section .text
global _start

_start:
  call        converter_valor
  call        mostrar_valor

  jmp         exit



converter_valor:
  lea         esi, [vl]
  mov         ecx, 0x3
  call        strig_to_int
  add         eax,0x2
  ret


mostrar_valor:
  call       int_to_string
  call       saidaResultado

  ret


strig_to_int:
  xor          ebx,ebx
.prox_digito_1:
  movzx        eax, byte[esi]         ; linka 2 registradores
  inc          esi
  sub          al, '0' 
  imul         ebx, 0xA  ; ebx = ebx *10
  add          ebx, eax  ; ebx = ebx + eax
  loop         .prox_digito_1
  mov          eax, ebx
  ret

int_to_string:
  lea          esi,[buffer]
  add          esi, 0x9
  mov          byte[esi], 0xA
  mov          ebx, 0xA
.prox_digito_2:
  xor          edx,edx
  div          ebx
  add          dl,'0'
  dec          esi
  mov          [esi],dl
  test         eax,eax
  jnz          .prox_digito_2
  ret