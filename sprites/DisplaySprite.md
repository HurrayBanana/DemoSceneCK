
These effects should be added to a function that has defined a scene, such as:

```lua
  function myscene()
    local s = newscene("SPRITE",30,true) 
    -- effect code goes here
  end
```
[See creating a scene for more details](https://github.com/HurrayBanana/DemoSceneCK/blob/main/CreatingAScene.md)

## display a sprite

copy and paste the following code to your scene function (after the `newscene()` line). It is explained below.

```lua
	timing={showAfter=4,showFor=10}
	spritedata={sprite=2,x=0,y=0,tileswide=7,tileshigh=8,sx=1,sy=1,transpen=0}
	addScaledSprite(timing,spritedata)
```

**explanation** There are 3 parts to the sprite data

#### The timing
You can use clever timing across multiple sprites to acheive very interesting animation effects
```lua
--showAfter specifies how many seconds to wait before showing the sprite
--showFor specifies how many seconds to show the sprite
timing={showAfter=5,showFor=10}
```
#### The data parameters
```lua
--sprite is the sprite number of the top left corner of the sprite we wish to display
--x is the left most position on screen for the sprite
--y is the top most position on screen for the sprite
--tileswide is the number of 8x8 sprites horizontally (right of the sprite number given) that make up a larger sprite (must be at least 1)
--tileshigh is the number of 8x8 sprites vertically (down of the sprite number given) that make up a larger sprite (must be at least 1)
--sx is the horizontal scale of each letter (standard letter/sprite is 8 pixels wide)
--sy is the vertical scale of each letter (standard letter/sprite is 8 pixels tall)
--transpen is the colour to ignore when drawing the sprite, the transparent colour
data={sprite=2,x=0,y=0,tileswide=7,tileshigh=8,sx=1,sy=1,transpen=0}
```

#### Requesting the Sprite display
The crucial part is to use your data to control the display of the sprite. We give it the timing data and the spritedata

```lua
	addScaledSprite(timing,spritedata)
```

