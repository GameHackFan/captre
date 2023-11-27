*----------------------------------------------------------------------------------------------
* Title:        CAPTRE Player Character Randomizer
* Written by:   GameHackFan
* Date:         
* Description:  Randomizes the character for every area if
*               the randomize flag is active.
*               Select the character pressing Start to do that.
*----------------------------------------------------------------------------------------------

; ORG         $141500

                                        ; Block of code that sets the randomizer flag.
  MOVE.W      A0, D0                    ; Stores A0 inside D0, current player address.
  SUB.W       #$A994, D0                ; Subtracts A994 from D0, subtracts P1 address.
  LSR.W       #$8, D0                   ; Shifts right D0 bits by 8, to get the player ID.
  CLR.W       D1                        ; Clears D1.
  BSET        D0, D1                    ; Sets the D0 bit of D1 to 1, the player start input bit index.
  AND.B       ($28A6, A5), D1           ; D1 and ($28A6 + A5), keeps the current player start press data.
  ADD.W       #$7F10, D0                ; Adds 7F10 to D0, the randomizer flag memory region shift.
  MOVE.B      D1, (A5, D0.W)            ; Stores D1 inside (A5 + D0.W), the randomizer flag.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $141570

                                        ; Block of code that randomizes a character for the current player.
  MOVE.W      A0, D0                    ; Stores A0 inside D0, current player address.
  SUB.W       #$A994, D0                ; Subtracts A994 from D0, subtracts P1 address.
  LSR.W       #$8, D0                   ; Shifts right D0 bits by 8, to get the player ID.
  ADD.W       #$7F10, D0                ; Adds 7F10 to D0, the randomizer flag memory region shift.
  TST.B       (A5, D0.W)                ; Compares 0 and (A5 + D0.W), the player randomizer flag.
  BEQ         $14159A                   ; If it is 0, go to the RTS line.
  BSR         $1417B0                   ; Calls the code that randomizes 1 to 16 times a value inside D6.
  AND.W       #$3, D6                   ; D6 and 3, there are only 4 playable characters.
  MOVE.B      D6, ($A0, A0)             ; Stores D6 inside ($A0 + A0), the randomized character ID.
  BSR         $1417B0                   ; Calls the code that randomizes 1 to 16 times a value inside D6.
  AND.W       #$7, D6                   ; D6 and 7, there are only 8 available colors.
  MOVE.B      D6, ($3A, A0)             ; Stores D6 inside ($3A + A0), the randomized pallete ID.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $1415C0

                                        ; Block of code that randomizes the characters for all players.
  LEA         ($2994, A5), A0           ; Stores $2994 + A5 inside A0, player 1 memory address.
  BSR         $141570                   ; Calls the routine that randomizes a character for P1.
  BSR         $140600                   ; Calls the color conflict and character flags routine.
  BSR         $141610                   ; Calls the routine that fixes the shuryken bug.
  LEA         ($2A94, A5), A0           ; Stores $2A94 + A5 inside A0, player 2 memory address.
  BSR         $141570                   ; Calls the routine that randomizes a character for P1.
  BSR         $140600                   ; Calls the color conflict and character flags routine.
  BSR         $141610                   ; Calls the routine that fixes the shuryken bug.
  LEA         ($2B94, A5), A0           ; Stores $2B94 + A5 inside A0, player 3 memory address.
  BSR         $141570                   ; Calls the routine that randomizes a character for P1.
  BSR         $140600                   ; Calls the color conflict and character flags routine.
  BSR         $141610                   ; Calls the routine that fixes the shuryken bug.
  LEA         ($2C94, A5), A0           ; Stores $2C94 + A5 inside A0, player 4 memory address.
  BSR         $141570                   ; Calls the routine that randomizes a character for P1.
  BSR         $140600                   ; Calls the color conflict and character flags routine.
  BSR         $141610                   ; Calls the routine that fixes the shuryken bug.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $141610

                                        ; Block of code that fixes the shuriken bug.
  CMP.B       #$2, ($A0, A0)            ; Compares 2 and ($A0 + A0), if character ID is 2, ginzu.
  BEQ         $14162E                   ; If it is 2, go to the RTS line.
  TST.W       ($72, A0)                 ; Compares 0 and ($72 + A0), the weapon address.
  BEQ         $14162E                   ; If it is 0, the player has no weapon, go to the RTS line.  
  MOVE.W      ($72, A0), A1             ; Stores ($72 + A0) inside A1, the player weapon address.
  CMP.B       #$E, ($39, A1)            ; Compares E and ($39 + A1), if it is the shuryken weapon ID.
  BNE         $14162E                   ; If it is not E, go to the RTS line.
  CLR.B       ($39, A1)                 ; Clears ($39 + A1), makes it 0, the revolver weapon ID.
  RTS                                   ; Returns back to the routine that called this code.



  JMP         $141640.L                 ; Replaces A97CE.

; ORG         $141640

                                        ; Block of code that randomizes the characters for all players.
  BSR         $141700                   ; Calls the routine that saves some registers values.
  BSR         $1415C0                   ; Calls the routine that randomizes all players characters.
  BSR         $141730                   ; Calls the routine that restore some registers values.
  MOVEQ       #$0, D0                   ; Code from the original game that was replaced to jump to this code.
  MOVE.B      D0, ($28D0, A5)           ; Code from the original game that was replaced to jump to this code.
  JMP         $A97D4                    ; Jumps back to where it stopped in the original code.



  JMP         $141670.L                 ; Replaces AA81C.

; ORG         $141670

                                        ; Block of code that randomizes the characters for all players.
  BSR         $141700                   ; Calls the routine that saves some registers values.
  BSR         $1415C0                   ; Calls the routine that randomizes all players characters.
  BSR         $141730                   ; Calls the routine that restore some registers values.
  ADDQ.B      #$1, ($28D0, A5)          ; Code from the original game that was replaced to jump to this code.
  CLR.B       ($7831, A5)               ; Code from the original game readjusted.
  JMP         $AA826                    ; Jumps back to where it stopped in the original code.



; This module has several routines needed to ensure the
; player character randomizer feature will work properly.
; To activate the character randomizer, select the character
; pressing start.
;
; 141500: Sets the Randomizer Flag.
; 141570: Randomizes a Character and Color (Current Player).
; 1415C0: Randomizes a Character and Color (All Players).
; 141610: Fixes Shuriken Bug (Current Player)
; 141640: Randomizes a Character and Color (All Players Stage Start).
; 141670: Randomizes a Character and Color (All Players Stage Area Change).
;
; 141550: Prime Numbers Used By the Randomizer (Add the text bytes bellow).
;         0B44 4B56 CD67 0778