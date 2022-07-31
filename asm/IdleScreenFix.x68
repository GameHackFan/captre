*----------------------------------------------------------------------------------------------
* Title:        CAPTRE Idle Screen Fix
* Written by:   GameHackFan
* Date:         
* Description:  It fixes bugs brought by the pallete remapper 
                on gameplay demo screens and ending screen.
*----------------------------------------------------------------------------------------------

  JMP         $141000.L                 ; Replace A9E5C

; ORG         $141000

                                        ; Block of code that fixes all players color flags on ending screen.
  JSR         $F3C8                     ; Code from the original game that was replaced to jump to this code.
  MOVE.W      #$40ED, ($29CE, A5)       ; Stores 40ED inside ($29CE + A5), P1 color flags.
  MOVE.W      #$ED, ($2ACE, A5)         ; Stores ED inside ($2ACE + A5), P2 color flags.
  MOVE.W      #$20ED, ($2BCE, A5)       ; Stores 20ED inside ($2BCE + A5), P3 color flags.
  MOVE.W      #$60ED, ($2CCE, A5)       ; Stores 60ED inside ($2CCE + A5), P4 color flags.
  JMP         $A9E62                    ; Jumps back to where it stopped in the original code.



  JMP         $141040.L                 ; Replace 1AE46

; ORG         $141040

                                        ; Block of code that sets the color flags on idle screens.
  MOVE.W      #$40ED, ($29CE, A5)       ; Stores 40ED inside ($29CE + A5), P1 color flags.
  MOVE.W      #$ED, ($2ACE, A5)         ; Stores ED inside ($2ACE + A5), P2 color flags.
  MOVE.W      #$20ED, ($2BCE, A5)       ; Stores 20ED inside ($2BCE + A5), P3 color flags.
  MOVE.W      #$60ED, ($2CCE, A5)       ; Stores 60ED inside ($2CCE + A5), P4 color flags.
  MOVEQ       #2, D0                    ; Code from the original game that was replaced to jump to this code.
  JSR         $DD2                      ; Code from the original game that was replaced to jump to this code.
  JMP         $1AE4C                    ; Jumps back to where it stopped in the original code.



; This module has routines that fixes the pallete 
; bugs that were brought by the pallete remapper, 
; causing gameplay demo screens and ending screen
; to have bugged palletes for the main characters.
; 
; 141000: Color Flag Fix (Ending Screen)
; 141040: Color Flag Fix (Idle Screen)