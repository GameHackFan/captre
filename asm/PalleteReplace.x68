*----------------------------------------------------------------------------------------------
* Title:        CAPTRE Pallete Replace
* Written by:   GameHackFan
* Date:         
* Description:  Replaces the palletes 0, 1, 2, 3 with the pallete 
*               selected by the players.
*----------------------------------------------------------------------------------------------

; ORG         $140700
  
                                        ; Block that calculates the character pallete offset.
  LEA         $1A0000, A1               ; Stores 1A0000 inside A1, the first pallete address.
  CLR.W       D0                        ; Clears D0.
  MOVE.B      ($A0, A0), D0             ; Stores ($A0 + A0) inside D0, the character ID.
  LSL.W       #8, D0                    ; Shifts left D0 bits by 8, 0 is 0, 1 is 100, 2 is 200, 3 is 300.
  ADD.W       D0, A1                    ; Adds D0 to A1, the character pallete offset.

                                        ; Block that calculates the pallete ID offset.
  CLR.W       D0                        ; Clears D0.
  MOVE.B      ($3A, A0), D0             ; Stores ($3A + A0) inside D0, the pallete ID.
  AND.W       #$1F, D0                  ; D0 and 1F, to ensure a valid pallete ID.
  LSL.W       #5, D0                    ; Shifts left D0 bits by 5, 0 is 0, 1 is 20, 2 is 40.
  ADD.W       D0, A1                    ; Adds D0 to A1, the pallete ID offset.

                                        ; Block that calculates the player pallete ID offset.
  LEA         $90C000, A2               ; Stores 90C000 to A2, first pallete region.
  MOVE.W      A4, D0                    ; Stores A4 inside D0, the player input address.
  SUB.W       #$A8A8, D0                ; Subtracts A8A8 from D0, P1 input address, the result is the player ID.
  LSL.W       #5, D0                    ; Shifts left D0 bits by 5, 0 is 0, 1 is 20, 2 is 40, 3 is 60, etc.
  ADD.W       D0, A2                    ; Adds D0 to A2, the player pallete ID region offset.

                                        ; Block of code that grabs the current brightness.
  MOVE.W      (A2), D1                  ; Stores (A2) inside D1, the 1st color of the pallete.
  AND.W       #$F000, D1                ; D1 and F000, the result is the current brightness.
  ADD.W       #$0FFF, D1                ; Adds 0FFF to D1, the rest of the brightness mask.

                                        ; Block of code that sets the pallete.
  MOVE.W      #$F, D0                   ; Stores F inside D0, the amount of iteration (executes F + 1).
  MOVE.W      (A1)+, D2                 ; Stores (A1) inside D2 and incremente A1, the color.
  AND.W       D1, D2                    ; D2 and D1, adds the current brightness to the color.
  MOVE.W      D2, (A2)+                 ; Stores D2 inside (A2) and increment A2, sets the color.
  DBRA        D0, $14073C               ; Loops back to the code that sets the color, 2nd line of this block.
  RTS                                   ; Returns back to the caller of this routine.



; ORG         $140760

                                        ; Block that sets the player pallete.
  MOVE.L      D0, ($7FEC, A5)           ; Stores D0 inside ($7FEC, A5), saves D0 for safety.
  MOVE.L      D1, ($7FF0, A5)           ; Stores D1 inside ($7FF0, A5), saves D1 for safety.
  MOVE.L      D2, ($7FF4, A5)           ; Stores D2 inside ($7FF4, A5), saves D2 for safety.
  MOVE.L      A1, ($7FF8, A5)           ; Stores A1 inside ($7FF8, A5), saves A1 for safety.
  MOVE.L      A2, ($7FFC, A5)           ; Stores A2 inside ($7FFC, A5), saves A2 for safety.
  BSR         $140700                   ; Calls the routine that sets the pallete.
  MOVE.L      ($7FEC, A5), D0           ; Stores ($7FEC, A5) inside D0, restores D0 value.
  MOVE.L      ($7FF0, A5), D1           ; Stores ($7FF0, A5) inside D1, restores D1 value.
  MOVE.L      ($7FF4, A5), D2           ; Stores ($7FF4, A5) inside D2, restores D2 value.
  MOVE.L      ($7FF8, A5), A1           ; Stores ($7FF8, A5) inside A1, restores A1 value.
  MOVE.L      ($7FFC, A5), A2           ; Stores ($7FF4, A5) inside A2, restores A2 value.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $1407A0

                                        ; Block that saves values.
  MOVE.L      D0, ($7FE4, A5)           ; Stores D0 inside ($7FE4, A5), saves D0 for safety.
  MOVE.L      D1, ($7FE8, A5)           ; Stores D1 inside ($7FE8, A5), saves D1 for safety.
  MOVE.L      D2, ($7FEC, A5)           ; Stores D2 inside ($7FEC, A5), saves D2 for safety.
  MOVE.L      A0, ($7FF0, A5)           ; Stores A0 inside ($7FF0, A5), saves A0 for safety.
  MOVE.L      A1, ($7FF4, A5)           ; Stores A1 inside ($7FF4, A5), saves A1 for safety.
  MOVE.L      A2, ($7FF8, A5)           ; Stores A2 inside ($7FF8, A5), saves A2 for safety.
  MOVE.L      A4, ($7FFC, A5)           ; Stores A4 inside ($7FFC, A5), saves A4 for safety.

                                        ; Block of code that sets P1 pallete.
  LEA         $FFA994, A0               ; Stores FFA994 inside A0, P1 memory address.
  LEA         $FFA8A8, A4               ; Stores FFA8A8 inside A4, P1 input address.
  BSR         $140700                   ; Calls the routine that sets the pallete.

                                        ; Block of code that sets P2 pallete.
  LEA         $FFAA94, A0               ; Stores FFAA94 inside A0, P2 memory address.
  LEA         $FFA8A9, A4               ; Stores FFA8A9 inside A4, P2 input address.
  BSR         $140700                   ; Calls the routine that sets the pallete.

                                        ; Block of code that sets P3 pallete.
  LEA         $FFAB94, A0               ; Stores FFAB94 inside A0, P3 memory address.
  LEA         $FFA8AA, A4               ; Stores FFA8AA inside A4, P3 input address.
  BSR         $140700                   ; Calls the routine that sets the pallete.

                                        ; Block of code that sets P4 pallete.
  LEA         $FFAC94, A0               ; Stores FFAC94 inside A0, P4 memory address.
  LEA         $FFA8AB, A4               ; Stores FFA8AB inside A4, P4 input address.
  BSR         $140700                   ; Calls the routine that sets the pallete.

  MOVE.L      ($7FE4, A5), D0           ; Stores ($7FE4, A5) inside D0, restores D0 value.
  MOVE.L      ($7FE8, A5), D1           ; Stores ($7FE8, A5) inside D1, restores D1 value.
  MOVE.L      ($7FEC, A5), D2           ; Stores ($7FEC, A5) inside D2, restores D2 value.
  MOVE.L      ($7FF0, A5), A0           ; Stores ($7FF0, A5) inside A0, restores A0 value.
  MOVE.L      ($7FF4, A5), A1           ; Stores ($7FF4, A5) inside A1, restores A1 value.
  MOVE.L      ($7FF8, A5), A2           ; Stores ($7FF8, A5) inside A2, restores A2 value.
  MOVE.L      ($7FFC, A5), A4           ; Stores ($7FFC, A5) inside A4, restores A4 value.
  RTS                                   ; Returns back to the routine that called this code.



; This module provides routines that handle replacing 
; the palletes 0, 1, 2 and 3 with the palletes the 
; players selected, based on the character they also
; selected.
; 
; $140700: Replace Pallete
; $140760: Replace Pallete (Current Player)
; $1407A0: Replace Pallete (All Players)