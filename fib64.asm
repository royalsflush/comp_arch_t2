option casemap :none               ; case sensitive
 
extern  printf:near                ; printf

.code

;
; fib64.asm
;
; Copyright © 2012 - 2013 jones@scss.tcd.ie
;

;
; example mixing C/C++ and x64 assembly language
;
; _int64 fib(_int64 n)
; {
;   _int64 fi, fj, t;
;
;   if (n <= 1)
;       return n;
;
;   fi = 0; 
;   fj = 1;
;   while (n > 1) {
;       t = fj;
;       fj = fi + fj;
;       fi = t;
;       n--;
;   }
;   return fj;
;}
;
; parameter n       rcx
;

public      fib_x64                 ; make sure function name is exported

fib_x64:    mov     rax, rcx        ; rax = n
            cmp     rax, 1          ; if (n <= 1)
            jle     fib_x64_1       ; return n
            xor     rdx, rdx        ; fi = 0
            mov     rax, 1          ; fj = 1
fib_x64_0:  cmp     rcx, 1          ; while (n > 1)
            jle     fib_x64_1       ;
            add     rdx, rax        ; fi = fi + fj
            xchg    rdx, rax        ; swap fi and fj
            dec     rcx             ; n--
            jmp     fib_x64_0       ;
fib_x64_1:  ret                     ; return rax
    
;
;   _int64 xp2(_int64 a, _int64 b)
;   {
;       printf("a = %I64d b = %I64d a+b = %I64d\n", a, b, a + b);
;       return a + b;
;   }
;

;
; parameter a       rcx
; parameter b       rdx
;

fxp2        db      'a = %I64d b = %I64d a+b = %I64d', 0AH, 00H     ; string in code section,  OAH = LF

public      xp2                                 ; make sure function name is exported

xp2:        push    rbx                         ; save rbx
            sub     rsp, 32                     ; allocate shadow space {runtime error if not allocated}
            lea     r9, [rcx+rdx]               ; printf parameter 4 in r9 {a+b}
            mov     r8, rdx                     ; printf parameter 3 in r8 {b}
            mov     rdx, rcx                    ; printf parameter 2 in rdx {a}
            lea     rcx, fxp2                   ; printf parameter 1 in rcx {&fxp2}
            mov     rbx, r9                     ; save r9 in rbx so sum preserved across call printf
            call    printf                      ; call printf
            mov     rax, rbx                    ; rax = rbx {a+b}
            add     rsp, 32                     ; deallocate shadow space
            pop     rbx                         ; restore rbx
            ret                                 ; return
            
            end

; eof
