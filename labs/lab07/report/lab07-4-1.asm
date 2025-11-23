%include 'in_out.asm'
section .data

msg2 db "Наибольшее число: ",0h
A dd 20
B dd 15
C dd 67
section .bss
max resb 10

section .text
global _start
_start:

; ---------- Записываем 'A' в переменную 'max'
mov ecx,[A] ; 'ecx = A'
mov [max],ecx ; 'max = A'
; ---------- Сравниваем 'A' и 'С' (как символы)
cmp ecx,[C] ; Сравниваем 'A' и 'С'

jg zag
jl C_Bol_A
C_Bol_A:
	mov ecx,[C] ; 'ecx = c'
	mov [max],ecx ; 'max = c'
	cmp ecx,[B]
	jg C_bol_B
	jl C_me_B
C_bol_B:
	jmp fin
C_me_B:
	mov ecx,[B] ; 'ecx = B'
	mov [max],ecx ; 'max = B'
	jmp fin
zag:
	jmp fin
	
	
	
	
; ---------- Вывод результата
fin:
mov eax, msg2
call sprint ; Вывод сообщения 'Наибольшее число: '
mov eax,[max]
call iprintLF ; Вывод 'max(A,B,C)'
call quit ; Выход
