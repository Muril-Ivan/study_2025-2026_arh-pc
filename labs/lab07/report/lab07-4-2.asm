%include 'in_out.asm'
section .data
msg1 db 'Введите x: ',0h
msg2 db 'Введите а: ',0h
msg3 db 'final : ',0h
section .bss
x resb 10
a resb 10
section .text
global _start
_start:
; ---------- Вывод сообщения 'Введите B: '
mov eax,msg1
call sprint
; ---------- 
mov ecx,x
mov edx,10
call sread
; ---------- Преобразование из символа в число
mov eax,x
call atoi ; Вызов подпрограммы перевода символа в число
mov [x],eax ; запись преобразованного числа в 'x'
;----------
; ---------- Вывод сообщения 'Введите a: '
mov eax,msg2
call sprint
; ---------- 
mov ecx,a
mov edx,10
call sread
; ---------- Преобразование из символа в число
mov eax,a
call atoi ; Вызов подпрограммы перевода символа в число
mov [a],eax ; запись преобразованного числа в 'a'
;---- Task
  ; Загрузка чисел
    mov eax, [a]
    mov ebx, [x]

    ; Проверка равенства
    cmp eax, ebx
    je equal
	
    ; Если не равны — сумма
    add eax, ebx
    mov [a],eax
    jmp fin
   equal: 
    ; Если равны — 6 * первое число
    mov ebx, 6
    imul eax,ebx
    mov [a],eax

; ---------- Вывод результата
fin:
mov eax, msg3
call sprint ; final
mov eax,[a]
call iprintLF ;
call quit ; Выход

