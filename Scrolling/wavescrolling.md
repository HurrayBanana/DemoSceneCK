These effects should be added to a function that has defined a scene, such as:

```lua
  function myscene()
    local s = newscene("SPRITE",30,true) 
    -- effect code goes here
  end
```
[See creating a scene for more details](https://github.com/HurrayBanana/DemoSceneCK/blob/main/CreatingAScene.md)

## waving scrolling message

You can make any standard message a waving scroller by adding up to 2 sets of wave data and using **addScroller()** instead of **ScrollHTimeLay()** to create the scroll

Some of this is a little buggy so experiment with the wave values

copy and paste the following code to your scene function (after the newscene line). It is explained below.

```lua
	backdrop="THIS IS A HORIZONTAL TEXT SCROLLER .... "
	timing={showAfter=0,showFor=20}
	scrolldata={x=241,txt=backdrop,c=4,y=10,spd=60,sizex=2,sizey=4}
	wave1={step=-1.5,plot=2,phase=0,scale=0.5,amp=40}
	wave2={step=-0.5,plot=-0.1,phase=0,scale=0.4,amp=5}
	addScroller(timing,scroll,wave1,wave2)
```

**explanation** There are 3 parts to the scrolling data

#### The message
```lua
--this is the text we want to display which we are calling backdrop
--The text must be in UPPER CASE
backdrop="THIS IS A HORIZONTAL TEXT SCROLLER .... "
``` 

#### The timing
You can use clever timing across multiple scrollers to acheive very interesting animation effects
```lua
--showAfter specifies how many seconds to wait before showing the scroller
--showFor specifies how many seconds to show the scroller
timing={showAfter=0,showFor=20}
```
#### The display parameters
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

#### Wave parameters
please bear in mind that this morphed during development and the different named values appear to have similar effects, they probably need renaming and the wave plotting re-writting
```lua
--all angles are specified in degrees - keep them small for best effects
--step is the amount to change the starting angle of the sine wave each time it is drawn, keep this relatively small to stop jarring effects
--plot is the amount to move the angle by between each sprite/character drawn - keep this number small
--phase is the starting angle of the wave - this only really matters if you want a fixed scrolling curve (by setting step to 0)
--scale is a multiplier for the angle between characters (how far to step)
--amp is the displacement (vertically for horizontal scrolling, horzontally for vertical scrolling)
--you can have two seperate wave settings to generate a combined wave form
	wave1={step=-1.5,plot=2,phase=0,scale=0.5,amp=40}
	wave2={step=-0.5,plot=-0.1,phase=0,scale=0.4,amp=5}
```

#### requesting the scrolling effect
The crucial part is to use your data to control a new scrolling message we do this by calling one of the Scrolling functions in this case, where we give it our timing information and our scrolldata


```lua
  -- use two waves
	addScroller(timing,scroll,wave1,wave2)
```

```lua
  -- use just one wave
	addScroller(timing,scroll,wave1)
```

```lua
  -- use no waves
	addScroller(timing,scroll)
```

