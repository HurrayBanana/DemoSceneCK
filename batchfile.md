## Launching TIC-80

To launch **TIC-80** and auto load the **tiles**, **sprites**, **code** and seperate **audio* use the following batch file in the same directory as your:

* TIC-80.exe
* tilesheet.png
* spritesheet.png
* user.lua
* audio.tic

```batch
tic80 --fs="./" --fullscreen --cmd "import code .\user.lua & import sprites spriteset.png & import tiles tileset.png & load audio sfx & load audio music & run" 
```

to stop this generating errors you will need to save a cartridge with you audio (sfx and music) in it.

While you have TIC-80 loaded enter this at the command prompt

```lua
save audio
```


