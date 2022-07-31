*----------------------------------------------------------------------------------------------
* Title:        CAPTRE Character Select
* Written by:   GameHackFan
* Date:         
* Description:  Allows the players to select their characters.
*----------------------------------------------------------------------------------------------

; ORG         $140400

                                        ; Block of code that handles the input press.
  MOVE.B      #3, D0                    ; Stores 3 inside D0, 2 left, 1 right.
  AND.B       (A4), D0                  ; D0 and (A4), current player KeyPress.
  TST.B       D0                        ; Compare 0 and D0.
  BEQ         $14042E                   ; If it is 0, button isn't down, go to the last block of code.
  AND.B       ($4, A4), D0              ; D0 and ($4 + A4), current player KeyDown/KeyUp.
  TST.B       D0                        ; Compare 0 and D0.
  BNE         $14042E                   ; If it is not 0, button is being hold, go to the last block of code.

                                        ; Block of code that changes the character ID.
  MOVE.B      #1, D0                    ; Stores 1 inside D0.
  AND.B       (A4), D0                  ; D0 and (A4), 2 is 0, 1 is 1.
  LSL.B       #1, D0                    ; Shifts left D0 bits by 1, 0 is 0, 1 is 2.
  SUBQ.B      #1, D0                    ; Subtracts D0 by 1, 0 is -1, 2 is 1.
  ADD.B       ($A0, A0), D0             ; Adds ($A0 + A0) inside D0, the character ID.
  AND.B       #3, D0                    ; D0 and 3, 3 is Baby's ID, last character.
  MOVE.B      D0, ($A0, A0)             ; Stores D0 inside ($A0 + A0), the new character ID.
  MOVE.B      #1, D0                    ; Stores 1 inside D0, a change happened.
  RTS                                   ; Returns back to the routine that called this code.

  MOVE.B      #0, D0                    ; Stores 0 inside D0, changes didn't happen.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $140450

                                        ; Block of code that draws the character image (select screen).
  LEA         $90B808, A1               ; Stores 90B808 inside A1, P1 character image screen region.
  MOVE.W      A4, D0                    ; Stores A4 inside D0, current player input address.
  SUB.W       #$A8A8, D0                ; Subtracts A8A8 from D0, P1 input region address, the result is the player ID.
  MULU.W      #$60, D0                  ; Multiples D0 by 60, image screen region distance.
  ADD.W       D0, A1                    ; Adds D0 to A1, the screen region shift for the current player.
  LEA         $1004E, A2                ; Stores 1004E inside A2, Mack the Knife image address.
  CLR.W       D0                        ; Clears D0.
  MOVE.B      ($A0, A0), D0             ; Stores ($A0 + A0) inside D0, the player selected character ID.
  MULU.W      #$24, D0                  ; Multiplies D0 by 24, character image ROM address distance.
  ADD.W       D0, A2                    ; Adds D0 to A2, the character image address shift.
  JSR         $F946                     ; Calls the routine that prints the image.
  JMP         $FE3A                     ; Jumps back to where it stopped in the new code.



; This module has routines that handle the character 
; select, a necessary feature because this hack 
; is made for the 4 players mode, which originally 
; does not allow the players to select their characters,
; having the characters being predefined based on 
; the player controller port.
;
; 140400: Handle Character Select (Current Player)
; 180450: Draw Character Image (Select Screen)