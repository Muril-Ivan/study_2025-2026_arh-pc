%include 'in_out.asm'
SECTION .data
msg1 db 'Функция 3(x+2)' ,0
msg2 db 'Результат: ' ,0
SECTION .bss
res: RESB 80
SECTION .text

global _start
_start:
mov eax, msg1 ; вывод сообщения "Результат: "
call sprintLF
pop ecx ; Извлекаем из стека в `ecx` количество
; аргументов (первое значение в стеке)
pop edx; Извлекаем из стека в `edx` имя программы
; (второе значение в стеке)
sub ecx,1 ; Уменьшаем `ecx` на 1 (количество
; аргументов без названия программы)
mov esi, 0 ; Используем `esi` для хранения
; промежуточных сумм

pop eax ; иначе извлекаем следующий аргумент из стека
call atoi ; преобразуем символ в число
call _function
mov eax,msg2

call sprint
mov eax,[res]
call iprintLF
call quit
 
_function:
mov ebx,3
add eax,2
mul ebx
mov [res],eax
ret
