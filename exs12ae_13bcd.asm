.data
arrayBytes: .byte 5, 7, 2, -10, 4
arrayWords: .word 1, 2, 6, -1, 8, 0
str:	.asciz "Isto nao foi gerado pelo chatGPT"
vogais: .asciz "aeiouAEIOU"

.text
	# testar 12.a)
	la a0, arrayBytes
	li a1, 5
	jal maxB       # ver resultado em a0
	li a7, 10	   # fim de programa
	ecall
	
	# testar 12.e)
#	la a0,vetor
li a1,6
jal  ra, nImpar

la t0,arrayWords
sw a0,0(t0)

li   a7, 1             # imprime o inteiro em a0
ecall

li   a7, 10            # termina
ecall

	
la a0,str #endereço da cadeia=a0
li a1,'a'  #define o caracter a prourar
jal ra,nChar #chama a sub-rotina

la t0,arrayWords
sw a0,0(t0)

li a7,1
ecall 

li a7,10
ecall 

	# testar 13.c)
#	la a0, str
#	jal nWords
#	li a7, 10  	   # fim de programa
#	ecall

	# testar 13.d)		
#	la a0, str
#	jal nVogais
#	li a7, 10	   # fim de programa
#	ecall
	
maxB:   # a0 = endereço do array e a1 = tamanho
	lb   t0, (a0)   # máximo inicial
iter:	addi a1, a1, -1
	beq  a1, zero, fim
	addi a0, a0, 1  # Endereço próximo 
	lb   t1, (a0)
	bge  t0, t1, iter
	mv   t0, t1
	j    iter
fim:    mv   a0, t0  # Máximo encontrado		
	ret

nImpar: 

mv t0,a0
mv t1,a1
li t2,0  #Conta os ímpares

conta_impares_loop:

beq t1,zero,conta_impares_fim
lw t3,0(t0)
andi t3,t3,1 #isola o bit 0
add  t2,t2,t3 #soma 0 ou 1
addi t0, t0, 4         # próximo elemento (word = 4 bytes)
addi t1, t1, -1
    j   conta_impares_loop
       
conta_impares_fim:
mv a0,t2
ret




nChar:  
mv t0,a0
li t2,0

contar_chars_loop:
lb t3,0(a0)
beq t3,zero,contar_char_fim
bne t3,zero,contar_char_seguinte
addi t2,t2,1

contar_char_seguinte:
 addi t0,t0,1
 
 
contar_char_fim:
mv a1,t2
ret 


nWords:
	
	

nVogais: # para fazerem como TPC
	ret
