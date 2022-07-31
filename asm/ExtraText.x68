*----------------------------------------------------------------------------------------------
* Title:        CAPTRE Extra Text
* Written by:   GameHackFan
* Date:         
* Description:  It offers sprite drawing and text features.
*               It also has routines to draw the extra texts 
*               added to this hack.
*----------------------------------------------------------------------------------------------

; ORG         $140C00

                                        ; Block of code that prints anything in line, stops at 00.
  MOVE.W      #$C000, D0                ; Stores C000 inside D0, necessary value.
  MOVE.B      (A1)+, D0                 ; Stores (A1) inside D0 and incrementes A1, the sprite.
  TST.B       D0                        ; Compares 0 and D0.
  BEQ         $140C16                   ; If it is 0, go to the last line.
  MOVE.W      D0, (A0)                  ; Stores D0 inside (A0), the sprite in the screen region.
  MOVE.W      D1, ($2, A0)              ; Stores D1 inside ($2 + A0), the pallete ID.
  LEA         ($80, A0), A0             ; Stores ($80 + A0) inside A0, next sprite screen position.
  BRA         $140C04                   ; Jumps back to the 1st line.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $140C30

                                        ; Block of code that saves some values.
  MOVE.L      D0, ($7FE0, A5)           ; Stores D0 inside ($7FE0 + A5), saves it for safety.
  MOVE.L      D1, ($7FE4, A5)           ; Stores D1 inside ($7FE4 + A5), saves it for safety.
  MOVE.L      A0, ($7FE8, A5)           ; Stores A0 inside ($7FE8 + A5), saves it for safety.
  MOVE.L      A1, ($7FEC, A5)           ; Stores A1 inside ($7FEC + A5), saves it for safety.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $140C60

                                        ; Block of code that restore values.
  MOVE.L      ($7FE0, A5), D0           ; Stores ($7FE0 + A5) + D0 inside, restore the value.
  MOVE.L      ($7FE4, A5), D1           ; Stores ($7FE4 + A5) + D1 inside, restore the value.
  MOVE.L      ($7FE8, A5), A0           ; Stores ($7FE8 + A5) + A0 inside, restore the value.
  MOVE.L      ($7FEC, A5), A1           ; Stores ($7FEC + A5) + A1 inside, restore the value.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $140C90

                                        ; Block of code that prints the hack name and version in the screen.
  BSR         $140C30                   ; Calls the routine that saves values.
  MOVE.W      #$0F, D1                  ; Stores F inside D1, the pallete ID of the text, blue.
  LEA         $140D40, A1               ; Stores $140D40 inside A1, the hack name text address.
  LEA         $900444, A0               ; Stores $900444 inside A0, the screen region of the text.
  BSR         $140C00                   ; Calls the routine that prints the text in the screen.
  LEA         $140D70, A1               ; Stores $140D70 inside A1, the hack link address.
  LEA         $9002C8, A0               ; Stores $9002C8 inside A0, the screen region of the text.
  BSR         $140C00                   ; Calls the routine that prints the text in the screen.
  BSR         $140C60                   ; Calls the routine that restores the values.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $140CD0

                                        ; Block of code that prints the hack name and version in the screen.
  BSR         $140C30                   ; Calls the routine that saves values.
  MOVE.W      #$10, D1                  ; Stores 10 inside D1, the pallete ID of the text, yellow.
  LEA         $140D40, A1               ; Stores $140D40 inside A1, the hack name address.
  LEA         $900454, A0               ; Stores $900454 inside A0, the screen region of the text.
  BSR         $140C00                   ; Calls the routine that prints the text in the screen.
  LEA         $140D70, A1               ; Stores $140D70 inside A1, the text address.
  LEA         $9002D8, A0               ; Stores $9002D8 inside A0, the screen region of the text.
  BSR         $140C00                   ; Calls the routine that prints the text in the screen.
  BSR         $140C60                   ; Calls the routine that restores the values.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $140D10

                                        ; Block of code that prints the starting soon label.
  BSR         $140C30                   ; Calls the routine that saves values.
  LEA         $140DA0, A1               ; Stores $140DA0 inside A1, the text address.
  LEA         $9008E0, A0               ; Stores $9008E0 inside A0, the screen region of the text.
  MOVE.W      #$0F, D1                  ; Stores F inside D1, the pallete ID of the text, blue.
  BSR         $140C00                   ; Calls the routine that prints the text in the screen.
  BSR         $140C60                   ; Calls the routine that restores values.
  RTS                                   ; Returns back to the routine that called this code.



; This module has routines that print some texts in 
; the screen, mostly the hack name and the link 
; where the project of this hack is available.
; 
; 140C00: Prints Sprites in Line
; 140C30: Saves Values in Memory
; 140C50: Restore Values Saved in Memory
; 140C90: Print Hack Name and Link Text (Title Screen)
; 140CD0: Print Hack Name and Link Text (Select Screen)
; 140D10: Print Starting Soon Text (Select Screen)
;
; 140D40: Hack Name Text
;         65 52 64 61 75 6A 74 73 64 65 76 20 2E 31 20 30
;         62 28 20 79 61 47 65 6D 61 48 6B 63 61 46 29 6E
;
; 140D70: Hack Link Text
;         74 68 70 74 3A 73 2F 2F 69 67 68 74 62 75 63 2E
;         6D 6F 47 2F 6D 61 48 65 63 61 46 6B 6E 61 63 2F
;         70 61 72 74 00 65
;
; 140DA0: Starting Soon Text
;         74 53 72 61 69 74 67 6E 53 20 6F 6F 00 6E