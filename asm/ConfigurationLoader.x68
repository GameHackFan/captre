*----------------------------------------------------------------------------------------------
* Title:        CAPTRE Configuration Loader
* Written by:   GameHackFan
* Date:         
* Description:  Allows configuration from the configuration menu 
*               to be loaded instead of the dipswitch configuration
*               if the Force Config settings is enalbed, otherwise
*               it will keep using the dipswitch configuration.
*               Supports Difficulty 1, 2 and Player Lives.
*----------------------------------------------------------------------------------------------

  JMP         $141400.L                 ; Replaces 103C.

; ORG         $141400

                                        ; Block of code that forces Play Mode to be 4 players and check what config it shoud load.
  MOVE.B      #2, ($28C1, A5)           ; Stores 2 inside ($28C1 + A5), play mode flag to be 4 players.
  TST.B       (-$7E01, A5)              ; Compares 0 and (-$7E01 + A5), configuration menu settings enabled flag.
  BEQ         $141430                   ; If it is 0, jump to the 3rd block of code.

                                        ; Block of code that forces the settings from the configuration menu.
  MOVE.B      (-$7E10, A5), ($28BE, A5) ; Stores (-$7E10 + A5) inside ($28BE + A5), the difficulty 1.
  MOVE.B      (-$7E0F, A5), ($782F, A5) ; Stores (-$7E0F + A5) inside ($782F + A5), the difficulty 2.
  MOVE.B      (-$7E0E, A5), D0          ; Stores (-$7E0E + A5) inside D0, the player life amount.
  ADDQ.B      #1, D0                    ; Adds 1 to D0, player life amount is not 0 based value.
  MOVE.B      D0, ($28BD, A5)           ; Stores D0 inside ($28BD + A5), the player life amount.
  MOVE.B      ($28B2, A5), D0           ; Code from the original game that was replaced to jump to this code.
  MOVE.B      D0, D1                    ; Code from the original game that was replaced to jump to this code.
  AND.W       #$3, D1                   ; Code from the original game that was replaced to jump to this code.
  JMP         $106E                     ; Jumps back to where it stopped in the original code.

                                        ; Block of code that executes replaced code and goes back to dipswitch configs.
  MOVE.B      D0, D1                    ; Code from the original game that was replaced to jump to this code.
  AND.B       #$7, D1                   ; Code from the original game that was replaced to jump to this code.
  JMP         $1042                     ; Jumps back to where it stopped in the original code.



; This module has a routine that loads the settings 
; from the configuration menu if it is enabled, 
; ignoring the dipswitch control over them and 
; loading the data from the memory instead. If the 
; setttings from the configuration menu is not enabled 
; it will just load the configurations from the
; dipswitch. It also forces Play Mode to be 4 players.
; For now only Player Lives, Difficulty 1 and Difficulty 
; 2 settings are supported ignoring the dipswitch.
;
; 141400: Try to Load Custom Settings (Force 4 Player Mode and Configuration Menu Settings)