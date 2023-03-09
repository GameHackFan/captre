*----------------------------------------------------------------------------------------------
* Title:        CAPTRE Player Input Improvement
* Written by:   GameHackFan
* Date:         
* Description:  Allows players to hold Jump and press Punch to execute the
;               special attack.
*----------------------------------------------------------------------------------------------

; ORG         $11464                    ; Replace 11464 (There is space enough to replace all the code).

                                        ; Block of code that improves Jump + Punch input interpretation.
  BTST        #$5, D6                   ; Original is D5 instead of D6, D6 has press or hold inputs, 6th bit is jump input.



; This module has a code that improves the way the game,
; interprests Punch + Jump attack execution, allowing the
; player to hold Jump and press Punch to execute the special
; attack.
; 
; 011464: Player Jump + Punch Interpretation Improvement (Current Player)