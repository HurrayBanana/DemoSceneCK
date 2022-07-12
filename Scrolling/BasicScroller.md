These effects should be added to a function that has defined a scene, such as:

```lua
  function myscene()
    local s = newscene("SPRITE",30,true) 
    -- effect code goes here
  end
```
[See creating a scene for more details](https://github.com/HurrayBanana/DemoSceneCK/blob/main/CreatingAScene.md)

## simple scrolling message

copy and paste the following code to your scene function (after the newscene line). It is explained below.

```lua
	backdrop="THIS IS MY MESSAGE "
	timing={showAfter=5,showFor=20}
	scrolldata={x=241,txt=backdrop,c=4,y=10,spd=60,sizex=2,sizey=4}
	ScrollHTimeLay(timing,scroll)
```

**explanation** There are 3 parts to the scrolling data

The message
```lua
--this is the text we want to display which we are calling backdrop
--The text must be in UPPER CASE
backdrop="THIS IS MY MESSAGE"
``` 

The timing
```lua
--showAfter specifies how many seconds to wait before showing the scroller
--showFor specifies how many seconds to show the scroller
timing={showAfter=5,showFor=20}
```
The display parameters
```lua
--x is the starting position, here we want it to start just off the right hand side of the screen
--txt specifies the message to display (we defined it as backdrop earlier)
--c specifes the colour to use 0 to 15 (check the sprite worksheets for the colours)
--y is the height (top of the text) on screen to show the message
--spd is the number of pixels per second to move the messsage along, this would take a letter 4 seconds to cross the screen
--sizex is the horizontal scale of each letter (standard letter/sprite is 8 pixels wide)
--sizey is the vertical scale of each letter (standard letter/sprite is 8 pixels tall)
scrolldata={x=241,txt=backdrop,c=4,y=10,spd=60,sizex=2,sizey=4}
```


