*----------------------------------------------------------------------------------------------
* Title:        CAPTRE Coin Score Fix
* Written by:   GameHackFan
* Date:         
* Description:  Fixes the coin score. Maximum value is 9.
*----------------------------------------------------------------------------------------------

  JMP         $140F00.L                 ; Replace 676A
  NOP

; ORG         $140F00

                                        ; Block of code that fixes the coin score.
  MOVE.B      ($E3, A0), D1             ; Stores ($E2 + A0) inside D1, current player coin score.
  AND.B       #9, D1                    ; D1 and 9, to keep only the coin score.
  CMP.B       #8, D1                    ; Compares 8 to D1, current coin score.
  BHI         $140F12                   ; If it is bigger than 8, ignore the line below.
  ADDQ.W      #1, ($E2, A0)             ; Adds 1 to ($E2, A0), the coin score score.
  JMP         $6772                     ; Jumps back to where it stopped in the original code.



; This module has a routine that fixes the coins score.
; Since it was changed how 4 players play mode works, this 
; is a necessary fix. The coin score maximum value is 9.
; 
; 140F00: Coin Score Fix (Current Player)