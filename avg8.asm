; This is the assembly code that will take the moving
; average of 8 numbers.
;
;
MOV r0,0    ; Initialize the first seven locations of the data segment with 0
ST [0000],r0
ST [0001],r0
ST [0002],r0
ST [0003],r0
ST [0004],r0
ST [0005],r0
ST [0006],r0
;
;
MOV r4,0    ; This register is now our pointer for the start of the next average in DS (Average Pointer)
MOV r5,7    ; This register is now our pointer for the next place to store values in DS (Start Pointer)
;
;
loop:
INP r0  ; This register is now accepting user input
ST [r5],r0    ; Store the value in data segment
ADD r5,1    ; Increment r5 for next store address in DS
MOV r1,r4   ; Load the current average pointer location to r1
LD r2,[r1]  ; Load values to r2 and r3 and add (2/8 summed)
ADD r1,1
LD r3,[r1]
ADD r1,1
ADD r2,r3
LD r3,[r1]  ; Load new value to r3 and add to sum (3/8 summed)
ADD r1,1
ADD r2,r3
LD r3,[r1]  ; (4/8 summed)
ADD r1,1
ADD r2,r3
LD r3,[r1]  ; (5/8 summed)
ADD r1,1
ADD r2,r3
LD r3,[r1]  ; (6/8 summed)
ADD r1,1
ADD r2,r3
LD r3,[r1]  ; (7/8 summed)
ADD r1,1
ADD r2,r3
LD r3,[r1]  ; (8/8 summed)
ADD r2,r3
ADD r1,1
;
;
MOV r3,8
DIV r2,r3   ; Divide the sum by 8
PRT r2  ; Print average to screen
;
;
ADD r4,1
ADD r1,1
JNE r1,r5
