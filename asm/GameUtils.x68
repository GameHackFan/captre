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



; This module has a routines that saves and restore registers 
; values. 
;
; 141700: Saves D0, D1, D6, A0, A1, A6 in RAM at FFFFE0.
; 141730: Restores D0, D1, D6, A0, A1, A6 from RAM at FFFFE0.