*----------------------------------------------------------------------------------------------
* Title:        CAPTRE Ice Fix
* Written by:   GameHackFan
* Date:         
* Description:  It fixes enemies that behaves in a buggy way when 
*               they are hit by ice.
*----------------------------------------------------------------------------------------------

  JMP         $140A00                   ; Replace 48620.
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP

; ORG         $140A00

                                        ; Block of code that in case the dolg is hit by ice, he gets knocked down, gets dizzy otherwise.
  CMP.W       #$18, ($6, A0)            ; Compares 18 and ($6 + A0), turn into ice cube action.
  BNE         $140A18                   ; If it is not 18, ignore the 4 lines below.
  MOVE.B      #$2,  (A0)                ; Stores 2 inside (A0), character active flag for being immortal.
  MOVE.W      #$0C, ($6, A0)            ; Stores 0C inside ($6 + A0), the action of being knocked down.
  CLR.W       ($8, A0)                  ; Clears ($8 + A0), resets the action to the beginning.
  BRA         $140A28                   ; Jumps to the last line of code.
  MOVE.B      #$1,  (A0)                ; Code from the original game that was replaced to jump to this code.
  MOVE.W      #$1C, ($6, A0)            ; Code from the original game that was replaced to jump to this code.
  MOVE.W      #$0C, ($8, A0)            ; Code from the original game that was replaced to jump to this code.
  JMP         $48632                    ; Jumps back to where it stopped in the original code.



  JSR         $140A40                   ; Replace 43ECC, 55982.
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP

; ORG         $140A40

                                        ; Block of code that in case the enemy is hit by ice, he gets knocked down, gets dizzy otherwise.
  CMP.W       #$18, ($6, A0)            ; Compares 18 and ($6 + A0), turn into ice cube action.
  BNE         $140A58                   ; If it is not 18, ignore the 4 lines below.
  MOVE.B      #$2,  (A0)                ; Stores 2 inside (A0), character active flag for being immortal.
  MOVE.W      #$0C, ($6, A0)            ; Stores 0C inside ($6 + A0), the action of being knocked down.
  CLR.W       ($8, A0)                  ; Clears ($8 + A0), resets the action to the beginning.
  RTS                                   ; Returns back to the routine that called this code.
  MOVE.B      #$1,  (A0)                ; Code from the original game that was replaced to jump to this code.
  MOVE.W      #$1C, ($6, A0)            ; Code from the original game that was replaced to jump to this code.
  MOVE.W      #$10, ($8, A0)            ; Code from the original game that was replaced to jump to this code.
  RTS                                   ; Returns back to the routine that called this code.



  JSR         $140A80.L                 ; Replace 43D98, 48512, 5584E.
  NOP
  NOP

; ORG         $140A80

                                        ; Block of code that in case the enemy is hit by ice mid air, he gets knocked down, gets dizzy otherwise.
  MOVE.B      #$2, (A0)                 ; Code from the original game readjusted.
  ADDQ.W      #$2, ($8, A0)             ; Code from the original game that was replaced to jump to this code.
  CMP.W       #$18, ($6, A0)            ; Compares 18 and ($6 + A0), turn into ice cube action.
  BNE         $140A9A                   ; If it is not 18, go to the last line.
  MOVE.W      #$0C, ($6, A0)            ; Stores 0C inside ($6 + A0), the action of being knocked down.
  CLR.W       ($8, A0)                  ; Clears ($8 + A0), resets the action to the beginning.
  RTS                                   ; Returns back to the routine that called this code.



  JMP         $140AC0.L                 ; Replace 7E432.
  NOP
  NOP
  NOP

; ORG         $140AC0

                                        ; Block of code that checks if Doppel was hit by ice.
  MOVE.W      ($60, A0), D0             ; Code from the original game that was replaced to jump to this code.
  CMP.W       #$C, ($6, A0)             ; Compares C and ($6 + A0), knocked down action.
  BNE         $140ADA                   ; If it is not C, go to the last block of code.

                                        ; Block of code that handles being hit by ice properly.
  MOVE.L      #$FE0, ($26, A0)          ; Stores FE0 inside ($26 + A0), to clean the bugged data.
  JMP         $7E442                    ; Jumps back to where it stopped in the original code.

                                        ; Block of code that executes the code replaced and goes back.
  CMP.W       ($E, A0), D0              ; Code from the original game that was replaced to jump to this code.
  BEQ         $140AD4                   ; Code from the original game readjusted.
  JMP         $7E43E                    ; Code from the original game readjusted.



  JMP         $140B20.L                 ; Replace 7E3F4.

; ORG         $140B20

                                        ; Block of code that handles Doppel being hit by ice mid air and on the ground.
  MOVE.B      #$2, (A0)                 ; Code from the original game readjusted.
  CMP.W       #$18, ($6, A0)            ; Compares 18 and ($6 + A0), turn into ice cube action.
  BNE         $140B3E                   ; If it is not 18, go to the last line.
  MOVE.W      #$0C, ($6, A0)            ; Stores 0C inside ($6 + A0), the action of being knocked down.
  CLR.W       ($8, A0)                  ; Clears ($8 + A0), necessary step so knock down action works properly.
  MOVE.L      #$FE0, ($26, A0)          ; Stores FE0 inside ($3A + A0), to clean the bug data.
  JMP         $7E3FA                    ; Code from the original game readjusted.



  JMP         $140B50.L                 ; Replace 2227C, 26D56.
  NOP

; ORG         $140B50

                                        ; Block of code that forces the character pallete ID.
  MOVE.W      ($3A, A0), ($9C, A0)      ; Stores ($3A + A0) inside ($9C + A0), the character pallete ID.
  JSR         $304E                     ; Code from the original game that was replaced to jump to this code.
  JMP         $39B0                     ; Code from the original game that was replaced to jump to this code.
  


  JSR         $140B70.L                 ; Replace 2228E, 26D68.
  NOP

; ORG         $140B70

                                        ; Block of code that forces the ice pallete ID.
  MOVE.W      #$7, ($9C, A0)            ; Stores 7 inside ($9C + A0), the ice pallete ID.
  JSR         $304E                     ; Code from the original game that was replaced to jump to this code.
  JMP         $39B0                     ; Code from the original game that was replaced to jump to this code.



  JSR         $140B90.L                 ; Replace 49316, 4DC62, 7F6F8.

; ORG         $140B90

                                        ; Block of code that fixes death by ice bugs.
  CMP.B       #$18, D1                  ; Compares 18 and D1, 18 is hit by ice.
  BNE         $140B90                   ; If it is not 18, ignore the 2 lines below.
  MOVE.W      #$2, ($4, A0)             ; Stores 2 inside ($4 + A0), death rolling on the ground.
  RTS                                   ; Returns back to the routine that called this code.
  MOVE.W      (A1, D1.W), ($4, A0)      ; Code from the original game that was replaced to jump to this code.
  RTS                                   ; Returns back to the routine that called this code.



; This module has routines that fixes bugs that happen 
; when some enemies are hit by ice. In the original game, 
; very few parts have the robots, and the blue robot is 
; the only one that can discharge ice, which means that 
; not all enemies have the opportunity to take damage by 
; an ice discharge, so some of them don't have the action 
; of being hit by ice, others have it but with bugged 
; palletes or bugged animation. Since this hack allows 
; Captain Commando to discharge ice, the fixes brought by 
; this module is a must.
;
; 140A00: Dolg Hit By Ice Action Fix (Ground)
; 140A40: Enemies Hit By Ice Action Fix (Ground)
; 140A80: Enemies Hit By Ice Action Fix (Mid Air)
; 140AC0: Doppel Hit By Ice Action Fix (Ground)
; 140B20: Doppel Hit By Ice Action Fix (Ground, Mid Air)
; 140B50: Enemies Hit By Ice Action Pallete Fix (Default Sprite)
; 140B70: Enemies Hit By Ice Action Pallete Fix (Ice Sprite)
; 140B90: Enemies Hit By Ice Action Fix (Death)