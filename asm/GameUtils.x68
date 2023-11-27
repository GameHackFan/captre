*----------------------------------------------------------------------------------------------
* Title:        CAPTRE Game Utils
* Written by:   GameHackFan
* Date:         
* Description:  It has routines to save and restore register values.
*----------------------------------------------------------------------------------------------

; ORG         $141700

                                        ; Block of code that saves some register values.
  MOVE.L      D0, ($7FE0, A5)           ; Stores D0 inside ($7FE0 + A5), saves D0 value for safety.
  MOVE.L      D1, ($7FE4, A5)           ; Stores D1 inside ($7FE4 + A5), saves D1 value for safety.
  MOVE.L      D6, ($7FE8, A5)           ; Stores D6 inside ($7FE8 + A5), saves D6 value for safety.
  MOVE.L      A0, ($7FEC, A5)           ; Stores A0 inside ($7FEC + A5), saves A0 value for safety.
  MOVE.L      A1, ($7FF0, A5)           ; Stores A1 inside ($7FF0 + A5), saves A1 value for safety.
  MOVE.L      A6, ($7FF4, A5)           ; Stores A6 inside ($7FF4 + A5), saves A6 value for safety.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $141730

                                        ; Block of code that restore some register values.
  MOVE.L      ($7FE0, A5), D0           ; Stores ($7FE0 + A5) inside D0, restores D0 value.
  MOVE.L      ($7FE4, A5), D1           ; Stores ($7FE4 + A5) inside D1, restores D1 value.
  MOVE.L      ($7FE8, A5), D6           ; Stores ($7FE8 + A5) inside D6, restores D6 value.
  MOVE.L      ($7FEC, A5), A0           ; Stores ($7FEC + A5) inside A0, restores A0 value.
  MOVE.L      ($7FF0, A5), A1           ; Stores ($7FF0 + A5) inside A1, restores A1 value.
  MOVE.L      ($7FF4, A5), A6           ; Stores ($7FF4 + A5) inside A6, restores A6 value.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $141760

                                        ; Block of code that randomizes a value inside D5.
  CLR.L       D6                        ; Clears D6.
  TST.W       ($7F1C, A5)               ; Compares 0 and ($7F1C + A5), amount of times randomized.
  BEQ         $14176E                   ; If it is 0, change the seed ignore the 2 lines below.
  MOVE.W      ($7F1E, A5), D6           ; Stores ($7F1E + A5) inside D6, current seed.
  BNE         $141776                   ; If it is not 0, ignore the 2 lines below.
  MOVE.W      ($2810, A5), D6           ; Stores ($2810 + A5) inside D6, a value used as seed by the game.
  ADD.W       ($119A, A5), D6           ; Adds ($119A + A5) to D6, stage frames passed.
  ADD.W       #$FC15, D6                ; Adds FC15 to D6, part of the randomizer calculation.
  MULU.W      #$2AB, D6                 ; Multiplies D6 by 2AB, part of the randomizer calculation.
  MOVE.L      D6, D1                    ; Stores D6 inside D1, part of the randomizer calculation.
  LSR.L       #$8, D1                   ; Shifts right D1 bits by 8, part of the randomizer calculation.
  LSR.L       #$8, D1                   ; Shifts right D1 bits by 8, part of the randomizer calculation.
  EOR.L       D1, D6                    ; D6 exclusive or D1, part of the randomizer calculation.
  ADDQ.W      #$1, ($7F1C, A5)          ; Adds 1 to ($7F1C + A5), the amount of times it randomized.
  AND.L       #$00FFFF, D6              ; D6 and FFFF, 16 bits randomizer.
  MOVE.W      D6, ($7F1E, A5)           ; Stores D5 inside ($7F1E + A5), the new seed.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $1417B0

                                        ; Block of code that randomizes 1 to 16 times a value inside D6.
  MOVE.W      ($2810, A5), D0           ; Stores ($2810 + A5) inside D0, a value used as seed by the game.
  ADD.W       ($119A, A5), D0           ; Adds ($119A + A5) to D0, stage frames passed.
  AND.W       #$F, D0                   ; D0 and F, values from 0 to F, 1 to 16 iterations.
  BSR         $141760                   ; Calls the code that randomizes a value.
  DBRA        D0, $1417BC               ; Loops back to the code that randomizes a value, line above.
  RTS                                   ; Returns back to the routine that called this code.


; This module has a routines that saves and restore registers 
; values. 
;
; 141700: Saves D0, D1, D6, A0, A1, A6 in RAM at FFFFE0.
; 141730: Restores D0, D1, D6, A0, A1, A6 from RAM at FFFFE0.
; 141760: Randomizes a Value In D6
; 1417B0: Randomizes a Value In D6 (1 to 16 Iterations)