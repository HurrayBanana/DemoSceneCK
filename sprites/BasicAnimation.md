## A user defined animation function

Copy the animate(d) function and place it in your code (after the MAKESCENES function). This animation function takes in our sprite data and uses it to animate between 2 different sprites.

```lua
function animate(d)
	if d.delta % d.anitime == 0 then
		if d.sprite == d.frame1 then
			d.sprite =d.frame2
		else
			d.sprite = d.frame1
		end
	end
end
```

Your code should now look like this:

```lua
function MAKESCENES()
	CLEARSCENES()
	myscene()----
	--sceneOne()
	--sceneTwo()
end

function animate(d)
	if d.delta % d.anitime == 0 then
		if d.sprite == d.frame1 then
			d.sprite =d.frame2
		else
			d.sprite = d.frame1
		end
	end
end
```
## simple animation
Copy this code into your scene function

```lua
	timing={user={animate}}
	data={anitime=30,frame1=481,frame2=482,sprite=481,x=50,y=50,tileswide=1,tileshigh=1,sx=1,sy=1,transpen=0}
	addScaledSprite(timing,data)
```

**explanation** There are 3 parts to the sprite data

#### The timing

```lua
  --we add in the timing information a request to run our function called animate
	timing={user={animate}}
```
  
#### The data parameters
```lua
--anitime is our own custom data for saying how many frames to wait before changing the sprite to display (30 frames = 0.5 seconds)
--frame1 is our own custom data saying what sprite to show first
--frame2 is our own custom data saying what sprite to show second
--sprite is a copy of the frame1 value
--x is the left most position on screen for the sprite
--y is the top most position on screen for the sprite
--tileswide is the number of 8x8 sprites horizontally (right of the sprite number given) that make up a larger sprite (must be at least 1)
--tileshigh is the number of 8x8 sprites vertically (down of the sprite number given) that make up a larger sprite (must be at least 1)
--sx is the horizontal scale of each letter (standard letter/sprite is 8 pixels wide)
--sy is the vertical scale of each letter (standard letter/sprite is 8 pixels tall)
--transpen is the colour to ignore when drawing the sprite, the transparent colour
data={anitime=30,frame1=481,frame2=482,sprite=481,x=50,y=50,tileswide=1,tileshigh=1,sx=1,sy=1,transpen=0}
```

#### Requesting the Sprite display
The crucial part is to use your data to control the display of the sprite. We give it the timing data and the spritedata

```lua
	addScaledSprite(timing,spritedata)
```

