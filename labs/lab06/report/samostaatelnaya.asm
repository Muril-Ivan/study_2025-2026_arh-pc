%include 'in_out.asm'
SECTION .data
msg: DB 'Введите x: ',0
rem: DB 'Ответ: ',0
SECTION .bss
x: RESB 80
SECTION .text
GLOBAL _start
_start:
mov eax, msg
call sprintLF
mov ecx, x
mov edx, 80
call sread

mov eax,x ; вызов подпрограммы преобразования
call atoi ; ASCII кода в число, `eax=x`
; Предположим, что x в edx, результат в edx, и есть переменная rem для отображения


   ; eax = x

sub eax, 1        ; eax = x - 1

mov ebx, eax      ; ebx = x - 1

call iprintLF     ; предположительно, выводит значение ebx или eax (не влияет на расчет)

imul eax, ebx     ; eax = (x - 1)^2

mov ebx, 5        ; ebx = 5
mul eax, ebx      ; eax = 5 * (x - 1)^2

mov edx, eax      ; сохранить результат в edx

mov eax, rem      ; подготовить аргумент для функции sprint
call sprint       ; вызвать функцию для вывода результата
mov eax, edx      ; вернуть результат в eax  
call iprintLF
call quit
