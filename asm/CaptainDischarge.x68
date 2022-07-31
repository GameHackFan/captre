*----------------------------------------------------------------------------------------------
* Title:        CAPTRE Captain Discharge
* Written by:   GameHackFan
* Date:         
* Description:  Forces Captain Discharge to be fire or ice.
*----------------------------------------------------------------------------------------------

  JMP         $140300.L                 ; Replace 1F3FE.
  NOP

; ORG         $140300

                                        ; Block of code that executes the fire or ice discharge.
  MOVE.B      ($7877, A5), D0           ; Stores ($7877 + A5) inside D0, part of the stage timer.
  AND.B       #1, D0                    ; D0 and 1, 0 for fire, 1 for ice.
  TST.B       D0                        ; Compares 0 and D0.
  BNE         $140312                   ; If it is not 0, ignore the 2 lines below.
  LEA         ($12C, A1), A4            ; Stores ($12C + A1) inside A4, the address of the fire discharge.
  BRA         $140316                   ; Jumps to the line after the line below.
  LEA         ($560, A1), A4            ; Stores ($560 + A1) inside A4, the address of the ice discharge.
  JSR         $304E                     ; Code from the original game that was replaced to jump to this code.
  JMP         $1F406                    ; Jumps back to where it stopped in the original code.



; This module has a routine that changes the 
; way Captain Commando executes his Discharge 
; Attack, forcing it to be fire in case the 
; stage time is an even number or ice in case 
; the stage time is an odd number;
;
; 140300: Force Captain Discharge To Be Fire or Ice.