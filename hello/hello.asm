; nasm -f elf64 hello.asm
; ld -s -o hello hello.o -> transforma em executavel

section .data
  msg db 'hello world', 0xA
  tam equ 0x5 ; $- me da o tamanho da variavel 

section .text

global _start

_start: 

  mov   eax, 0x4 
  mov   ebx, 0x1 ; 0x1 é a saida padrão 
  mov   ecx, msg 
  mov   edx, tam
  int   0x80

  ;destino -> origem
  mov   eax, 0x1 ; SO estou terminando o programa
  mov   ebx, 0x0 ; SO o valor de retorno é zero
  int 0x80  