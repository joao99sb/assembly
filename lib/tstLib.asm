%include  'stdlib.inc'


section .text

global _start

_start:
  lea           esi, [buffer]          ;load Effective address
  add           esi, 0x9               ;ox9 é o começo de uma strig
  mov           byte[esi], LF          ;move para dentro do byte esi
  dec           esi
  mov           dl, 0x32               ; 0x12 => 'B' 0x32 => 'b'
  add           dl, '0'                ; converto 0x11 em A se fos
  mov           [esi], dl

  dec           esi
  mov           dl, 0x31               ; 0x11 => 'A' 0x31 => 'a'
  add           dl, '0'                ; converto 0x11 em A se fos
  mov           [esi], dl
  
  call          saidaResultado 

  mov           eax, sys_exit
  mov           ebx, ret_exit
  int           sys_call