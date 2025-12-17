%include 'in_out.asm'
SECTION .data
filename db 'name.txt', 0h ; Имя файла
msg db 'Фамилия и имя: ', 0h ; Сообщение 1
msg1 db 'Введите строку для записи в файл: ', 0h ; Сообщение 2
SECTION .bss
contents resb 255 ; переменная для вводимой строки
familia resb 255 ; фамилия
opis resb 255; регистр
SECTION .text
global _start
_start:
;-- сообщение
mov eax,msg
call sprint
;-- запись строки 1
mov ecx, familia
mov edx, 255
call sread
;--- вывод сообщение 2
mov eax,msg1
call sprint
;--запись строки 2
mov ecx, contents
mov edx, 255
call sread
;---
;-- запись
;создание файла
mov ecx, 0777o ; установка прав доступа
mov ebx, filename ; имя создаваемого файла
mov eax, 8 ; номер системного вызова `sys_creat`
int 80h ; вызов ядра

;--запись файла

mov edx, 255 ; количество байтов для записи
mov ecx, familia ; адрес строки для записи в файл
mov ebx, eax ; дескриптор файла
mov eax, 4 ; номер системного вызова `sys_write`
int 80h
mov ecx,contents ; адрес строки для записи в файл
mov edx, 255
mov eax, 4 ; номер системного вызова `sys_write`
int 80h ; вызов ядра

call quit
