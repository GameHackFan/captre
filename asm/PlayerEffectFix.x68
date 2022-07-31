*----------------------------------------------------------------------------------------------
* Title:        CAPTRE Player Effect Fix
* Written by:   GameHackFan
* Date:         
* Description:  It fixes the pallete of some effects use by the 
*               players.
*               It fixes the pallete of the replica effect that
*               is shown when the player respawn after dying a
*               life.
*               It fixes the pallete of the effect when the player
*               is cut in two pieces.
*----------------------------------------------------------------------------------------------

  JMP         $140900.L                 ; Replace 98CE4.

; ORG         $140900

                                        ; Block of code that sets the player color flags to the replica effect.
  MOVE.W      ($3A, A6), ($3A, A0)      ; Stores ($3A + A6) inside ($3A + A0), current player pallete flags.
  ADD.W       #$18, ($A0, A0)           ; Code from the original game that was replaced to jump to this code.
  JMP         $98CEA                    ; Jumps back to where it stopped in the original code.


  JMP         $140930.L                 ; Replace 9A380.

; ORG         $140930

                                        ; Block of code that sets the player color flags to the cut in half effect.
  MOVE.W      ($3A, A6), ($3A, A0)      ; Stores ($3A + A6) inside ($3A + A0), current player pallete flags.
  MOVE.B      #$8, ($5B, A0)            ; Code from the original game that was replaced to jump to this code.
  JMP         $9A386                    ; Jumps back to where it stopped in the original code.



; This module has a routine that fixes the replica
; effect that is used when the player respawn after 
; dying a life, the changes made in this hack bugs 
; the pallete of this effect, so this fix is a must.
;
; 140900: Replica Effect Fix (Current Player)
; 140930: Cut In Half Effect Fix (Current Player)