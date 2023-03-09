*----------------------------------------------------------------------------------------------
* Title:        CAPTRE Color Confirmation
* Written by:   GameHackFan
* Date:         
* Description:  It ensures players can't pick the same color.
*----------------------------------------------------------------------------------------------

; ORG         $140600

                                        ; Block of code that fixes the color conflict.
  CLR.W       D0                        ; Clears D0.
  LEA         ($2994, A5), A1           ; Stores $2994 + A5 inside A1, player 1 memory address.
  BSR         $140640                   ; Calls the code that updates the color conflict flag.
  LEA         ($2A94, A5), A1           ; Stores $2A94 + A5 inside A1, player 2 memory address.
  BSR         $140640                   ; Calls the code that updates the color conflict flag.
  LEA         ($2B94, A5), A1           ; Stores $2B94 + A5 inside A1, player 3 memory address.
  BSR         $140640                   ; Calls the code that updates the color conflict flag.
  LEA         ($2C94, A5), A1           ; Stores $2C94 + A5 inside A1, player 4 memory address.
  BSR         $140640                   ; Calls the code that updates the color conflict flag.
  BSR         $140680                   ; Calls the code that fixes the color conflict.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $140640

                                        ; Block of code that updates the color conflict flag.
  CMP.W       A1, A0                    ; Compares A1 and A0, checking player and current player.
  BEQ         $140660                   ; If it is equals, both players are the same, go to RTS line.
  TST.B       (A1)                      ; Compares 0 and (A1), the other player active flag.
  BEQ         $140660                   ; If it is 0, it is not active, go to the last line.
  MOVE.B      ($A0, A1), D1             ; Stores ($A0 + A1) inside D1, the other player character ID.
  AND.W       #$03, D1                  ; D1 and 3, to ensure it is a valid character.
  CMP.B       ($A0, A0), D1             ; Compares ($A0 + A0) and D1, both players character ID.
  BNE         $140660                   ; If they are not equal, go to the last line.
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
  AND.B       #7, D1                    ; D1 and 7, to force a valid color ID.
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
; $140640:  Update The Color Conflict Flag (Current Player)
; $140680:  Color Conflict Fix (Current Player)