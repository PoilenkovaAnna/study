.386
.model flat, stdcall
option casemap:none
 
.code
 
DllMain proc hInstDLL:DWORD, reason:DWORD, reserved1:DWORD
    mov eax, -1
    ret
 
DllMain endp
 
process proc src:DWORD, res:DWORD, len:DWORD
 
    push ebp
    push esi
    push edi
    push ecx
    mov esi, [src] ; Входная строка
    mov edi, [res] ; Выходная строка    
    mov ecx, [len] ; Длина
    xor eax, eax
 
L1: mov al, [esi]
    test eax, eax
    jz EX
    mov edx, 0
    mov ebx, esi
 
L2: mov al, [ebx]
    test eax, eax
    jz L3 ; флаг 0 
    cmp byte ptr [ebx], ' ' ; Количество символов до следующего пробела пишем в edx (персылаем байт)
    je L3
    inc edx
    inc ebx
    jmp L2
 
L3: cmp edx, ecx ; Если длина слова подходит, то копируем в итог
    je L4
    mov al, [ebx]
    test eax, eax
    jz EX
    inc ebx
    mov esi, ebx
    jmp L1
 
L4: test edx, edx ; копирование слова в итог
    jz L5
    dec edx
    mov al, [esi]
    mov [edi], al
    inc esi
    inc edi
    jmp L4
 
L5: mov al, [esi] ; конец копирования, вставляем пробел
    test eax, eax
    jz EX
    mov [edi], al
    inc edi
    inc esi
    jmp L1
 
EX: xor eax, eax
    mov [edi], al
    pop ecx
    pop edi ; Выход
    pop esi
    pop ebp
    ret
 
process endp
 
End DllMain

