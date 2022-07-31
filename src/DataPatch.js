const dataPatch = 
{
  type: "overwrite",
  filename: "cce_re.10f",
  byteFormat: "hex",
  data:
  {
    // Shadow Pallete Change (00 to 16)
    "19850": ["16"],

    // Shadow Pallete Change (00 to 16 / value 20 to 36)
    "19866": ["36"],

    // Shadow Pallete Change (00 to 16)
    "19920": ["16"],

    // Shadow Pallete Change (00 to 16)
    "19936": ["16"],

    // Shadow Pallete Change (00 to 16 / value 20 to 36)
    "19952": ["36"],

    // Shadow Pallete Change (00 to 16)
    "20006": ["16"],

    // Shadow Pallete Change (00 to 16 / value 20 to 36)
    "20022": ["36"],

    // Shadow Pallete Change (00 to 16)
    "20076": ["16"],

    // Shadow Pallete Change (00 to 16)
    "20092": ["16"],

    // Shadow Pallete Change (00 to 16)
    "20108": ["16"],

    // Shadow Pallete Change (00 to 16 / value 20 to 36)
    "20124": ["36"],

    // Shadow Pallete Change (00 to 16)
    "20178": ["16"],

    // Shadow Pallete Change (00 to 16)
    "20194": ["16"],

    // Shadow Pallete Change (00 to 16)
    "20210": ["16"],

    // Shadow Pallete Change (00 to 16)
    "20226": ["16"],

    // Shadow Pallete Change (00 to 16 / value 20 to 36)
    "20242": ["36"],

    // Shadow Pallete Change (3 to 16)
    "20306": ["16"],



    // Remove Mack the Knife Image Yellow Blink (Select Screen)
    "63946":
    [
      "75", "4E", "71", "4E", "71", "4E", "71", "4E", 
      "71", "4E", "71", "4E", "71", "4E", "71", "4E", 
      "71", "4E", "71", "4E", "71", "4E", "71", "4E", 
      "71", "4E", "71", "4E", "71", "4E", "71", "4E", 
      "75", "4E"
    ],

    // Remove Captain Commando Image Yellow Blink (Select Screen)
    "63980":
    [
      "75", "4E", "71", "4E", "71", "4E", "71", "4E", 
      "71", "4E", "71", "4E", "71", "4E", "71", "4E", 
      "71", "4E", "71", "4E", "71", "4E", "71", "4E", 
      "71", "4E", "71", "4E", "71", "4E", "71", "4E", 
      "75", "4E"
    ],

    // Remove Ninja Commando Image Yellow Blink (Select Screen)
    "64014":
    [
      "75", "4E", "71", "4E", "71", "4E", "71", "4E", 
      "71", "4E", "71", "4E", "71", "4E", "71", "4E", 
      "71", "4E", "71", "4E", "71", "4E", "71", "4E", 
      "71", "4E", "71", "4E", "71", "4E", "71", "4E", 
      "71", "4E", "71", "4E", "71", "4E", "71", "4E", 
      "71", "4E", "71", "4E", "71", "4E", "71", "4E", 
      "75", "4E"
    ],

    // Remove Baby Head Image Yellow Blink (Select Screen)
    "64064":
    [
      "75", "4E", "71", "4E", "71", "4E", "71", "4E", 
      "71", "4E", "71", "4E", "71", "4E", "71", "4E", 
      "71", "4E", "71", "4E", "71", "4E", "71", "4E", 
      "71", "4E", "71", "4E", "71", "4E", "71", "4E", 
      "71", "4E", "71", "4E", "71", "4E", "71", "4E", 
      "71", "4E", "71", "4E", "71", "4E", "71", "4E", 
      "71", "4E", "71", "4E", "71", "4E", "71", "4E", 
      "71", "4E", "71", "4E", "71", "4E", "71", "4E", 
      "71", "4E", "71", "4E", "71", "4E", "71", "4E", 
      "71", "4E", "71", "4E", "71", "4E", "75", "4E"
    ],



    // Rocket Launcher Missile Pallete Change (00 to 0C / value 80 to 8C)
    "131376": ["8C", "00"],

    // Rocket Launcher Missile Pallete Change (00 to 0C / value 80 to 8C)
    "131400": ["8C", "00"],



    // Samson Hit By Shock Action Pallete Fix (Wrestler Gray)
    "151060": ["0C", "00"],

    // Organo Hit By Shock Action Pallete Fix (Wrestler Red)
    "151210": ["0C", "00"],

    // Marbin Hit By Shock Action Pallete Fix
    "184142": ["0C", "00"],

    // Musashi Hit By Shock Action Pallete Fix
    "200070": ["0C", "00"],

    // Z Hit By Shock Action Pallete Fix
    "224562": ["0C", "00"],

    // Brenda Hit By Shock Action Pallete Fix (Blonde Girl)
    "237384": ["0C", "00"],

    // Carol Hit By Shock Action Pallete Fix (Pink Girl)
    // Should readjust to 0C at run time
    "238236": ["81", "00"],

    // Monster Hit By Shock Action Pallete Fix
    "269204": ["0C", "00"],
    
    // Yamato Hit By Shock Action Pallete Fix
    "288090": ["0C", "00"],

    // Dolg Hit By Shock Action Pallete Fix
    // Remap readjusts to 0C
    "309206": ["81", "00"],

    // Shtrom and Shtrom Jr. Hit By Shock Action Pallete Fix
    // Should readjust to 0C at run time
    "327446": ["81", "00"],

    // Druk Hit By Shock Action Pallete Fix
    // Should readjust to 0C at run time
    "327684": ["81", "00"],

    // Blood Hit By Shock Action Pallete Fix
    "357208": ["0C", "00"],

    // Kojiro Hit By Shock Action Pallete Fix (Red Ninja)
    "458296": ["0C", "00"],

    // Hanzo Hit By Shock Action Pallete Fix (Blue Ninja)
    "474470": ["0C", "00"],

    // Sasuke Hit By Shock Action Pallete Fix (Green Ninja)
    "490290": ["0C", "00"],



    // Mardia Vomit Pallete Fix 1 (Redrawn with 6/7, Original is 03)
    "547136": ["07", "00"],

    // Mardia Vomit Pallete Fix 2 (Redrawn with 6/7, Original is 03)
    "547158": ["07", "12"],

    // Mardia Vomit Pallete Fix 3 (Redrawn with 6/7, Original is 03)
    "547188": ["07", "00"],

    // Mardia Vomit Pallete Fix 4 (Redrawn with 6/7, Original is 03)
    "547220": ["07", "12"],

    // Mardia Vomit Pallete Fix 5 (Redrawn with 6/7, Original is 03)
    "547250": ["07", "00"],

    // Mardia Vomit Pallete Fix 6 (Redrawn with 6/7, Original is 03)
    "547280": ["07", "00"],

    // Mardia Vomit Pallete Fix 7 (Redrawn with 6/7, Original is 03)
    "547310": ["07", "13"],

    // Mardia Vomit Pallete Fix 8 (Redrawn with 6/7, Original is 03)
    "547344": ["07", "00"],

    // Mardia Vomit Pallete Fix 9 (Redrawn with 6/7, Original is 03)
    "547374": ["07", "00"],

    // Mardia Vomit Pallete Fix 10 (Redrawn with 6/7, Original is 03)
    "547412": ["07", "00"],

    // Mardia Vomit Pallete Fix 11 (Redrawn with 6/7, Original is 03)
    "547452": ["07", "00"],

    // Mardia Vomit Pallete Fix 12 (Redrawn with 6/7, Original is 03)
    "547494": ["07", "00"],

    // Mardia Vomit Pallete Fix 13 (Redrawn with 6/7, Original is 03)
    "547540": ["07", "11"],

    // Mardia Vomit Pallete Fix 14 (Redrawn with 6/7, Original is 03)
    "547566": ["07", "00"],

    // Mardia Vomit Pallete Fix 15 (Redrawn with 6/7, Original is 03)
    "547588": ["07", "00"],

    // Mardia Vomit Pallete Fix 16 (Redrawn with 6/7, Original is 03)
    "547610": ["07", "00"],

    // Mardia Vomit Pallete Fix 17 (Redrawn with 6/7, Original is 03)
    "547646": ["07", "00"],



    // 5th Boss Robot Head Bomb Pallete Fix 1 (Redrawn with 19, Original is 03)
    "552156": ["19", "11"],

    // 5th Boss Robot Head Bomb Pallete Fix 2 (Redrawn with 19, Original is 03)
    "552182": ["19", "11"],

    // 5th Boss Robot Head Bomb Pallete Fix 3 (Redrawn with 19, Original is 03)
    "552208": ["19", "11"],

    // 5th Boss Robot Head Bomb Pallete Fix 4 (Redrawn with 19, Original is 03)
    "552234": ["19", "11"],



    // Mack the Knife Smoke Pallete Fix 1 (02 to 0D)
    "613316": ["0D", "01"],

    // Mack the Knife Smoke Pallete Fix 2 (02 to 0D)
    "613338": ["0D", "01"],

    // Mack the Knife Smoke Pallete Fix 3 (02 to 0D)
    "613360": ["0D", "11"],

    // Mack the Knife Smoke Pallete Fix 4 (02 to 0D)
    "613386": ["0D", "11"],

    // Mack the Knife Smoke Pallete Fix 5 (02 to 0D)
    "613412": ["0D", "11"],

    // Mack the Knife Smoke Pallete Fix 6 (02 to 0D)
    "613438": ["0D", "11"],

    // Mack the Knife Smoke Pallete Fix 7 (02 to 0D)
    "613464": ["0D", "11"],

    // Mack the Knife Smoke Pallete Fix 8 (02 to 0D)
    "613490": ["0D", "11"],

    // Mack the Knife Smoke Pallete Fix 9 (02 to 0D)
    "613516": ["0D", "11"],

    // Mack the Knife Smoke Pallete Fix 10 (02 to 0D)
    "613542": ["0D", "01"],

    // Mack the Knife Smoke Pallete Fix 11 (02 to 0D)
    "613564": ["0D", "01"],

    // Mack the Knife Smoke Pallete Fix 12 (02 to 0D)
    "613586": ["0D", "01"],



    // Sandwich Pallete Fix (Redrawn with 14, Original is 03)
    "616002": ["14", "00"],

    // Coffee Pallete Fix (Redrawn with 0C, Original is 01)
    "616054": ["0C", "01"],

    // Lemon Pallete Fix 1 (Redrawn with 17, Original is 02)
    "616080": ["17", "00"],

    // Lemon Pallete Fix 2 (Redrawn with 17, Original is 02)
    "616100": ["17", "00"],

    // Cherry Pallete Fix 1 (Redrawn with 0A, Original is 02)
    "616124": ["0A", "00"],

    // Cherry Pallete Fix 2 (Redrawn with 0A, Original is 02)
    "616144": ["0A", "00"],

    // Carol Picture
    // Former Monalisa Picture Pallete Fix 1 (Redrawn with 0E, Original is 03)
    "616206": ["0E", "22"],

    // Carol Picture
    // Former Monalisa Picture Pallete Fix 1 (Redrawn with 0E, Original is 03)
    "616242": ["0E", "00"],

    // Alien Moon Landscape View Picture
    // Former Volcano Picture Pallete Fix (Redrawn with 0F, Original is 00)
    "616282": ["0F", "00"],


    // Coin Pallete Fix 1 (Redrawn with 06, Original is 02)
    "616498": ["06", "00"],

    // Coin Pallete Fix 2 (Redrawn with 06, Original is 02)
    "616518": ["06", "00"],

    // Coin Pallete Fix 3 (Redrawn with 06, Original is 02)
    "616538": ["06", "00"],

    // Coin Pallete Fix 4 (Redrawn with 06, Original is 02)
    "616558": ["06", "00"],

    // Coin Pallete Fix 5 (Redrawn with 06, Original is 02)
    "616582": ["06", "00"],

    // Coin Pallete Fix 6 (Redrawn with 06, Original is 02)
    "616602": ["06", "00"],

    // Coin Pallete Fix 7 (Redrawn with 06, Original is 02)
    "616622": ["06", "00"],

    // Coin Pallete Fix 8 (Redrawn with 06, Original is 02)
    "616642": ["06", "00"],



    // Ginzu Hit By Shock Action Pallete Fix
    "771780": ["0C", "00"],



    // Characters Being Melted Pallete Fix 1 (01 to 0C)
    "773206": ["0C", "00"],

    // Characters Being Melted Pallete Fix 1 (01 to 0C)
    "773246": ["0C", "00"],

    // Characters Being Melted Pallete Fix 1 (01 to 0C)
    "773286": ["0C", "00"],

    // Characters Being Melted Pallete Fix 1 (01 to 0C)
    "773318": ["0C", "00"],



    // Samson Dizzy Star Pallete Fix 1
    "851534": ["0C", "00"],

    // Samson Dizzy Star Pallete Fix 2
    "851570": ["0C", "00"],

    // Samson Dizzy Star Pallete Fix 3
    "851618": ["2C", "00"],

    // Samson Dizzy Star Pallete Fix 4
    "851636": ["2C", "00"],

    // Samson Dizzy Star Pallete Fix 5
    "851660": ["2C", "00"],

    // Samson Dizzy Star Pallete Fix 6
    "851720": ["0C", "00"],

    // Samson Dizzy Star Pallete Fix 7
    "925918": ["0C", "00"],

    // Samson Dizzy Star Pallete Fix 8
    "925936": ["0C", "00"],

    // Samson Dizzy Star Pallete Fix 9
    "925960": ["0C", "00"],



    // Musashi Dizzy Star Pallete Fix 1
    "863364": ["0C", "00"],

    // Musashi Dizzy Star Pallete Fix 2
    "863418": ["0C", "00"],

    // Musashi Dizzy Star Pallete Fix 3
    "863526": ["0C", "00"],

    // Musashi Dizzy Star Pallete Fix 4
    "863550": ["2C", "00"],

    // Musashi Dizzy Star Pallete Fix 5
    "863586": ["2C", "00"],

    // Musashi Dizzy Star Pallete Fix 6
    "863712": ["0C", "00"],

    // Musashi Dizzy Star Pallete Fix 7
    "863850": ["2C", "00"],

    // Musashi Dizzy Star Pallete Fix 8
    "863904": ["2C", "00"],

    // Musashi Dizzy Star Pallete Fix 9
    "864012": ["0C", "00"],

    // Musashi Dizzy Star Pallete Fix 10
    "864036": ["0C", "00"],

    // Musashi Dizzy Star Pallete Fix 11
    "864072": ["0C", "00"],



    // Brenda Shock Idle Action Pallete Fix
    "872238":
    [
      "0C", "00", "00", "00", "10", "00", "0C", "00",
      "00", "00", "10", "00", "0C", "00", "10", "00",
      "D0", "FF", "0C", "00", "00", "00", "10", "00",
      "0C", "00", "00", "00", "10", "00", "0C", "00",
      "00", "00", "10", "00", "0C", "00", "00", "00",
      "20", "00", "16", "00", "10", "00", "B0", "FF",
      "0C", "00", "00", "00", "10", "00", "0C", "00",
      "00", "00", "10", "00", "0C", "00", "00", "00",
      "20", "00", "16", "00", "00", "00", "10", "00",
      "16", "00", "10", "00", "C0", "FF", "16", "00",
      "00", "00", "10", "00", "16", "00", "00", "00",
      "10", "00", "16", "00", "00", "00", "10", "00",
      "16", "00", "00", "00", "10", "00", "16", "00",
      "10", "00", "C0", "FF", "16", "00", "00", "00",
      "10", "00", "16", "00", "00", "00", "10", "00",
      "16", "00", "00", "00", "10", "00", "16", "00",
      "00", "00", "10", "00", "16", "00", "DD", "FF",
      "50", "00"
    ],

    // Brenda Shock Attack 1 Action Pallete Fix
    "873650":
    [
      "0C", "00", "00", "00", "10", "00", "0C", "00",
      "10", "00", "F0", "FF", "0C", "00", "00", "00",
      "10", "00", "0C", "00", "00", "00", "20", "00",
      "0C", "00", "10", "00", "C0", "FF", "0C", "00",
      "00", "00", "10", "00", "0C", "00", "00", "00",
      "10", "00", "0C", "00", "00", "00", "10", "00",
      "0C", "00", "00", "00", "10", "00", "0C", "00",
      "10", "00", "C0", "FF", "0C", "00", "00", "00",
      "10", "00", "16", "00", "00", "00", "10", "00",
      "0C", "00", "00", "00", "10", "00", "0C", "00",
      "10", "00", "E0", "FF", "0C", "00", "00", "00",
      "10", "00", "0C", "00", "00", "00", "10", "00",
      "0C", "00", "00", "00", "10", "00", "0C", "00",
      "10", "00", "00", "00", "0C", "00", "10", "00",
      "00", "00", "0C", "00", "DD", "FF", "20", "00"
    ],

    // Brenda Shock Attack 2 Action Pallete Fix
    "873814":
    [
      "0C", "00", "00", "00", "10", "00", "0C", "00",
      "00", "00", "10", "00", "0C", "00", "00", "00",
      "10", "00", "0C", "00", "10", "00", "D0", "FF",
      "0C", "00", "00", "00", "10", "00", "0C", "00",
      "00", "00", "10", "00", "0C", "00", "00", "00",
      "10", "00", "0C", "00", "10", "00", "D0", "FF",
      "0C", "00", "00", "00", "10", "00", "16", "00",
      "00", "00", "10", "00", "16", "00", "00", "00",
      "10", "00", "0C", "00", "10", "00", "D0", "FF",
      "0C", "00", "00", "00", "10", "00", "0C", "00",
      "00", "00", "10", "00", "0C", "00", "00", "00",
      "10", "00", "0C", "00", "ED", "FF", "58", "00"
    ],



    // Shtrom / Shtrom Jr. Dizzy Star Pallete Fix 1
    "901058": ["0C", "00"],

    // Shtrom / Shtrom Jr. Dizzy Star Pallete Fix 2
    "901064": ["0C", "00"],

    // Shtrom / Shtrom Jr. Dizzy Star Pallete Fix 3
    "901178": ["0C", "00"],

    // Shtrom / Shtrom Jr. Dizzy Star Pallete Fix 4
    "901184": ["2C", "00"],

    // Shtrom / Shtrom Jr. Dizzy Star Pallete Fix 5
    "901190": ["2C", "00"],

    // Shtrom / Shtrom Jr. Dizzy Star Pallete Fix 6
    "901310": ["0C", "00"],

    // Shtrom / Shtrom Jr. Dizzy Star Pallete Fix 7
    "901418": ["0C", "00"],

    // Shtrom / Shtrom Jr. Dizzy Star Pallete Fix 8
    "901310": ["0C", "00"],

    // Shtrom / Shtrom Jr. Dizzy Star Pallete Fix 9
    "901424": ["0C", "00"],

    // Shtrom / Shtrom Jr. Dizzy Star Pallete Fix 10
    "901430": ["0C", "00"],

    // Shtrom / Shtrom Jr. Dizzy Star Pallete Fix 11
    "901550": ["2C", "00"],

    // Shtrom / Shtrom Jr. Dizzy Star Pallete Fix 12
    "901556": ["2C", "00"],



    // Blood Dizzy Star Pallete Fix 1
    "926904": ["0C", "00"],

    // Blood Dizzy Star Pallete Fix 2
    "926910": ["0C", "00"],

    // Blood Dizzy Star Pallete Fix 3
    "927078": ["0C", "00"],

    // Blood Dizzy Star Pallete Fix 4
    "927084": ["2C", "00"],

    // Blood Dizzy Star Pallete Fix 5
    "927090": ["2C", "00"],

    // Blood Dizzy Star Pallete Fix 6
    "927258": ["0C", "00"],

    // Blood Dizzy Star Pallete Fix 7
    "927426": ["0C", "00"],

    // Blood Dizzy Star Pallete Fix 8
    "927432": ["0C", "00"],

    // Blood Dizzy Star Pallete Fix 9
    "927438": ["2C", "00"],



    // Rocket Launcher Missile Pallete Change 1 (00 to 0C / value 20 to 2C)
    "948926": ["2C", "00"],

    // Rocket Launcher Missile Pallete Change 2 (00 to 0C / value 20 to 2C)
    "948932": ["2C", "00"],

    // Rocket Launcher Missile Pallete Change 3 (00 to 0C / value 20 to 2C)
    "948938": ["2C", "00"],



    // Musashi Broken Sword Dizzy Star Pallete Fix 1
    "961734": ["2C", "00"],

    // Musashi Broken Sword Dizzy Star Pallete Fix 2
    "961782": ["2C", "00"],

    // Musashi Broken Sword Dizzy Star Pallete Fix 3
    "961854": ["2C", "00"],

    // Musashi Broken Sword Dizzy Star Pallete Fix 4
    "961878": ["2C", "00"],

    // Musashi Broken Sword Dizzy Star Pallete Fix 5
    "961908": ["2C", "00"],

    // Musashi Broken Sword Dizzy Star Pallete Fix 6
    "962004": ["2C", "00"],

    // Musashi Broken Sword Dizzy Star Pallete Fix 7
    "962100": ["0C", "00"],

    // Musashi Broken Sword Dizzy Star Pallete Fix 8
    "962130": ["0C", "00"],

    // Musashi Broken Sword Dizzy Star Pallete Fix 9
    "962160": ["0C", "00"],



    // Organo Dizzy Star Pallete Fix 1
    "978248": ["0C", "00"],

    // Organo Dizzy Star Pallete Fix 2
    "978284": ["0C", "00"],

    // Organo Dizzy Star Pallete Fix 3
    "978332": ["2C", "00"],

    // Organo Dizzy Star Pallete Fix 4
    "978350": ["2C", "00"],

    // Organo Dizzy Star Pallete Fix 5
    "978374": ["2C", "00"],

    // Organo Dizzy Star Pallete Fix 6
    "978434": ["0C", "00"],

    // Organo Dizzy Star Pallete Fix 7
    "978500": ["0C", "00"],

    // Organo Dizzy Star Pallete Fix 8
    "978518": ["0C", "00"],

    // Organo Dizzy Star Pallete Fix 9
    "978542": ["0C", "00"],



    // Druk Dizzy Star Pallete Fix 1
    "983472": ["0C", "00"],

    // Druk Dizzy Star Pallete Fix 2
    "983478": ["0C", "00"],

    // Druk Dizzy Star Pallete Fix 3
    "983592": ["0C", "00"],

    // Druk Dizzy Star Pallete Fix 4
    "983598": ["2C", "00"],

    // Druk Dizzy Star Pallete Fix 5
    "983604": ["2C", "00"],

    // Druk Dizzy Star Pallete Fix 6
    "983724": ["0C", "00"],

    // Druk Dizzy Star Pallete Fix 7
    "983832": ["0C", "00"],

    // Druk Dizzy Star Pallete Fix 8
    "983838": ["0C", "00"],

    // Druk Dizzy Star Pallete Fix 9
    "983844": ["0C", "00"],

    // Druk Dizzy Star Pallete Fix 10
    "983964": ["2C", "00"],

    // Druk Dizzy Star Pallete Fix 11
    "983970": ["2C", "00"],



    // Carol Shock Idle Action Pallete Fix
    "981232": 
    [
      "0C", "00", "00", "00", "10", "00", "0C", "00",
      "00", "00", "10", "00", "0C", "00", "10", "00",
      "D0", "FF", "0C", "00", "00", "00", "10", "00",
      "0C", "00", "00", "00", "10", "00", "0C", "00",
      "00", "00", "10", "00", "0C", "00", "00", "00",
      "20", "00", "1D", "00", "10", "00", "B0", "FF",
      "0C", "00", "00", "00", "10", "00", "0C", "00",
      "00", "00", "10", "00", "0C", "00", "00", "00",
      "20", "00", "1D", "00", "00", "00", "10", "00",
      "1D", "00", "10", "00", "C0", "FF", "1D", "00",
      "00", "00", "10", "00", "1D", "00", "00", "00",
      "10", "00", "1D", "00", "00", "00", "10", "00",
      "1D", "00", "00", "00", "10", "00", "1D", "00",
      "10", "00", "C0", "FF", "1D", "00", "00", "00",
      "10", "00", "1D", "00", "00", "00", "10", "00",
      "1D", "00", "00", "00", "10", "00", "1D", "00",
      "00", "00", "10", "00", "1D", "00", "AD", "FF",
      "40", "00"
    ],

    // Carol Shock Attack 1 Action Pallete Fix
    "981370": 
    [
      "0C", "00", "00", "00", "10", "00", "0C", "00",
      "10", "00", "F0", "FF", "0C", "00", "00", "00",
      "10", "00", "0C", "00", "00", "00", "20", "00",
      "0C", "00", "10", "00", "C0", "FF", "0C", "00",
      "00", "00", "10", "00", "0C", "00", "00", "00",
      "10", "00", "0C", "00", "00", "00", "10", "00",
      "0C", "00", "00", "00", "10", "00", "0C", "00",
      "10", "00", "C0", "FF", "0C", "00", "00", "00",
      "10", "00", "1D", "00", "00", "00", "10", "00",
      "0C", "00", "00", "00", "10", "00", "0C", "00",
      "10", "00", "E0", "FF", "0C", "00", "00", "00",
      "10", "00", "0C", "00", "00", "00", "10", "00",
      "0C", "00", "00", "00", "10", "00", "0C", "00",
      "10", "00", "00", "00", "0C", "00", "10", "00",
      "00", "00", "0C", "00", "DD", "FF", "40", "00"
    ],

    // Carol Shock Attack 2 Action Pallete Fix
    "981490": 
    [
      "0C", "00", "00", "00", "10", "00", "0C", "00",
      "00", "00", "10", "00", "0C", "00", "00", "00",
      "10", "00", "0C", "00", "10", "00", "D0", "FF",
      "0C", "00", "00", "00", "10", "00", "0C", "00",
      "00", "00", "10", "00", "0C", "00", "00", "00",
      "10", "00", "0C", "00", "10", "00", "D0", "FF",
      "0C", "00", "00", "00", "10", "00", "1D", "00",
      "00", "00", "10", "00", "1D", "00", "00", "00",
      "10", "00", "0C", "00", "10", "00", "D0", "FF",
      "0C", "00", "00", "00", "10", "00", "0C", "00",
      "00", "00", "10", "00", "0C", "00", "00", "00",
      "10", "00", "0C", "00", "E8", "FF", "20", "00"
    ],



    // Pallete 0C 1 Change (Forced it to be the same as 01)
    "1070576": 
    [
      "FF", "FF", "EF", "FD", "CE", "FB", "AC", "F9",
      "8A", "F7", "68", "F5", "46", "F3", "22", "F2",
      "F5", "FF", "B0", "FF", "80", "FE", "C9", "FF",
      "96", "FF", "53", "FC", "32", "F9", "90", "F9"
    ],

    // Pallete 0C 2 Change (Forced it to be the same as 01)
    "1071600": 
    [
      "FF", "FF", "EF", "FD", "CE", "FB", "AC", "F9",
      "8A", "F7", "68", "F5", "46", "F3", "22", "F2",
      "F5", "FF", "B0", "FF", "80", "FE", "C9", "FF",
      "96", "FF", "53", "FC", "32", "F9", "90", "F9"
    ],

    // Pallete 0C 3 Change (Forced it to be the same as 01)
    "1072624": 
    [
      "FF", "FF", "EF", "FD", "CE", "FB", "AC", "F9",
      "8A", "F7", "68", "F5", "46", "F3", "22", "F2",
      "F5", "FF", "B0", "FF", "80", "FE", "C9", "FF",
      "96", "FF", "53", "FC", "32", "F9", "90", "F9"
    ],

    // Pallete 0C 4 Change (Forced it to be the same as 01)
    "1073648": 
    [
      "FF", "FF", "EF", "FD", "CE", "FB", "AC", "F9",
      "8A", "F7", "68", "F5", "46", "F3", "22", "F2",
      "F5", "FF", "B0", "FF", "80", "FE", "C9", "FF",
      "96", "FF", "53", "FC", "32", "F9", "90", "F9"
    ],

    // Pallete 0C 5 Change (Forced it to be the same as 01)
    "1074672": 
    [
      "FF", "FF", "EF", "FD", "CE", "FB", "AC", "F9",
      "8A", "F7", "68", "F5", "46", "F3", "22", "F2",
      "F5", "FF", "B0", "FF", "80", "FE", "C9", "FF",
      "96", "FF", "53", "FC", "32", "F9", "90", "F9"
    ],

    // Pallete 0C 6 Change (Forced it to be the same as 01)
    "1075696": 
    [
      "FF", "FF", "EF", "FD", "CE", "FB", "AC", "F9",
      "8A", "F7", "68", "F5", "46", "F3", "22", "F2",
      "F5", "FF", "B0", "FF", "80", "FE", "C9", "FF",
      "96", "FF", "53", "FC", "32", "F9", "90", "F9"
    ],

    // Pallete 0C 7 Change (Forced it to be the same as 01)
    "1076720": 
    [
      "FF", "FF", "EF", "FD", "CE", "FB", "AC", "F9",
      "8A", "F7", "68", "F5", "46", "F3", "22", "F2",
      "F5", "FF", "B0", "FF", "80", "FE", "C9", "FF",
      "96", "FF", "53", "FC", "32", "F9", "90", "F9"
    ],

    // Pallete 0C 8 Change (Forced it to be the same as 01)
    "1077744": 
    [
      "FF", "FF", "EF", "FD", "CE", "FB", "AC", "F9",
      "8A", "F7", "68", "F5", "46", "F3", "22", "F2",
      "F5", "FF", "B0", "FF", "80", "FE", "C9", "FF",
      "96", "FF", "53", "FC", "32", "F9", "90", "F9"
    ],

    // Pallete 0C 9 Change (Forced it to be the same as 01)
    "1078768": 
    [
      "FF", "FF", "EF", "FD", "CE", "FB", "AC", "F9",
      "8A", "F7", "68", "F5", "46", "F3", "22", "F2",
      "F5", "FF", "B0", "FF", "80", "FE", "C9", "FF",
      "96", "FF", "53", "FC", "32", "F9", "90", "F9"
    ],


    
    // Pallete 0E 1 Change (Small Improvement to the colors)
    "1070640": 
    [
      "11", "F1", "E8", "FF", "C7", "FF", "96", "FE",
      "85", "FC", "64", "F9", "40", "F6", "01", "F3",
      "04", "F5", "06", "F7", "18", "F9", "4A", "FB",
      "7C", "FD", "AE", "FF", "EE", "FF", "90", "F9"
    ],

    // Pallete 0E 2 Change (Small Improvement to the colors)
    "1071664": 
    [
      "11", "F1", "E8", "FF", "C7", "FF", "96", "FE",
      "85", "FC", "64", "F9", "40", "F6", "01", "F3",
      "04", "F5", "06", "F7", "18", "F9", "4A", "FB",
      "7C", "FD", "AE", "FF", "EE", "FF", "90", "F9"
    ],

    // Pallete 0E 3 Change (Small Improvement to the colors)
    "1072688": 
    [
      "11", "F1", "E8", "FF", "C7", "FF", "96", "FE",
      "85", "FC", "64", "F9", "40", "F6", "01", "F3",
      "04", "F5", "06", "F7", "18", "F9", "4A", "FB",
      "7C", "FD", "AE", "FF", "EE", "FF", "90", "F9"
    ],

    // Pallete 0E 4 Change (Small Improvement to the colors)
    "1073712": 
    [
      "11", "F1", "E8", "FF", "C7", "FF", "96", "FE",
      "85", "FC", "64", "F9", "40", "F6", "01", "F3",
      "04", "F5", "06", "F7", "18", "F9", "4A", "FB",
      "7C", "FD", "AE", "FF", "EE", "FF", "90", "F9"
    ],

    // Pallete 0E 5 Change (Small Improvement to the colors)
    "1074736": 
    [
      "11", "F1", "E8", "FF", "C7", "FF", "96", "FE",
      "85", "FC", "64", "F9", "40", "F6", "01", "F3",
      "04", "F5", "06", "F7", "18", "F9", "4A", "FB",
      "7C", "FD", "AE", "FF", "EE", "FF", "90", "F9"
    ],

    // Pallete 0E 6 Change (Small Improvement to the colors)
    "1075760": 
    [
      "11", "F1", "E8", "FF", "C7", "FF", "96", "FE",
      "85", "FC", "64", "F9", "40", "F6", "01", "F3",
      "04", "F5", "06", "F7", "18", "F9", "4A", "FB",
      "7C", "FD", "AE", "FF", "EE", "FF", "90", "F9"
    ],

    // Pallete 0E 7 Change (Small Improvement to the colors)
    "1076784": 
    [
      "11", "F1", "E8", "FF", "C7", "FF", "96", "FE",
      "85", "FC", "64", "F9", "40", "F6", "01", "F3",
      "04", "F5", "06", "F7", "18", "F9", "4A", "FB",
      "7C", "FD", "AE", "FF", "EE", "FF", "90", "F9"
    ],

    // Pallete 0E 8 Change (Small Improvement to the colors)
    "1077808": 
    [
      "11", "F1", "E8", "FF", "C7", "FF", "96", "FE",
      "85", "FC", "64", "F9", "40", "F6", "01", "F3",
      "04", "F5", "06", "F7", "18", "F9", "4A", "FB",
      "7C", "FD", "AE", "FF", "EE", "FF", "90", "F9"
    ],

    // Pallete 0E 9 Change (Small Improvement to the colors)
    "1078832":
    [
      "11", "F1", "E8", "FF", "C7", "FF", "96", "FE",
      "85", "FC", "64", "F9", "40", "F6", "01", "F3",
      "04", "F5", "06", "F7", "18", "F9", "4A", "FB",
      "7C", "FD", "AE", "FF", "EE", "FF", "90", "F9"
    ],



    // Mack the Knife Pallete 1 (Original, Pink and Orange)
    "1703936":
    [
      "11", "F1", "00", "F8", "30", "FB", "70", "FE",
      "A0", "FF", "D0", "FF", "58", "F0", "8B", "F5",
      "CE", "F8", "FF", "FA", "57", "F7", "69", "FB",
      "AC", "FE", "DF", "FF", "FF", "FF", "B9", "F0"
    ],

    // Mack the Knife Pallete 2 (Gray and Green)
    "1703968":
    [
      "02", "F1", "30", "F1", "52", "F3", "73", "F5",
      "95", "F7", "C8", "FA", "27", "F4", "5A", "F7",
      "8D", "FA", "CF", "FE", "43", "F5", "76", "F8",
      "A9", "FB", "DC", "FE", "FF", "FF", "B9", "F0"
    ],

    // Mack the Knife Pallete 3 (Green and Black)
    "1704000":
    [ 
      "12", "F0", "12", "F0", "34", "F2", "56", "F4",
      "78", "F6", "AB", "F9", "49", "F3", "7C", "F6",
      "AF", "F9", "DF", "FC", "53", "F0", "86", "F3",
      "BA", "F8", "ED", "FC", "FF", "FF", "B9", "F0"
    ],

    // Mack the Knife Pallete 4 (Purple and Blue)
    "1704032":
    [
      "11", "F1", "36", "F1", "59", "F3", "7C", "F5",
      "9F", "F7", "BF", "FA", "64", "F2", "97", "F4",
      "CA", "F8", "FD", "FB", "26", "F4", "49", "F7",
      "9C", "FA", "CF", "FD", "FF", "FF", "B9", "F0"
    ],



    // Captain Commando Pallete 1 (Original, Blue and Yellow)
    "1704192":
    [
      "11", "F1", "40", "F8", "80", "FC", "C9", "FF",
      "08", "F0", "4A", "F0", "6C", "F0", "9E", "F4",
      "AE", "F7", "BF", "FB", "DF", "FE", "FF", "FF",
      "00", "FF", "70", "FF", "C0", "FF", "B9", "F0"
    ],

    // Captain Commando Pallete 2 (Purple and Pink)
    "1704224":
    [
      "02", "F1", "55", "FA", "88", "FD", "C9", "FF",
      "04", "F1", "27", "F3", "49", "F5", "6B", "F7",
      "8D", "F9", "BF", "FB", "DF", "FD", "FF", "FF",
      "36", "F9", "69", "FC", "AB", "FF", "B9", "F0"
    ],

    // Captain Commando Pallete 3 (Gray and Gray)
    "1704256":
    [
      "11", "F1", "45", "F3", "78", "F6", "C9", "FF",
      "10", "F2", "21", "F3", "43", "F5", "65", "F7",
      "87", "F9", "BA", "FB", "DC", "FD", "FF", "FF",
      "48", "F2", "7A", "F5", "AB", "F9", "B9", "F0"
    ],

    // Captain Commando Pallete 4 (Green and Orange)
    "1704288":
    [
      "11", "F0", "30", "FD", "72", "FE", "C9", "FF",
      "31", "F0", "53", "F0", "75", "F1", "97", "F3",
      "B9", "F6", "C8", "FA", "EB", "FC", "FF", "FF",
      "21", "FB", "53", "FE", "95", "FF", "B9", "F0"
    ],



    // Ninja Commando Pallete 1 (Gray and Yellow)
    "1704448":
    [
      "FF", "FF", "EF", "FD", "CE", "FB", "AC", "F9",
      "8A", "F7", "68", "F5", "46", "F3", "22", "F2",
      "F5", "FF", "B0", "FF", "80", "FE", "C9", "FF",
      "96", "FF", "53", "FC", "32", "F9", "90", "F9"
    ],

    // Ninja Commando Pallete 2 (Purple and Orange)
    "1704480":
    [
      "FF", "FF", "CF", "FD", "AE", "FC", "8C", "FA",
      "6A", "F8", "48", "F6", "26", "F4", "03", "F2",
      "B5", "FF", "83", "FF", "61", "FF", "C9", "FF",
      "96", "FF", "53", "FC", "32", "F9", "90", "F9"
    ],

    // Ninja Commando Pallete 3 (Green and Pink)
    "1704512":
    [
      "FF", "FF", "FF", "FC", "DD", "F9", "BB", "F7",
      "99", "F5", "77", "F2", "55", "F0", "22", "F0",
      "CD", "FF", "9A", "FF", "67", "FC", "CA", "FF",
      "97", "FE", "54", "FB", "33", "F8", "90", "F9"
    ],

    // Ninja Commando Pallete 4 (Blue and White)
    "1704544":
    [
      "FF", "FF", "EF", "FC", "DF", "F9", "CF", "F7",
      "AE", "F4", "7B", "F2", "48", "F0", "24", "F0",
      "DD", "FE", "BB", "FD", "99", "FC", "CA", "FF",
      "A8", "FE", "76", "FB", "55", "F8", "90", "F9"
    ],



    // Baby Head Pallete 1 (Original, Green and Silver)
    "1704704":
    [
      "FF", "FF", "DA", "FF", "A6", "FE", "74", "FC",
      "43", "F9", "FB", "FB", "C7", "F7", "94", "F4",
      "62", "F2", "30", "F0", "DE", "FD", "AC", "FA",
      "79", "F7", "46", "F4", "11", "F1", "90", "F9"
    ],

    // Baby Head Pallete 2 (Blue and Purple)
    "1704736":
    [
      "FF", "FF", "DA", "FF", "A6", "FE", "74", "FC",
      "43", "F9", "DF", "FB", "BF", "F9", "9D", "F7",
      "69", "F4", "47", "F2", "BE", "FC", "7C", "F9",
      "4A", "F6", "29", "F4", "02", "F1", "90", "F9"
    ],

    // Baby Head Pallete 3 (Yellow and Green)
    "1704768":
    [
      "EA", "FF", "B6", "FD", "83", "FB", "51", "F8",
      "30", "F6", "D6", "FF", "B3", "FE", "81", "FC",
      "50", "FA", "20", "F7", "D8", "FC", "A5", "F8",
      "73", "F5", "40", "F2", "10", "F0", "90", "F9"
    ],

    // Baby Head Pallete 4 (Gray and Gold)
    "1704800":
    [
      "EA", "FF", "B6", "FD", "83", "FB", "51", "F8",
      "30", "F6", "C9", "FD", "A8", "FB", "87", "F9",
      "65", "F7", "43", "F5", "C3", "FF", "A1", "FE",
      "70", "FD", "40", "FB", "10", "F2", "90", "F9"
    ]
  }
}