We can do scripted movement for all your sprites (not scrolling messages)

## getting the animation function

copy this code and place this after the MAKESCENE function
```lua
function moveall(d)
	if d.movenum ~= nil then
		currentmove=d.movenum
		currenttime=d.delta
		if currentmove <= #d.moves then
			if d.delta >= d.moves[currentmove].t*60 then
				d.movenum=d.movenum + 1
				d.delta = 0
			else
				d.x = d.x + d.moves[currentmove].x
				d.y = d.y + d.moves[currentmove].y
			end
		else
			d.finish=true
			d.movenum = nil
		end
	end
end
```

it should then look like this:
```lua
function MAKESCENES()
	CLEARSCENES()
	myscene()
end

function moveall(d)
	if d.movenum ~= nil then
		currentmove=d.movenum
		currenttime=d.delta
		if currentmove <= #d.moves then
			if d.delta >= d.moves[currentmove].t*60 then
				d.movenum=d.movenum + 1
				d.delta = 0
			else
				d.x = d.x + d.moves[currentmove].x
				d.y = d.y + d.moves[currentmove].y
			end
		else
			d.finish=true
			d.movenum = nil
		end
	end
end
```
## building the animation

You need to add a couple of elements to your sprite code (here's a full example you can paste)

```lua
	timing={showFor=4,showFor=10,user={moveall}}
	spritedata={sprite=256,x=50,y=0,tileswide=2,tileshigh=2,sx=1,sy=1,transpen=0}
	addScaledSprite(timing,spritedata)
	--set first move
	spritedata.movenum=1
	--set x and y movement and for how many seconds
	spritedata.moves={
		{x=1,y=0,t=2},
		{x=0,y=0,t=1},
		{x=-1,y=1,t=1}
	}
```

**explanation**
#### timing
You need to add the moveall function to your timing information

```lua
  --add the user={movall} code to use animation
	timing={showFor=4,showFor=10,user={moveall}}
```
#### activate movement for this sprite
```lua
	--set first move animation as active, same for all sprites
	spritedata.movenum=1
```

#### timing and movement data
Each row sets the speed you want the sprite to move in the x and y directions, the t is how many seconds (you can do 0.5 seconds)
when the animation system gets to the end of the list it will remove the sprite. If you wish the sprite to stay on screen do a row like this `{x=0,y=0,t=1000},`

```lua
	--set x and y movement and for how many seconds
	spritedata.moves={
		{x=1,y=0,t=2},
		{x=0,y=0,t=1},
		{x=-1,y=1,t=1}
	}
```
