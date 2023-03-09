*----------------------------------------------------------------------------------------------
* Title:        CAPTRE Color Select
* Written by:   GameHackFan
* Date:         
* Description:  Allows the players to select the color of their characters.
*----------------------------------------------------------------------------------------------

; ORG         $140500

                                        ; Block of code that handles the input press.
  MOVE.B      #$C, D0                   ; Stores C inside D0, 8 up, 4 down.
  AND.B       (A4), D0                  ; D0 and (A4), current player KeyPress.
  TST.B       D0                        ; Compare 0 and D0.
  BEQ         $14052E                   ; If it is 0, button isn't down, go to the last block of code.
  AND.B       ($4, A4), D0              ; D0 and ($4 + A4), current player KeyDown/KeyUp.
  TST.B       D0                        ; Compare 0 and D0.
  BNE         $14052E                   ; If it is not 0, button is being hold, go to the last block of code.

                                        ; Block of code that changes the color ID.
  MOVE.B      (A4), D0                  ; Stores (A4) inside D0, player input.
  LSR.B       #2, D0                    ; Shifts right D0 bits by 2, 8 is 2, 4 is 1.
  AND.B       #2, D0                    ; D0 and 2, 2 is 2, 1 is 0.
  SUBQ.B      #1, D0                    ; Subtracts D0 by 1, 2 is 1, 0 is -1.
  ADD.B       ($3A, A0), D0             ; Adds ($3A + D0) to D0, the player color.
  AND.B       #7, D0                    ; D0 and 7, 7 is the last valid color ID.
  MOVE.B      D0, ($3A, A0)             ; Stores D0 inside ($3A + A0), the new color ID.
  MOVE.B      #1, D0                    ; Stores 1 inside D0, a change happened.
  RTS                                   ; Returns back to the routine that called this code.

                                        ; Block of code that doesn't change the color ID.
  MOVE.B      #0, D0                    ; Stores 0 inside D0, changes didn't happen.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $140550

                                        ; Block of code that cleans all players color flags.
  CLR.W       ($29CE, A5)               ; Clears ($29CE + A5), remove P1 color flags.
  CLR.W       ($2ACE, A5)               ; Clears ($2ACE + A5), remove P2 color flags.
  CLR.W       ($2BCE, A5)               ; Clears ($2BCE + A5), remove P3 color flags.
  CLR.W       ($2CCE, A5)               ; Clears ($2CCE + A5), remove P4 color flags.
  RTS                                   ; Returns back to the routine that called this code.



; This module has routines that handle the color select, 
; there will be at least 4 colors available, the 
; readjusted hack allows players to select the same 
; character, so more colors are needed to avoid having
; the same character with the same color, which will
; cause confusion.
;
; 140500: Handle Color Select (Current Player)
; 140550: Clean Player Color Flags (All Players)