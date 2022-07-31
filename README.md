# Captain Commando Readjusted
A mod for the Captain Commando (World, Arcade).
<br/>
This mod brings some extra features and changes to the original game.
<br/><br/>
You can access the patcher [here](https://gamehackfan.github.io/captre/).
<br/><br/>

Version 1.0:
- Game Settings improvement, see all A changes.
- Change AA: Added support to allow some game settings to be independent of the dipswitches.
- Change AB: Only Difficulty 1, Difficulty 2 and Player Lives can be modified independent of the dipswitches.
- Change AC: Created a Configuration Menu that can be accessed in the Test Menu.
- Change AD: Added a hint telling players how they can access the Configuration Menu in the Test Menu.
- Change AE: The Configuration Menu allow the game settings informed above to be modified.
- Change AF: The changes made in the Configuration Menu will only be applied if Force Config is set to yes, otherwise the game will keep using the dipswitches.
- Change AG: The other settings are still 100% tied to the dipswitches, for now at least.
- Change AH: Play Mode setting is now forced to 4 players, you can't change it even using the dipswitches.
- Added a select character feature, see all B changes.
- Change BA: Players now can select their character.
- Change BB: Players now can select their character color, 4 colors are available.
- Change BC: Palletes 0, 1, 2, 3 will be used by P1, P2, P3, P4.
- Change BD: Players now have infinite time to select their character.
- Change BE: The former time label is now used to represent the player selected color.
- Change BF: When selecting the character, it will not display the lifebar and lives anymore, it is pointless.
- Change BG: After the character is selected, a code that handles color confirmation will ensure there isn't duplicated colors.
- Change BH: A coin will be decreased only after the character confirmation now.
- Change BI: In the Select Screen, after a player select their character, the game will automatically starts after 5 seconds.
- Change BJ: In the Select Screen, after a player select their character, a starting soon label will be displayed.
- Change BK: In the Select Screen, after a player select their character, The yellow blink is removed.
- Some objects and enemies were using the palletes 0, 1, 2, 3, they were changed, see all C changes.
- Change CA: Several sprites are using different palletes because the palletes 0, 1, 2, 3 is not reliable anymore.
- Change CB: Pallete 1 (Ginzu) is very important and are used for shock and melting effects, it is now replacing pallete C (very similar pallete anyways).
- Change CC: Sprites that were not forced via ROM to use other pallete and they use pallete 0, 1, 2, 3 are remapped at runtime to use palletes 9, C, D, 5.
- Change CD: Shadows are now using pallete 16 instead of 0.
- Change CE: Cherry sprites were redrawn to use pallete A instead of pallete 2.
- Change CF: Coin sprites were redrawn to use pallete 6 instead of pallete 2.
- Change CG: Robot Head Bomb (5th Boss) sprites were redrawn to use pallete 19 instead of pallete 3.
- Change CH: Sandwitch sprites were redrawn to use pallete 14 instead of pallete 3.
- Change CI: Enemy Z is now using pallete C instead of pallete 1 (C is pallete 1 now).
- Change CJ: Shock and Dizzy Stars effect that were using pallete 1 for several characters were changed to use pallete C.
- Change CK: Some shock sprites of Carol and Brenda were redrawn to use pallete C instead of their pallete.
- Change CL: Rocket Launcher Missile sprites were redrawn to use pallete C instead of 0.
- Change CM: Mack the Knife Smoke effect after a hit is now using pallete D instead of pallete 2.
- Change CN: Volcano Picture was redrawn, it is now a landscape of an alien moon and it uses pallete F instead of pallete 0.
- Change CO: Monalisa Picture was redrawn, it is now a picture of Carol and it uses pallete E instead of pallete 3.
- Change CP: Lemon sprites were redrawn to use pallete 17 instead of 2.
- Some enemies were bugged when hit by ice, see all D changes.
- Change DA: Some enemies don't behave properly when being hit by ice because it is impossible to hit them with ice (no Ice Robot available).
- Change DB: Sonie and Organo ice cube action fixed, it now properly grabs the pallete 7.
- Change DC: Dolg doesn't have an ice cube action, so now he behaves like being knocked down when hit by ice (the default behavior is getting dizzy and multiple hit connects, dealing massive damage).
- Change DD: Yamato doesn't have an ice cube action, so now he behaves like being knocked down when hit by ice (the default behavior is getting dizzy and multiple hit connects, dealing massive damage).
- Change DE: Blood doesn't have an ice cube action, so now he behaves like being knocked down when hit by ice (the default behavior is getting dizzy and multiple hit connects, dealing massive damage).
- Change DF: Dolg, Yamato and Blood have 3 actions when being hit by ice, on the ground, mid air and death, all of them behave like being knocked down now.
- Change DG: Some of Doppel replicas have a bugged ice cube action, others don't have anything, which crashes the game, so now all replicas behave like being knocked down when being hit by ice.
- Change DH: Like the others, Doppel also have a on the ground, mid air and death being hit by ice action, all of them behave like being knocked down now.
- Change DI: Shtrom Jr, for some reason has on the ground and mid air ice cube action, but he doesn't have a death one, so he behaves like being knocked down when dying with an ice hit now.
- Captain Commando can Discharge ice or fire depending on the current frame.
- If the arm of Captain Commando hits an enemy when he is doing the Discharge Attack, it will knockdown instead of burning the enemy or freezing the enemy.
- Now players have to kill Shtrom and Druk to beat the stage instead of just one of them.
- Fixed Doppel to better support several of the same replica, it now keeps a counter instead of an alive flag.
- Added progress to all lifebar colors (only yellow bar has progress in the original game).
- Removed the coin automatically increasing the player lives and decreasing the coin amount to 0.
- Continue Screen will automatically be activated if no player is active for 40 seconds.
- Coin score is fixed, it now works very similar to when the Play Mode is set to 3 or 2 players (every time you continue, it increases the coin score).
- A few colors of Pallete E are slightly modified now.
- Coffee sprite was redrawn just for the sake of being redrawn.
- Added a text with the hack name, version and link to the title screen and select screen.

See all changes made [here](https://github.com/GameHackFan/captre/blob/main/changelog).
<br/><br/>

Known Bugs:
- Doppel, when he transforms for the second time, it is possible to hold some of his replicas, not allowing them to transform, which will lead to having more replicas then it should (have no clue if it can be done in the original game, but it can in the readjusted version).
- On 5th Stage, P1, P2 and P3 can jump on the platform behind them, making their character float
(bug present in the original game).
- On 4th Stage, if you get to the boss with the Green Robot, the player with the robot can grab the monster while another player punch him to death, he doesn't even move (bug present in the original game).
- If you reach a boss right after the time expires, you don't lose your life, you can defeat the boss with the time label on the screen and nothing happens (bug present in the original game).
- If you let the time expire and you do not let your character to go back to the idle action, for example you keep punching or jumping forever, it will display a time over label but the game will not be able to kill you until you fail to keep punching or jumping, you can even beat the entire stage like that (bug present in the original game).
<br/><br/>



WHAT'S NEXT: The only interesting thing to do is make 4 players mode behave like 2 and 3 players mode do, add the rest of the dipswitches settings to the configuration menu, make the robots discharge faster and take less damage, redrawn the other shock sprites to use pallete C, and also maybe create the ice cube animations for all the enemies, but I have no idea if I will do those things.
