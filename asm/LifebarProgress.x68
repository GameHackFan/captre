*----------------------------------------------------------------------------------------------
* Title:        CAPTRE Lifebar Progress
* Written by:   GameHackFan
* Date:         
* Description:  Adds progress to all lifebar colors.
*----------------------------------------------------------------------------------------------

; ORG         $3F02                     ; Replace 3F02 (There is space enough to replace all the code).

                                        ; Block of code that calculates the lifebar progress, the pallete ID, and goes back to the original code.
  TST.W       D0                        ; Compares 0 and D0, minimum life bar value.
  BGT         $3F0A                     ; If it is greater than 0, ignore the 2 lines below.
  CLR.L       D0                        ; Clears D0
  BRA         $3F20                     ; Jumps to the the MOVE to D4 line. 
  MOVE.W      D0, D1                    ; Stores D0 inside D1, saves D0 value.
  CLR.L       D0                        ; Clears D0, ensures D0 higher bits are empty.
  MOVE.W      D1, D0                    ; Stores D1 inside D0, restores D0 value.
  DIVU.W      #$49, D0                  ; Divides D0 by 49, one lifebar is between 0 and 48.
  CMP.W       #6, D0                    ; Compares 6 and D0, maximum lifebar ID value.
  BLE         $3F1E                     ; If it is less or equals 6, ignore the line below.
  MOVE.W      #6, D0                    ; Stores 6 inside D0, maximum lifebar ID value.
  CLR.W       D4                        ; Clears D4, ensures D4 is properly empty.
  MOVE.B      ($0A, PC, D0.W), D4       ; Stores ($0A + PC + D0.W), the lifebar pallete.
  CLR.W       D0                        ; Clears D0.
  SWAP        D0                        ; Inverts D0 higher and lower bits, the lifebar value is in the higher bytes.
  BRA         $3F36                     ; Jumps to the line of code that prints the lifebar.
  NOP                                   ; No operation, does nothing.



; This module has a routine that ensures all lifebar 
; colors will show their progress.
; 
; 003F02: Lifebar Progress For All Colors
;
; 003F2C: Lifebar Pallete IDs (Data Below)
;         14 06 16 15 18 17 19 19 