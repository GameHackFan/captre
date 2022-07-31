*----------------------------------------------------------------------------------------------
* Title:        CAPTRE Menu Builder
* Written by:   GameHackFan
* Date:         
* Description:  It builds dynamically a configuration menu.
*               The menu has a title at the top, hints at the 
*               bottom and configuration items in the middle.
*----------------------------------------------------------------------------------------------

; ORG         $142000

                                        ; Block of code that tries draw the menu and execute all the actions of the menu on each frame.
  LEA         ($7F00, A5), A0           ; Stores ($7F00 + A5) inside A0, the menu memory region.
  MOVE.W      ($2, A0), D0              ; Stores ($2 + A0) inside D0, the selected item ID.
  ADD.W       D0, D0                    ; Adds D0 to D0, menu item offset is 2 bytes.
  MOVE.W      ($30, A1, D0.W), D0       ; Stores ($30 + A1) inside D0, ROM menu item offset.
  MOVE.W      (A1, D0.W), D1            ; Stores (A1 + D0.W) inside D1, RAM item value offset.
  TST.B       (A0)                      ; Compares 0 and (A0), the menu active flag.
  BEQ         $14202A                   ; If it is 0, go to the RTS line.
  TST.B       ($1, A0)                  ; Compares 0 and ($1, A0), the menu drawn flag.
  BNE         $14201E                   ; If it is not 0, the menu is already drawn, ignore the line below.
  BSR         $142040                   ; Calls the routine that starts the menu.
  BSR         $1421B0                   ; Calls the routine that handles changing the selected item.
  BSR         $1421D0                   ; Calls the routine that handles changing item value.
  BSR         $1422C0                   ; Calls the routine that handles exiting the menu.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $142040

                                        ; Block of code that starts the menu.  
  ADDQ.B      #1, ($1, A0)              ; Adds 1 to ($1, A0), the menu drawn flag.
  BSR         $142180                   ; Calls the routine that cleans the screen.
  BSR         $142070                   ; Calls the routine that draws the title of the menu.
  BSR         $1420A0                   ; Calls the routine that draws the hints of the menu.
  BSR         $142100                   ; Calls the routine that draws the selected menu item label.
  BSR         $142140                   ; Calls the routine that draws the item value label.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $142070

                                        ; Block of code that draws the title.
  MOVE.W      #$0F, D2                  ; Stores F inside D2, the pallete ID of the text, blue.
  LEA         (A1), A2                  ; Stores (A1) inside A2, the title screen text address.
  LEA         $90040C, A3               ; Stores 90040C inside A3, the title text screen address.
  BSR         $1422F0                   ; Calls the routine that prints the text.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $1420A0

                                        ; Block of code that draws the hints.
  MOVE.W      #$01, D2                  ; Stores 1 inside D2, the pallete ID of the text, white.
  LEA         $1423A0, A2               ; Stores 1423A0 inside A2, the 1st hint text address.
  LEA         $90046C, A3               ; Stores 90046C inside A3, the 1st hint text screen address.
  BSR         $1422F0                   ; Calls the routine that prints the text.
  LEA         $1423D0, A2               ; Stores 1423D0 inside A2, the 2nd hint text address.
  LEA         $900470, A3               ; Stores 900470 inside A3, the 2nd hint text screen address.
  BSR         $1422F0                   ; Calls the routine that prints the text.
  LEA         $142400, A2               ; Stores 142400 inside A2, the 3rd hint text address.
  LEA         $900474, A3               ; Stores 900474 inside A3, the 3rd hint text screen address.
  BSR         $1422F0                   ; Calls the routine that prints the text.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $142100

                                        ; Block of code that draws the selected menu item label.
  LEA         $900038, A3               ; Stores 900038 inside A3, the menu item screen region.
  LEA         $142430, A2               ; Stores 142430 inside A2, the empty text memory region.
  BSR         $1422F0                   ; Calls the routine that prints the text.
  MOVE.W      #1, D2                    ; Stores 1 inside D2, the pallete ID of the text, white.
  LEA         $900238, A3               ; Stores 900238 inside A3, the item label text screen address.
  LEA         ($10, A1, D0.W), A2       ; Stores ($10 + A1 + D0.W) inside A2, the menu item label memory region.
  BSR         $1422F0                   ; Calls the routine that prints the text.
  CLR.W       D2                        ; Clears D2.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $142140

                                        ; Block of code that draws the selected item value.
  CLR.W       D3                        ; Clears D3.
  MOVE.W      #1, D2                    ; Stores 1 inside D2, the pallete ID of the text, white.
  LEA         $900C38, A3               ; Stores 900C38 inside A3, the item value screen region.
  LEA         $142430, A2               ; Stores 142430 inside A2, the empty text memory region.
  BSR         $1422F0                   ; Calls the routine that prints the text.
  MOVE.B      (A5, D1.W), D3            ; Stores (A5 + D1.W) inside D3, current item value.
  LSL.W       #4, D3                    ; Shifts left D3 bits by 4, each text uses 16 bytes.
  ADD.W       D0, D3                    ; Adds D0 to D3, the ROM menu item memory offset.
  LEA         $900E38, A3               ; Stores 900E38 inside A3, the item value label screen address.
  LEA         ($20, A1, D3.W), A2       ; Stores ($20 + A1 + D3.W) inside A2, the item value label memory region.
  BSR         $1422F0                   ; Calls the routine that prints the text.
  CLR.W       D2                        ; Clears D2.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $142180

                                        ; Block of code that cleans the screen.
  LEA         $900000, A3               ; Stores 900000 inside A3, the screen memory region.
  MOVE.W      #$0FFF, D2                ; Stores 0FFF inside D2, the amount of iteration (1000).
  MOVE.W      #$C020, D3                ; Stores C020 inside D3, empty sprite data.
  MOVE.W      D3, (A3)+                 ; Stores D3 inside (A3) and increments A3, clears the screen region.
  CLR.W       (A3)+                     ; Clears (A3) and increments A3, pallete ID 0.
  MOVE.W      D3, (A3)+                 ; Stores D3 inside (A3) and increments A3, clears the screen region.
  CLR.W       (A3)+                     ; Clears (A3) and increments A3, pallete ID 0.
  DBRA        D2, $14218A               ; Loops back to the 3rd line of code (should be 4th).
  RTS                                   ; Returns back to the routine that called this code



; ORG         $1421B0

                                        ; Block of code that handles changing the selected item.
  BSR         $142200                   ; Calls the routine that handles changing the selected item.
  TST.B       D2                        ; Compares 0 and D2, 0 if no change, 1 if change happened.
  BEQ         $1421BC                   ; If it is 0, go to the last line.
  BSR         $142100                   ; Calls the routine that draws the selected menu item label.
  BSR         $142140                   ; Calls the routine that draws the selected item value.
  RTS                                   ; Returns back to the routine that called this code         



; ORG         $1421D0

                                        ; Block of code that handles changing the item value.
  BSR         $142260                   ; Calls the routine that handles changing the selected item.
  TST.B       D2                        ; Compares 0 and D2, 0 if no change, 1 if change happened.
  BEQ         $1421DC                   ; If it is 0, go to the last line.
  BSR         $142140                   ; Calls the routine that draws the selected item value.
  RTS                                   ; Returns back to the routine that called this code  



; ORG         $142200

                                        ; Block of code that handles the input press.
  CLR.W       D2                        ; Clears D2.
  MOVE.B      ($28A8, A5), D2           ; Stores ($28A8 + A5) inside D2, P1 KeyPress.
  MOVE.B      #$C, D3                   ; Stores C inside D3, 8 up, 4 down.
  AND.B       D2, D3                    ; D2 and D3, P1 KeyPress.
  TST.B       D3                        ; Compare 0 and D3.
  BEQ         $142248                   ; If it is 0, button isn't down, go to the last block of code.
  AND.B       ($28AC, A5), D3           ; D3 and ($28AC + A5), P1 KeyDown/KeyUp.
  TST.B       D3                        ; Compare 0 and D3.
  BNE         $142248                   ; If it is not 0, button is being hold, go to the last block of code.

                                        ; Block of code that changes the selected item ID and all values.
  LSR.B       #2, D2                    ; Shifts left D2 bits by 2, 8 is 2, 4 is 1.
  AND.W       #2, D2                    ; D2 and 2, 2 is 2, 1 is 0.
  SUBQ.W      #1, D2                    ; Subtracts D2 by 1, 2 is 1, 0 is -1.
  ADD.W       ($2, A0), D2              ; Adds ($2 + A0) to D2, the current selected item ID.
  MOVE.W      ($20, A1), D3             ; Stores ($20 + A1) inside D3, the maximum selected item ID.
  TST.W       D2                        ; Compares 0 and D2.
  BGE         $14222E                   ; If it is bigger or equal 0, ignore the line below.
  MOVE.W      D3, D2                    ; Stores D3 inside D2, the maximum selected item ID.
  CMP.W       D3, D2                    ; Compares D3 and D2, the maximum selected item ID.
  BLE         $142234                   ; If it is less or equal D2, ignore the line below.
  CLR.W       D2                        ; Clears D2.
  MOVE.W      D2, ($2, A0)              ; Stores D2 inside ($2 + A0), the new selected item.
  ADD.W       D2, D2                    ; Adds D2 to D2, menu item offset is 2 bytes.
  MOVE.W      ($30, A1, D2.W), D0       ; Stores ($30 + A1 + D2.W) inside D0, the ROM menu item memory offset.
  MOVE.W      (A1, D0.W), D1            ; Stores (A1 + D0.W) inside D1, the RAM item value memory offset.
  MOVE.W      #1, D2                    ; Stores 1 inside D2, a change happened.
  RTS                                   ; Returns back to the routine that called this code.

  CLR.W      D2                         ; Clears D2, changes didn't happen.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $142260

                                        ; Block of code that handles the input press.
  CLR.W       D2                        ; Clears D2.
  MOVE.B      ($28A8, A5), D2           ; Stores ($28A8 + A5) inside D2, P1 KeyPress.
  MOVE.B      #$3, D3                   ; Stores 3 inside D3, 2 left, 1 right.
  AND.B       D2, D3                    ; D2 and D3, P1 KeyPress.
  TST.B       D3                        ; Compare 0 and D3.
  BEQ         $1422A4                   ; If it is 0, button isn't down, go to the last block of code.
  AND.B       ($28AC, A5), D3           ; D3 and ($28AC + A5), P1 KeyDown/KeyUp.
  TST.B       D3                        ; Compare 0 and D3.
  BNE         $1422A4                   ; If it is not 0, button is being hold, go to the last block of code.

                                        ; Block of code that changes the character ID.
  MOVE.W      #1, D3                    ; Stores 1 inside D3, needed to convert the input.
  AND.W       D2, D3                    ; D3 and D2, P1 KeyPress, 2 is 0, 1 is 1.
  LSL.B       #1, D3                    ; Shifts left D3 bits by 1, 0 is 0, 1 is 2.
  SUBQ.B      #1, D3                    ; Subtracts D3 by 1, 0 is -1, 2 is 1.
  ADD.B       (A5, D1.W), D3            ; Adds (A5 + D1.W) inside D3, the item value.
  MOVE.W      ($2, A1, D0.W), D2        ; Stores ($2 + A1 + D0.W) inside D2, the minimum valid value.
  CMP.B       D2, D3                    ; Compares D3 and D2.
  BGE         $142290                   ; If it is bigger or equals D2, ignore the line below.
  MOVE.W      D2, D3                    ; Stores D2 inside D3, the minimum valid value.
  MOVE.W      ($4, A1, D0.W), D2        ; Stores ($4 + A1 + D0.W) inside D2, the maximum valid value.
  CMP.B       D2, D3                    ; Compares D3 and D2.
  BLE         $14229A                   ; If it is smaller or equals D2, ignore the line below.
  MOVE.W      D2, D3                    ; Stores D2 inside D3, the maximum valid value.
  MOVE.B      D3, (A5, D1.W)            ; Stores D3 inside (A5 + D1.W), the new item value.
  MOVE.B      #1, D2                    ; Stores 1 inside D2, a change happened.
  RTS                                   ; Returns back to the routine that called this code.

  CLR.W      D2                         ; Clears D2, changes didn't happen.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $1422C0

                                        ; Block of code that handles exiting the menu
  BTST        #0, ($28A6, A5)           ; Tests the 1st bit of ($28A6 + A5), P1 start button KeyPress.
  BEQ         $1422D4                   ; If it is 0, ignore the line below.
  CLR.L       (A0)                      ; Clears (A0), the menu memory data.
  BSR         $142180                   ; Calls the routine that cleans the screen.
  MOVE.W      #$200, ($1664, A5)        ; Stores 200 inside ($1664 + A5), forces the test menu to be redrawn.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $1422F0

                                        ; Block of code that prints text in line, stops at 00.
  MOVE.W      #$C000, D3                ; Stores C000 inside D3, necessary value.
  MOVE.B      (A2)+, D3                 ; Stores (A2) inside D3 and incrementes A2, the character.
  TST.B       D3                        ; Compares 0 and D3.
  BEQ         $142306                   ; If it is 0, go to the last line.
  MOVE.W      D3, (A3)                  ; Stores D3 inside (A3), the sprite in the screen region.
  MOVE.W      D2, ($2, A3)              ; Stores D2 inside ($2 + A3), the pallete ID.
  LEA         ($80, A3), A3             ; Stores ($80 + A3) inside A3, next character screen position.
  BRA         $1422F4                   ; Jumps back to the 1st line.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $142320

                                        ; Block of code that saves some values.
  MOVE.L      D0, ($7FE0, A5)           ; Stores D0 inside ($7FE0 + A5), saves it for safety.
  MOVE.L      D1, ($7FE4, A5)           ; Stores D1 inside ($7FE4 + A5), saves it for safety.
  MOVE.L      D2, ($7FE8, A5)           ; Stores D2 inside ($7FE8 + A5), saves it for safety.
  MOVE.L      D3, ($7FEC, A5)           ; Stores D3 inside ($7FEC + A5), saves it for safety.
  MOVE.L      A0, ($7FF0, A5)           ; Stores A0 inside ($7FF0 + A5), saves it for safety.
  MOVE.L      A1, ($7FF4, A5)           ; Stores A1 inside ($7FF4 + A5), saves it for safety.
  MOVE.L      A2, ($7FF8, A5)           ; Stores A2 inside ($7FF8 + A5), saves it for safety.
  MOVE.L      A3, ($7FFC, A5)           ; Stores A3 inside ($7FFC + A5), saves it for safety.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $142360

                                        ; Block of code that restore the values.
  MOVE.L      ($7FE0, A5), D0           ; Stores ($7FE0 + A5) + D0 inside, restore the value.
  MOVE.L      ($7FE4, A5), D1           ; Stores ($7FE4 + A5) + D1 inside, restore the value.
  MOVE.L      ($7FE8, A5), D2           ; Stores ($7FE8 + A5) + D2 inside, restore the value.
  MOVE.L      ($7FEC, A5), D3           ; Stores ($7FEC + A5) + D3 inside, restore the value.
  MOVE.L      ($7FF0, A5), A0           ; Stores ($7FF0 + A5) + A0 inside, restore the value.
  MOVE.L      ($7FF4, A5), A1           ; Stores ($7FF4 + A5) + A1 inside, restore the value.
  MOVE.L      ($7FF8, A5), A2           ; Stores ($7FF8 + A5) + A2 inside, restore the value.
  MOVE.L      ($7FFC, A5), A3           ; Stores ($7FFC + A5) + A3 inside, restore the value.
  RTS                                   ; Returns back to the routine that called this code.
     


; It has routines that handle a custom menu that can
; be used to change settings / values.
; The menu has a title at the top, hints at the bottom
; and items that will be configured in the middle.
; 
; A0 holds the RAM menu memory region.
; A1 holds the ROM menu data memory region.
; D0 holds the ROM menu item memory offset.
; D1 holds the RAM address offset the menu item will change.
; (A0).B holds the menu active flag.
; ($1 + A0).B holds the menu drawn flag.
; ($2+ A0).W holds the selected menu item ID.
;
; The format of the menu needs to be as informed below:
;
; 1:  The 1st and 2nd line (32 bytes) must have the
;     title of the menu. Each line is 16 bytes.
;
; 2:  The first 2 bytes of the 3rd line must have the
;     the amount of items the menu will have.
;
; 3:  The 4th line will have the offset of each item in 
;     sequence until all items are covered. The value of  
;     the offset + the ROM menu address must result in
;     the first byte of the ROM menu item address.
;     Ex: 1st menu item is the value of the first 2 bytes
;         of the 4th line + the ROM menu address, so it
;         should result in the ROM menu item address.
;
; 4:  The first 2 bytes of the ROM menu item address is
;     the offset of the item value, the value that 
;     should be edited, you can get it by adding the 
;     offset and A5.
;
; 5:  The bytes 3 and 4 are the minimum value the item 
;     value accepts and the bytes 4 and 5 are the 
;     maximum value.
;
; 6:  The 2nd line contains the label of the menu item 
;
; 7:  The following lines are the label of the item value.
;
; 142000: Manage Menu
; 142040: Start Menu
; 142070: Draw Menu Title
; 1420A0: Draw Menu Hints
; 142100: Draw Selected Menu Item Label
; 142140: Draw Selected Menu Item Value Label
; 142180: Clean Screen.
; 1421B0: Change Selected Menu Item Feature
; 1421D0: Change Menu Item Value Feature
; 142200: Handle Change Selected Menu Item
; 142260: Handle Change Menu Item Value
; 1422C0: Handle Exit Menu
; 1422F0: Draw Text
; 142320: Save Register Values
; 142360: Restore Register Values
;
; 1423A0: Menu Builder Hint 1 Text (Data Below)
;         20 20 68 43 6E 61 65 67 49 20 65 74 3A 6D 20 20
;         31 50 55 20 20 70 72 6F 44 20 77 6F 20 6E 00 20
;
; 1423D0: Menu Builder Hint 2 Text (Data Below)
;         20 20 68 43 6E 61 65 67 56 20 6C 61 65 75 20 3A
;         31 50 4C 20 20 74 72 6F 52 20 20 74 20 20 00 20
;
; 142400: Menu Builder Hint 3 Text (Data Below)
;         20 20 68 43 6E 61 65 67 49 20 65 74 3A 6D 20 20
;         31 50 55 20 20 70 61 64 6E 44 20 77 6F 20 6E 00
;
; 142430: Menu Builder Empty Text (Data Below)
;         20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20
;         20 20 20 20 00 00 00 00 00 00 00 00 00 00 00 00