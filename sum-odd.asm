include irvine32.inc
.data
array SWORD -3, -6, -1, -10, 10, 30, 40, 4
msg1 db "Sum of odd numbers is: ", 0
msg2 db "Count of odd numbers is: ", 0
sum dword 0
count dword 0
.code
main proc
call clrscr
mov esi, offset array
mov ecx, LENGTHOF array
process_loop:
   mov ax, word ptr [esi]
   test ax, 1h
   jz skip_odd
   movsx eax, ax
   add sum, eax
   inc count
skip_odd:
   add esi, 2
   loop process_loop
mov edx, offset msg1
call writestring
mov eax, sum
call writeint
call crlf
mov edx, offset msg2
call writestring
mov eax, count
call writeint
call crlf
exit
main endp
end main