 
.data

array: .word 1, 0, 1, 12, 0, 1, 4

.text

    la a0, array    # array
    li a1, 7        # array length
    li a2, 1        # key
    li a3, 4        # word length in bytes
    
prog:
    
    addi s0 a1 -1
    mul s0 s0 a3    # the offset of the last item of the array (index)
    add s0 a0 s0    # move the index to point to the last item of the arr
    beq a1 zero done  # If array[i] == a2, exit the loop
    
    loop_condition:

        lw t2, 0(s0)     # Load array[i] into t2
        beq t2 a2 done  # If array[i] == a2, exit the loop
        bge zero t2 loop_end  # If i <= 0, exit the loop

    loop_body:
        addi s0 s0 -4   # i++ (move to previus element, 4 bytes for word)
        j loop_condition # Jump back to condition check

    loop_end:
        # the key is not in the array
        addi s0 zero 0
    
done:   
    addi a7, zero, 10 
    ecall
