*----------------------------------------------------------------------------------------------
* Title:        CAPTRE Feature Manager
* Written by:   GameHackFan
* Date:         
* Description:  Executes a bunch of code to provide a full feature.
*----------------------------------------------------------------------------------------------

  JMP         $140100.L                 ; Replace 6AC0.
  NOP

; ORG         $140100

                                        ; Block of code that handles character select mid game.
  BSR         $140400                   ; Calls the routine that handles selecting the character.
  TST.W       D0                        ; Compares 0 and D0, if character was changed.
  BEQ         $140110                   ; If it is 0, no change was made, ignore the 2 lines below.
  JSR         $3B88                     ; Calls the routine that handles drawing the character image.
  JSR         $3CDE                     ; Calls the routine that handles drawing the character name.
  BSR         $140500                   ; Calls the routine that handles selecting the color.
  MOVE.B      ($2811, A5), D0           ; Code from the original game that was replaced to jump to this code.
  AND.B       #$7F, D0                  ; Code from the original game that was replaced to jump to this code.
  JMP         $6AC8                     ; Jumps back to where it stopped in the original code.



  JMP         $140140.L                 ; Replace FD24.

; ORG         $140140

                                        ; Block of code that handles character confirmation on select screen.
  BSR         $140600                   ; Calls the color confirmation routine.
  BSR         $140760                   ; Calls the pallete replace routine.
  BSR         $140D10                   ; Calls the routine that draws starting soon in the screen.
  SUBQ.B      #1, (A6)                  ; Subtracts 1 from A6, reduces 1 coin.
  MOVE.B      #1, (A0)                  ; Code from the original game readjusted.
  RTS                                   ; Returns back to the routine that called this code.



  JMP         $140170.L                 ; Replace 678C.

; ORG         $140170

                                        ; Block of code that handles character confirmation mid game.
  BSR         $140600                   ; Calls the color confirmation routine.
  BSR         $140760                   ; Calls the pallete replace routine.
  SUBQ.B      #1, (A6)                  ; Subtracts 1 from A6, reduces 1 coin.
  MOVE.B      #1, (A0)                  ; Code from the original game readjusted.
  RTS                                   ; Returns back to the routine that called this code.



  JMP         $140190.L                 ; Replace 1BE02.
  NOP

; ORG         $140190

                                        ; Block of code that replaces all players palletes.
  BSR         $1407A0                   ; Calls the pallete replace routine for all players.
  BSR         $141320                   ; Calls the set boss amount routine.
  CMP.B       #2, ($28CE, A5)           ; Code from the original game that was replaced to jump to this code.
  BNE         $1401A2                   ; Code from the original game readjusted.
  JMP         $1BE0A                    ; Jumps back to where it stopped in the original code.
  JMP         $1BE14                    ; Code from the original game readjusted.
  


  JMP         $1401C0.L                 ; Replace FB4E.

; ORG         $1401C0

                                        ; Block of code that draws the hack texts in the select screen.
  BSR         $140CD0                   ; Calls the routine that draws the hack name and version.
  LEA         $90B808, A1               ; Code from the original game that was replaced to jump to this code.
  JMP         $FB54                     ; Jumps back to where it stopped in the original code.



  JMP         $1401E0.L                 ; Replace 98102.

; ORG         $1401E0

                                        ; Block of code that draws the hack texts in the title screen.
  BSR         $140C90                   ; Calls the routine that draws the hack name, version and link.
  BSR         $140550                   ; Calls the routine that cleans the color flags of all players. 
  BSR         $1407A0                   ; Calls the pallete replace routine for all players.
  JSR         $22DA                     ; Code from the original game that was replaced to jump to this code.
  JMP         $98108                    ; Jumps back to where it stopped in the original code.



; ORG         $FE22                     ; Replace FE22 (There is space enough to replace all the code).

                                        ; Block of code that handles player character select.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  BSR         $140400                   ; Calls the routine that handles selecting the character.
  BSR         $140500                   ; Calls the routine that handles selecting the color.
  JMP         $140450                   ; Calls the routine that draws the character image.
  JSR         $6594                     ; Calls the routine that cleans the HUD region.
  JSR         $3CDE                     ; Calls the routine that handles drawing the character name. 
  JSR         $6CBA                     ; Calls the routine that handles drawing the color label.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.



; This module has routines that execute several 
; other routines to ensure that the new features
; present in this hack will work as it should.
;
; 140100: Player Character Select (Mid Game)
; 140140: Character Confirmation (Select Screen)
; 140170: Character Confirmation (Mid Game)
; 140190: Pallete Replace (All Players)
; 1401C0: Draw Hack Texts (Select Screen)
; 1401E0: Draw Hack Texts and Reset Palletes (Title Screen)
; 00FE22: Player Character Select (Select Screen)