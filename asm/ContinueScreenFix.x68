*----------------------------------------------------------------------------------------------
* Title:        CAPTRE Continue Screen Fix
* Written by:   GameHackFan
* Date:         
* Description:  Fixes the continue screen, going back to the game 
*               if a player has coins and press start.
*----------------------------------------------------------------------------------------------

  JMP         $140E00.L                 ; Replaces DA8C.
  NOP

; ORG         $140E00

                                        ; Block of code that fix the continue screen.
  MOVE.W      #$4, D0                   ; Stores 4 inside D0, 1 more than the last player ID.
  AND.W       #$0F, D0                  ; D0 and F, to have the player ID.
  TST.B       D0                        ; Compares 0 and D0, 0 is P1 ID.
  BEQ         $140E2C                   ; If it is 0, go to the last 2 lines of this block of code.            
  SUBQ.B      #1, D0                    ; Subtracts 1 from D0, next player.
  LSL.L       #8, D0                    ; Shifts left D0 bits by 8, player memory region shift.
  ADD.W       #$2994, D0                ; Adds 2994 to D0, P1 memory region shift.
  MOVE.B      #2, (A5, D0.W)            ; Stores 2 inside (A5 + D0.W), current player active flag.
  MOVE.W      #6, ($2, A5, D0.W)        ; Stores 6 inside ($2 + A5 + D0.W), current player flag, 6 if the player is dead.
  SUB.W       #$2994, D0                ; Subtracts 2994 from D0, remove P1 memory region shift.
  LSR.L       #8, D0                    ; Shifts right D0 bits by 8, to get the player ID.
  ADD.W       #$2850, D0                ; Adds 2850 to D0, current player coin amount shift, 
  BRA         $140E38                   ; Jumps to the code that handles if the continue screen should be canceled.
  JSR         $E834                     ; Code from the original game readjusted.
  JMP         $DA94                     ; Jumps back to where it stopped in the original code.

                                        ; Block of code that handles if the continue screen should be canceled.
  TST.B       (A5, D0.W)                ; Compares 0 and (A5 + D0.W), coin amount of the current player.
  BEQ         $140E04                   ; If it is 0, go to the 2nd line of the 1st block, next player.
  AND.W       #$0F, D0                  ; D0 and F, to have the player ID.
  BTST        D0, ($28A6, A5)           ; Test D0 bit of ($28A6, A5), current player start KeyPress bit flag.
  BEQ         $140E04                   ; If it is 0, not pressed, go to the 2nd line of the 1st block, next player.
  BTST        D0, ($28A7, A5)           ; Test the D0 bit of ($28A7, A5), current player start KeyDown/Up bit flag.
  BNE         $140E04                   ; If it is not 0, the key is being hold, go to the 2nd line of the 1st block, next player.
  CLR.W       ($119A, A5)               ; Clears ($119A, A5), a custom timer used by the continue screen.
  CLR.W       ($2A7E, A5)               ; Clears ($2A7E + A5), P1 flag, 0 ensures the player will be executed.
  CLR.W       ($2B7E, A5)               ; Clears ($2B7E + A5), P2 flag, 0 ensures the player will be executed.
  CLR.W       ($2C7E, A5)               ; Clears ($2C7E + A5), P3 flag, 0 ensures the player will be executed.
  CLR.W       ($2D7E, A5)               ; Clears ($2D7E + A5), P4 flag, 0 ensures the player will be executed.
  JMP         $DAD8                     ; Jumps to the code that cancels the continue screen.


  JMP         $140E80.L                 ; Replaces 6A58.
  NOP

; ORG         $140E80

                                        ; Block of code that calls the continue screen after some time if no player is active.       
  TST.B       ($28B7, A5)               ; Compares 0 and ($28B7 + A5), player alive flag.
  BNE         $140E9C                   ; If it is not 0, go to the last line of this block.
  CMP.W       #$960, ($119A, A5)        ; Compares 960 and ($119A + A5), a custom timer used by the continue screen.
  BCS         $140E9C                   ; If it is less than 960, go to the last line of this block.
  CLR.B       ($6D64, A5)               ; Clears ($6D64 + A5), flag that indicates players are selecting their character.
  MOVE.W      #$0C, ($EA, A0)           ; Stores C inside $(EA, A0), necessary flag for at least 1 player to allow the continue screen to be displayed.
  JMP         $62FC                     ; Calls the routine that starts the continue screen.
  JMP         $6A60                     ; Returns back to the routine that called this code.



  JMP         $140EB0.L                 ; Replaces 66FE.
  NOP

; ORG         $140EB0

                                        ; Block of code that increases the custom continue screen timer.
  LEA         ($2C94, A5), A0           ; Code from the original game that was replaced to jump to this code.
  LEA         ($28AB, A5), A4           ; Code from the original game that was replaced to jump to this code.
  ADDQ.W      #1, ($119A, A5)           ; Adds 1 to ($119A + A5), increases the continue custom timer.
  JMP         $6706                     ; Jumps back to where it stopped in the original code.



; This module has routines that fixes the continue
; screen, it behaves differently when the Play Mode 
; is set to 4 players, and the changes made by this 
; hack makes the continue screen not work as it should, 
; so this fix ensures the continue screen will work 
; properly. It also has a routine that will call the 
; continue screen after some time if there is no 
; player alive.
;
; 140E00: Continue Screen Fix (All Players)
; 140E80: Try to Activate Continue Screen (Current Player)
; 140EB0: Increase Custom Continue Screen Timer