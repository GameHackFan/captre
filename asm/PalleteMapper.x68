*----------------------------------------------------------------------------------------------
* Title:        CAPTRE Pallete Mapper
* Written by:   GameHackFan
* Date:         
* Description:  Forces Mack the Knife, Captain Commando, Ginzu, Baby Head
*               to use the player pallete ID instead of their default.
*               Forces other sprites that uses the palletes 0, 1, 2, 3
*               to use the palletes 9, C, D, 5 instead.
*----------------------------------------------------------------------------------------------

; ORG         $141100

                                        ; Block of code that handles if the pallete should change.
  MOVE.W      D4, D5                    ; Stores D4 inside D5, the default pallete ID.
  AND.W       #$1F, D5                  ; D5 and 1F, the last valid pallete ID.
  CMP.W       #3, D5                    ; Compares 3 and D5, last value for the custom pallete.
  BHI         $141134                   ; If it is bigger than 3, go to the last block of code.

                                        ; Block of code that checks if it is a custom pallete ID.
  CMP.B       #$ED, ($3B, A0)           ; Compares ED and ($3B + A0), custom color flag.
  BNE         $141126                   ; If it is not ED, go to the 4th block of code.

                                        ; Block of code that forces the custom pallete.
  AND.W       #$FFF0, D4                ; D4 and FFF0, removes the pallete ID.
  MOVE.B      ($3A, A0), D5             ; Stores ($3A + A0) inside D5, the pallete ID + flags.
  LSR.B       #5, D5                    ; Shifts right D5 bits by 5, the player ID.
  ADD.W       D5, D4                    ; Adds D5 to D4.
  BSET        #$10, D1                  ; Sets the 17th bit of D1 to 1, the remapped pallete flag.
  RTS                                   ; Returns back to the routine that called this code.

                                        ; Block of code that grabs a new pallete for the sprites using the pallete IDs 0, 1, 2, 3.
  AND.W       #$FFF0, D4                ; D4 and FFF0, removes the default pallete ID.
  ADD.B       ($10, PC, D5.W), D4       ; Adds ($10 + PC + D5.W) to D4, the new pallete ID.
  BSET        #$10, D1                  ; Sets the 17th bit of D1 to 1, the remapped pallete flag.
  RTS                                   ; Returns back to the routine that called this code.

  BCLR        #$10, D1                  ; Clears the 17th bit of D1, the remapped pallete flag.
  RTS                                   ; Returns back to the routine that called this code.



  JMP         $141150.L                 ; Replace 510A.

; ORG         $141150

                                        ; Block of code that fix drawing the sprite.
  MOVE.W      (A2)+, D5                 ; Code from the original game that was replaced to jump to this code.
  BTST        #$10, D1                  ; Tests the 17th bit of D1, the remapped pallete flag.
  BEQ         $14115C                   ; If it is 0, ignore the line below.
  AND.W       #$FFE0, D5                ; D5 and FFE0, removes the pallete ID from D5.
  EOR.W       D4, D5                    ; Code from the original game that was replaced to jump to this code.  
  MOVE.W      D5, (A4)+                 ; Code from the original game that was replaced to jump to this code.
  JMP         $5110                     ; Jumps back to where it stopped in the original code.



  JMP         $141180.L                 ; Replace 50B6.

; ORG         $141180

                                        ; Block of code that fix drawing the sprite.
  MOVE.W      (A2)+, D5                 ; Code from the original game readjusted.
  BTST        #$10, D1                  ; Tests the 17th bit of D1, the remapped pallete flag.
  BEQ         $141192                   ; If it is 0, ignore the 3 lines below.
  AND.W       #$FFE0, D5                ; D5 and FFE0, removes the pallete ID from D5.
  AND.W       #$1F, D4                  ; D4 and 1F, keeps only the pallete ID.
  OR.W        D4, D5                    ; D5 or D4, merge pallete ID and the rest of the flags.
  MOVE.W      D5, (A4)+                 ; Code from the original game readjusted.
  ADD.W       (A2)+, D1                 ; Code from the original game that was replaced to jump to this code.
  ADD.W       (A2)+, D2                 ; Code from the original game that was replaced to jump to this code.
  JMP         $50BC                     ; Jumps back to where it stopped in the original code.



  JMP         $1411B0.L                 ; Replace 50C8.
  NOP
  NOP

; ORG         $1411B0

  BTST        #$10, D1                  ; Tests the 17th bit of D1, the remapped pallete flag.
  BNE         $1411C2                   ; If it is not 0, ignore the 5 lines below.
  MOVE.W      (A2)+, D4                 ; Code from the original game that was replaced to jump to this code.
  AND.W       #$FFE0, D4                ; Code from the original game that was replaced to jump to this code.
  ADD.W       D5, D4                    ; Code from the original game that was replaced to jump to this code.
  MOVE.W      D4, (A4)+                 ; Code from the original game that was replaced to jump to this code.
  BRA         $1411D0                   ; Jump to the last line of code.
  MOVE.W      (A2)+, D5                 ; Code from the original game readjusted.
  AND.W       #$FFE0, D5                ; D5 and FFE0, removes the pallete ID from D5.
  AND.W       #$1F, D4                  ; D4 and 1F, keeps only the pallete ID.
  OR.W        D4, D5                    ; D5 or D4, merge pallete ID and the rest of the flags.
  MOVE.W      D5, (A4)+                 ; Code from the original game readjusted.
  JMP         $50D2                     ; Jumps back to where it stopped in the original code.



  JSR         $141200.L                 ; Replace 5028, 5068.

; ORG         $141200

                                        ; Block of code calls the pallete remapper.
  BSR         $141100                   ; Calls the routine that remaps the pallete if necessary.
  ADD.W       (A2)+, D2                 ; Code from the original game that was replaced to jump to this code.
  NOT.B       D2                        ; Code from the original game that was replaced to jump to this code.
  ADDQ.W      #1, D2                    ; Code from the original game that was replaced to jump to this code.
  RTS                                   ; Returns back to the routine that called this code.



  JSR         $141220.L                 ; Replace 516A, 51AA.

; ORG         $141220

                                        ; Block of code calls the pallete remapper.
  BSR         $141100                   ; Calls the routine that remaps the pallete if necessary.
  ADD.W       (A2), D1                  ; Code from the original game that was replaced to jump to this code.
  NOT.B       D1                        ; Code from the original game that was replaced to jump to this code.
  ADDQ.W      #1, D1                    ; Code from the original game that was replaced to jump to this code.
  RTS                                   ; Returns back to the routine that called this code.



  JMP         $141240.L                 ; Replace 50A8.
  NOP

; ORG         $141240

                                        ; Block of code calls the pallete remapper.
  MOVE.W      ($9C, A0), D5             ; Code from the original game that was replaced to jump to this code.
  BNE         $141252                   ; Code from the original game readjusted.
  MOVE.W      ($22, A0), D5             ; Stores ($22 + A0) inside D5, the default pallete ID.
  BSR         $141102                   ; Calls the routine that remaps the pallete if necessary.
  JMP         $50B0                     ; Jumps back to where it stopped in the original code.
  MOVE.W      ($22, A0), D5             ; Stores ($22 + A0) inside D5, the default pallete ID. 
  BSR         $141102                   ; Calls the routine that remaps the pallete if necessary.
  MOVE.W      ($9C, A0), D5             ; Stores ($9C + A0) inside D5, the forced pallete ID.
  JMP         $50C2                     ; Code from the original game readjusted.



  JMP         $141280.L                 ; Replace 50FC.
  NOP

; ORG         $141280

                                        ; Block of code calls the pallete remapper.
  MOVE.W      ($9C, A0), D5             ; Code from the original game that was replaced to jump to this code.
  BNE         $141292                   ; Code from the original game readjusted.
  MOVE.W      ($22, A0), D5             ; Stores ($22 + A0) inside D5, the default pallete ID.
  BSR         $141102                   ; Calls the routine that remaps the pallete if necessary.
  JMP         $5104                     ; Jumps back to where it stopped in the original code.
  MOVE.W      ($22, A0), D5             ; Stores ($22 + A0) inside D5, the default pallete ID. 
  BSR         $141102                   ; Calls the routine that remaps the pallete if necessary.
  MOVE.W      ($9C, A0), D5             ; Stores ($9C + A0) inside D5, the forced pallete ID.
  JMP         $511A                     ; Code from the original game readjusted.



; This module provides routines that handle the pallete
; that the sprite should use. The palletes 0, 1, 2, 3 are 
; now being used by P1, P2, P3, P4. Because of these changes, 
; pallete 0, 1, 2, 3 will be dynamic, so they can't be used 
; by the other objects, which means the sprites that were 
; using these palletes will now have to use other palletes, 
; and they are 9, C, D, 5. This module also executes several
; routines to ensure these pallete changes work as intended.
;
; 141100: Remap Sprite Pallete ID (Current Game Object / Character)
; 141150: Draw Sprite Fix 1
; 141180: Draw Sprite Fix 2
; 1411B0: Draw Sprite Fix 3
; 141200: Remap Sprite Pallete ID 1
; 141220: Remap Sprite Pallete ID 2
; 141240: Remap Sprite Pallete ID 3
; 141280: Remap Sprite Pallete ID 4
;
; 14113A: Pallete ID Table (Data Below)
;         00 00 0C 09 05 0D