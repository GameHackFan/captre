*----------------------------------------------------------------------------------------------
* Title:        CAPTRE Boss Improvement
* Written by:   GameHackFan
* Date:         
* Description:  Brings improvements to some bosses.
*               Improvement to how doppel handle his replicas.
*               Force players to kill Druk and Shtrom.
*----------------------------------------------------------------------------------------------

  JSR         $141300.L                 ; Replaces 7F456, 7F4CC, 7F6BE.

; ORG         $141300

                                        ; Block of code that decreases current doppel replica amount.
  TST.B       (A1, D0.W)                ; Compares 0 and (A1 + D0.W), current replica amount flag.
  BEQ         $14130A                   ; If it is 0, go to the RTS line.
  SUBQ.B      #1, (A1, D0.W)            ; Subtracts 1 from ($A1 + D0.W), current replica amount flag.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $141320

                                        ; Block of code that reads the boss amount from a table
  CLR.W       D0                        ; Clears D0.
  MOVE.B      ($28CE, A5), D0           ; Stores ($28CE + A5) inside D0, the stage ID.
  ADD.B       D0, D0                    ; Adds D0 to D0, doubles it because the stage boss amount is 2 bytes.
  MOVE.W      ($0A, PC, D0.W), D0       ; Stores ($0A + PC + D0.W) inside D0, the stage boss amount.
  MOVE.W      D0, ($781A, A5)           ; Stores D0 inside ($781A + A5), the custom boss amount.
  RTS                                   ; Returns back to the routine that called this code.



  JSR         $141360.L                 ; Replaces 83868.

; ORG         $141360

                                        ; Block of code that ensures the stage ends when the boss amount reaches 0.
  MOVE.W      #6, ($2, A0)              ; Code from the original game that was replaced to jump to this code.
  TST.W       ($781A, A5)               ; Compares 0 and ($781A + A5), the custom boss amount flag.
  BGT         $141372                   ; If it is greater than 0, go to the RTS line.
  MOVE.W      #$FFFF, ($781A, A5)       ; Stores EDCB inside ($781A + A5), stage end flag.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $51452                    ; Replaces 51452, 5166C (There is space enough to replace all the code).

  ADDQ.B      #1, ($B6, A0)             ; Adds 1 to ($B6 + A0), Mack the Knife replica amount.
  NOP                                   ; No operation, does nothing.



; ORG         $514A8                    ; Replaces 514A8, 516C2 (There is space enough to replace all the code).

  ADDQ.B      #1, ($B7, A0)             ; Adds 1 to ($B7 + A0), Captain Commando replica amount.
  NOP                                   ; No operation, does nothing.



; ORG         $51500                    ; Replaces 51500, 51718 (There is space enough to replace all the code).

  ADDQ.B      #1, ($B8, A0)             ; Adds 1 to ($B8 + A0), Ninja Commando replica amount.
  NOP                                   ; No operation, does nothing.



; ORG         $51558                    ; Replaces 51558, 5176E (There is space enough to replace all the code).

  ADDQ.B      #1, ($B9, A0)             ; Adds 1 to ($B9 + A0), Baby Head replica amount.
  NOP                                   ; No operation, does nothing.



; ORG         $7A054                    ; Replaces 7A054 (There is space enough to replace all the code).

                                        ; Block of code that removes doppel twin target select.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.



; ORG         $826F2                    ; Replaces 82998 (There is space enough to replace all the code).

                                        ; Block of code that decreases the boss amount flag.
  SUBQ.W      #1, ($781A, A5)           ; Subtracts 1 from ($781A + A5), the custom boss amount flag.
  TST.W       ($781A, A5)               ; Compares 0 and ($781A + A5), the custom boss amount flag.
  BGT         $82708                    ; If it is greater than 0, ignore slowing down the game.
  MOVE.B      #$1, ($786B, A5)          ; Code from the original game that was replaced to jump to this code.
  NOP                                   ; No operation, does nothing.



; ORG         $82998                    ; Replaces 82998 (There is space enough to replace all the code).

                                        ; Block of code that decreases the boss amount flag.
  SUBQ.W      #1, ($781A, A5)           ; Subtracts 1 from ($781A + A5), the custom boss amount flag.
  TST.W       ($781A, A5)               ; Compares 0 and ($781A + A5), the custom boss amount flag.
  BGT         $829B0                    ; If it is greater than 0, ignore slowing down the game.
  MOVE.B      #$1, ($786B, A5)          ; Code from the original game that was replaced to jump to this code.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.


; ORG         $83872                    ; Replaces 83872 (There is space enough to replace all the code).

                                        ; Block of code that ensures the stage ends when the boss amount reaches 0.
  TST.W       ($781A, A5)               ; Compares 0 and ($781A + A5), the custom boss amount flag.
  BGE         $83896                    ; If it is greater than 0, ignore force stage end.
  MOVE.B      #$1, ($784B, A5)          ; Code from the original game that was replaced to jump to this code.
  CLR.W       ($781A, A5)               ; Clears ($781A + A5).



; This module has routines to improve bosses, like 
; fixing some issues caused by the readjusted changes, 
; fixing some issues already present in the original 
; game.
; 
; 141300: Doppel Replica Flag Decrease
; 141320: Set Custom Boss Amount Value
; 141360: Boss Set Force End Stage Flag
; 
; 051452: Doppel Mack the Knife Replica Flag Increase
; 0514A8: Doppel Captain Commando Replica Flag Increase
; 051500: Doppel Ninja Commando Replica Flag Increase
; 051558: Doppel Baby Head Replica Flag Increase
; 07A054: Doppel Target Select Improvement
; 0826F2: Druk and Shtrom Boss Amount Decrease (Throw Death)
; 082998: Druk and Shtrom Boss Amount Decrease (Default Death)
; 083872: Druk and Shtrom Force End Stage (Current Enemy)
;
; 141334: Stage Boss Amount Table (Data Below)
;         01 00 01 00 01 00 01 00 01 00 02 00
;         01 00 01 00 01 00