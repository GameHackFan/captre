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
  LEA         $90C000, A6               ; Stores 90C000 to A6, first pallete region.
  MOVE.W      A0, D0                    ; Stores A0 inside D0, current player address.
  SUB.W       #$A994, D0                ; Subtracts A994 from D0, subtracts P1 address.
  LSR.W       #$3, D0                   ; Shifts right D0 bits by 3, 0 is 0, 1 is 20, 2 is 40, 3 is 60.
  ADD.W       D0, A6                    ; Adds D0 to A6, the player pallete ID region offset.

                                        ; Block of code that grabs the current brightness.
  MOVE.W      (A6), D1                  ; Stores (A6) inside D1, the 1st color of the pallete.
  AND.W       #$F000, D1                ; D1 and F000, the result is the current brightness.
  ADD.W       #$0FFF, D1                ; Adds 0FFF to D1, the rest of the brightness mask.

                                        ; Block of code that sets the pallete.
  MOVE.W      #$F, D0                   ; Stores F inside D0, the amount of iteration (executes F + 1).
  MOVE.W      (A1)+, D6                 ; Stores (A1) inside D6 and incremente A1, the color.
  AND.W       D1, D6                    ; D6 and D1, adds the current brightness to the color.
  MOVE.W      D6, (A6)+                 ; Stores D6 inside (A6) and increment A6, sets the color.
  DBRA        D0, $14073C               ; Loops back to the code that sets the color, 2nd line of this block.
  RTS                                   ; Returns back to the caller of this routine.


; ORG         $140780

                                        ; Block of code that replaces all players palletes.
  LEA         ($2994, A5), A0           ; Stores ($2994 + A5) inside A0, P1 memory address.
  BSR         $140700                   ; Calls the routine that sets the pallete.
  LEA         ($2A94, A5), A0           ; Stores ($2A94 + A5) inside A0, P2 memory address.
  BSR         $140700                   ; Calls the routine that sets the pallete.
  LEA         ($2B94, A5), A0           ; Stores ($2B94 + A5) inside A0, P3 memory address.
  BSR         $140700                   ; Calls the routine that sets the pallete.
  LEA         ($2C94, A5), A0           ; Stores ($2C94 + A5) inside A0, P4 memory address.
  BSR         $140700                   ; Calls the routine that sets the pallete.
  RTS                                   ; Returns back to the routine that called this code.



; This module provides routines that handle replacing the
; palletes 0, 1, 2 and 3 with the palletes the players 
; selected, based on the character they also selected.
; 
; $140700: Replace Pallete (Current Player)
; $140780: Replace Pallete (All Players)