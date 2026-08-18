.model small
.stack 100
.data
	str db"ENTER A DIGIT: $"
	str1 db"ENTER ANOTHER DIGIT: $"
	num db ?
	num1 db ?
	nl db 0ah,0dh,"$"
.code
main proc
	mov ax,@data
	mov ds,ax
	
	mov ah,09h
	lea dx,str
	int 21h
	
	;input digit 
	mov ah,01h
	int 21h
	sub al,30h
	mov num,al
	
	mov ah,09h
	lea dx,nl
	int 21h
	
	
	
	
	
	
	add num,2
	mov ah,09h
	lea dx,str1
	int 21h
	
	mov ah,01h
	int 21h
	sub al,30h
	mov num,al
	
	mov bh,num1
	sub bh,num
	
	mov ah,02h
	lea dx,num
	int 21h
	
	
	mov ax,4c00h
	int 21h
main endp
end main