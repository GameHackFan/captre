*----------------------------------------------------------------------------------------------
* Title:        CAPTRE Color Confirmation
* Written by:   GameHackFan
* Date:         
* Description:  It ensures players can't pick the same color.
*----------------------------------------------------------------------------------------------

; ORG         $140600

                                        ; Block of code that saves some values for safety.
  MOVE.L      D0, ($7FF0, A5)           ; Stores D0 inside ($7FF0 + A5), saves D0 for safety.
  MOVE.L      D1, ($7FF4, A5)           ; Stores D1 inside ($7FF4 + A5), saves D1 for safety.
  MOVE.L      A1, ($7FF8, A5)           ; Stores A1 inside ($7FF8 + A5), saves A1 for safety.

                                        ; Block of code that fixes the color conflict.
  CLR.W       D0                        ; Clears D0.
  LEA         $FFA994, A1               ; Stores FFA994 inside A1, P1 memory region.
  BSR         $140650                   ; Calls the code that updates the color conflict flag.
  LEA         $FFAA94, A1               ; Stores FFAA94 inside A1, P2 memory region.
  BSR         $140650                   ; Calls the code that updates the color conflict flag.
  LEA         $FFAB94, A1               ; Stores FFAB94 inside A1, P3 memory region.
  BSR         $140650                   ; Calls the code that updates the color conflict flag.
  LEA         $FFAC94, A1               ; Stores FFAC94 inside A1, P4 memory region.
  BSR         $140650                   ; Calls the code that updates the color conflict flag.
  BSR         $140680                   ; Calls the code that fixes the color conflict.

                                        ; Block of code that restores the values.
  MOVE.L      ($7FF0, A5), D0           ; Stores ($7FF0 + A5) inside D0, restores D0 data.
  MOVE.L      ($7FF4, A5), D1           ; Stores ($7FF4 + A5) inside D1, restores D1 data.
  MOVE.L      ($7FF8, A5), A1           ; Stores ($7FF8 + A5) inside A1, restores A0 data.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $140650

                                        ; Block of code that updates the color conflict flag.
  TST.B       (A1)                      ; Compares 0 and (A1), the other player active flag.
  BEQ         $14066C                   ; If it is 0, it is not active, go to the last line.
  MOVE.B      ($A0, A1), D1             ; Stores ($A0 + A1) inside D1, the other player character ID.
  AND.W       #$03, D1                  ; D1 and 3, to ensure it is a valid character.
  CMP.B       ($A0, A0), D1             ; Compares ($A0 + A0) and D1, both players character ID.
  BNE         $14066C                   ; If they are not equal, go to the last line.
  MOVE.B      ($3A, A1), D1             ; Stores ($3A + A1) inside D1, the other player color ID.
  AND.W       #$1F, D1                  ; D1 and 1F, to ensure it is a valid pallete ID.
  BSET        D1, D0                    ; Sets D1 bit of D0 to 1, the other player color to the conflict mask.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $140680

                                        ; Block of code that changes the pallete ID to an unused pallete.
  MOVE.B      ($3A, A0), D1             ; Stores ($3A + A0) inside D1, current player color ID.
  AND.W       #$1F, D1                  ; D1 and 1F, to ensure it is a valid pallete ID.
  BTST        D1, D0                    ; Tests the D1 bit of D0, if the color is in use.
  BEQ         $140694                   ; If the bit is 0, ignore the 3 lines below.
  ADDQ.B      #1, D1                    ; Adds 1 to D1, the next color.
  AND.B       #3, D1                    ; D1 and 3, to force a valid color.
  BRA         $140688                   ; Jumps back to the third line.
  MOVE.W      A0, D0                    ; Stores A0 inside D0, the player memory region.
  SUB.W       #$A994, D0                ; Subtracts A994 from D0, P1 memory address.
  LSR.W       #3, D0                    ; Shifts right D0 bits by 3, the player ID flag.
  ADD.W       D0, D1                    ; Adds D0 to D1, the player ID flag.
  MOVE.B      D1, ($3A, A0)             ; Stores D1 inside ($3A + A0), the new color ID.
  MOVE.B      #$ED, ($3B, A0)           ; Stores ED inside ($3B + A0), custom pallete flag.
  RTS                                   ; Returns back to the routine that called this code.
  


; This module has routines that fixes color conflict
; when the players select their characters, not allowing 
; 2 characters with the same color to be selected, it 
; automatically grabs the next available color if a color is 
; already in use.
;
; $140600:  Handle Color Confirmation (Current Player)
; $140650:  Update The Color Conflict Flag (Current Player)
; $140680:  Color Conflict Fix (Current Player)