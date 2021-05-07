include \masm32\include\masm32rt.inc

_iobuf STRUCT
  _ptr        DWORD ?
  _cnt        DWORD ?
  _base       DWORD ?
  _flag       DWORD ?
  _file       DWORD ?
  _charbuf    DWORD ?
  _bufsiz     DWORD ?
  _tmpfname   DWORD ?
_iobuf ENDS

FILE TYPEDEF _iobuf

BUFF_SIZE equ 256


.data
  format db 13,10,'%s',0
  out_msg db 'STDOUT',13,10,0
  err_msg db 'STDERR',13,10,0

.data?
  stdout dd ?
  stdin dd ?
  stderr dd ?
  buffer db BUFF_SIZE dup(?)


.code

start:
  call    crt___p__iob
  mov     stdin,eax           ; #define stdin  (&__iob_func()[0])
  mov     ecx,SIZEOF(FILE)
  add     eax,ecx
  mov     stdout,eax          ; #define stdout (&__iob_func()[1])
  add     eax,ecx
  mov     stderr,eax          ; #define stderr (&__iob_func()[2])

  invoke crt_fprintf,stdout,ADDR out_msg
  invoke crt_fprintf,stderr,ADDR err_msg
  exit
END start