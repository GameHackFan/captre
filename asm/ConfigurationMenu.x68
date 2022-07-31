*----------------------------------------------------------------------------------------------
* Title:        CAPTRE Configuration Menu
* Written by:   GameHackFan
* Date:         
* Description:  It has routines that calls the menu builder with 
*               the data needed to have the configuration menu.
*               It has a routine to handle the key press 
*               to display the custom configuration menu.
*               It has a routine to add a hint to the test menu 
*               showing what key starts this menu.
*----------------------------------------------------------------------------------------------

  JMP         $142500.L                 ; Replaces AC9B2.
  NOP

; ORG         $142500

                                        ; Block of code that handles if the menu should be built.
  MOVE.B      ($28A8, A5), D0           ; Code from the original game that was replaced to jump to this code.
  MOVE.B      ($28AC, A5), D1           ; Code from the original game that was replaced to jump to this code.
  BTST        #5, D0                    ; Tests the 6th bit of D0, P1 2nd button, jump.
  BEQ         $142514                   ; If it is 0, ignore the line below.
  MOVE.B      #1, ($7F00, A5)           ; Stores 1 inside ($7F00 + A5), activates the configuration menu.
  TST         ($7F00, A5)               ; Compares 0 and ($7F00 + A5), if the configuration menu is active.
  BEQ         $142532                   ; If it is 0, go to the last line of code.
  BSR         $142320                   ; Calls the routine that saves the registers values.
  LEA         $1425C0, A1               ; Stores 1425C0 inside A1, the address of the configuration menu data.
  BSR         $142000                   ; Calls the routine that handles the configuration menu.
  BSR         $142360                   ; Calls the routine that restore the registers values.
  JMP         $AC9D2                    ; Jumps to the code that cancels the continue screen.
  JMP         $AC9BA                    ; Jumps to the code that cancels the continue screen.



  JMP         $142550.L                 ; Replaces AC994.

; ORG         $142550

                                        ; Block of code that draws the configuration menu hint.
  BSR         $142320                   ; Calls the routine that saves the registers values.
  LEA         $142590, A2               ; Stores 142590 inside A2, the configuration menu hint memory region.
  LEA         $9007EC, A3               ; Stores 9007EC inside A2, the hint screen region.
  MOVE.W      #1, D2                    ; Stores 1 inside D2, the text pallete ID.
  BSR         $1422F0                   ; Calls the routine that prints the text.
  BSR         $142360                   ; Calls the routine that restore the registers values.
  MOVEQ       #0, D0                    ; Code from the original game that was replaced to jump to this code.
  MOVE.B      ($1, A0), D0              ; Code from the original game that was replaced to jump to this code.
  JMP         $AC99A                    ; Jumps to the code that cancels the continue screen.



; This module has routines that will properly build 
; a configuration menu that allows some settings to 
; be changed, ignoring the dipswitch. The settings 
; that are supported are Difficulty 1, Difficulty 2 
; and Player Lives. The menu will can accessed inside 
; the Test Menu by pressing the P1 Jump Button, it will 
; also display a hint in the test menu to inform how to 
; access this menu. Nice feature to have if you want 
; to play online and dipswitch is not possible to access.
;
; 142500: Configuration Menu Manager (Builder and Controller)
; 142500: Draw Configuration Menu Hint (Test Menu)
;
; 1425C0: Configuration Menu Data (Title)
;         20 20 20 20 20 20 43 20 6E 6F 69 66 75 67
;         61 72 69 74 6E 6F 4D 20 6E 65 20 75 00 00
;
; 1425E0: Configuration Menu Data (Item Amount)
;         03 00
;
; 1425F0: Configuration Menu Data (Items Offset)
;         50 00 00 01 70 01 10 02
;
; 142610: Difficulty 1 Menu Data (System Data)
;         F0 81 00 00 07 00
;
; 142620: Difficulty 1 Menu Data (Label)
;         3A 31 44 20 66 69 69 66 75 63 74 6C 20 79 00 31
;
; 142630: Difficulty 1 Value 1 Data (Label, Extra Easy)
;         20 31 20 2D 78 45 72 74 20 61 61 45 79 73 00 00
;
; 142640: Difficulty 1 Value 2 Data (Label, Very Easy)
;         20 32 20 2D 65 56 79 72 45 20 73 61 20 79 00 00
;
; 142650: Difficulty 1 Value 3 Data (Label, Easy)
;         20 33 20 2D 61 45 79 73 00 00 00 00 00 00 00 00
;
; 142660: Difficulty 1 Value 4 Data (Label, Normal)
;         20 34 20 2D 6F 4E 6D 72 6C 61 00 00 00 00 00 00
;
; 142670: Difficulty 1 Value 5 Data (Label, Hard)
;         20 35 20 2D 61 48 64 72 00 00 00 00 00 00 00 00
;
; 142680: Difficulty 1 Value 6 Data (Label, Very Hard)
;         20 36 20 2D 65 56 79 72 48 20 72 61 20 64 00 00
;
; 142690: Difficulty 1 Value 7 Data (Label, Extra Hard)
;         20 37 20 2D 78 45 72 74 20 61 61 48 64 72 00 00
;
; 1426A0: Difficulty 1 Value 8 Data (Label, Hardest)
;         20 38 20 2D 61 48 64 72 73 65 20 74 00 00 00 00
;
; 1426C0: Difficulty 2 Menu Data (System Data)
;         F1 81 00 00 03 00
;
; 1426D0: Difficulty 2 Menu Data (Label)
;         3A 32 44 20 66 69 69 66 75 63 74 6C 20 79 00 32
;
; 1426E0: Difficulty 2 Value 1 Data (Label, Easy)   
;         20 31 20 2D 61 45 79 73 00 00 00 00 00 00 00 00
;
; 1426F0: Difficulty 2 Value 2 Data (Label, Normal)
;         20 32 20 2D 6F 4E 6D 72 6C 61 00 00 00 00 00 00
;
; 142700: Difficulty 2 Value 3 Data (Label, Hard)
;         20 33 20 2D 61 48 64 72 00 00 00 00 00 00 00 00
;
; 142710: Difficulty 2 Value 4 Data (Label, Hardest)
;         20 34 20 2D 61 48 64 72 73 65 20 74 00 00 00 00
;
; 142730: Player Lives Menu Data (System Data)
;         F2 81 00 00 06 00
;
; 142740: Player Lives Menu Data (Label)
;         3A 33 50 20 61 6C 65 79 20 72 69 4C 65 76 00 73
;
; 142750: Player Lives Value 1 Data (Label, 1)
;         20 31 69 4C 65 66 00 00 00
;
; 142760: Player Lives Value 2 Data (Label, 2)
;         20 32 69 4C 65 76 20 73 00
;
; 142770: Player Lives Value 3 Data (Label, 3)
;         20 33 69 4C 65 76 20 73 00
;
; 142780: Player Lives Value 4 Data (Label, 4)
;         20 34 69 4C 65 76 20 73 00
;
; 142790: Player Lives Value 5 Data (Label, 5)
;         20 35 69 4C 65 76 20 73 00
;
; 1427A0: Player Lives Value 6 Data (Label, 6)
;         20 36 69 4C 65 76 20 73 00
;
; 1427B0: Player Lives Value 7 Data (Label, 7)
;         20 37 69 4C 65 76 20 73 00
;
; 1427D0: Force Settings Data (System Data)
;         FF 81 00 00 01 00
;
; 1427E0: Force Config Menu Data (Label)
;         3A 34 46 20 72 6F 65 63 43 20 6E 6F 69 66 00 67
;
; 1427F0: Force Config Value 2 Data (Label, No)
;         6F 4E 00 00
;
; 142800: Force Config Value 1 Data (Label, Yes)
;         65 59 20 73 00 00