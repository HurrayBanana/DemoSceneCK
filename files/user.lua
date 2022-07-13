-- title:  DemoScene Contruction Kit
-- author: Hurray Banana
-- desc:   A little program to allow Yr7 students to build a demo scene project
-- script: lua

function MAKESCENES()
	CLEARSCENES()
	myscene()----
	--sceneOne()
	--sceneTwo()
end


function myscene()
	local s = newscene("SPRITE",300,true) 
	
	timing={showFor=4,showFor=10}
	spritedata={sprite=2,x=50,y=0,tileswide=7,tileshigh=8,sx=1,sy=1,transpen=0}
	addScaledSprite(timing,spritedata)

end

function sceneOne()
	local s = newscene("SPRITE",30,true) 
	
	timing={}
	data={sprite=2,x=0,y=0,tileswide=7,tileshigh=8,sx=1,sy=1,delta=0,transpen=0,speedx=60,speedy=30}
	addScaledSprite(timing,data)

	--large simple scroll message
	backdrop="THIS IS A VERTICAL TEXT SCROLLER ....... "
	timing={showAfter=0}
	scroll={y=137,txt=backdrop,c=4,x=80,spd=120,sizex=2,sizey=2,wrap=true,trans=0}
	wave1={step=-1.5,plot=2,phase=0,scale=0.5,amp=35}
	wave2={step=-0.5,plot=-0.1,phase=0,scale=0.4,amp=5}
	addScrollerV(timing,scroll,wave1,nil)

	--large simple scroll message
	backdrop="THIS IS A HORIZONTAL TEXT SCROLLER .... "
	timing={showAfter=0}
	scroll={x=241,txt=backdrop,c=7,y=50,spd=90,sizex=3,sizey=3,wrap=true}
	wave1={step=-1.5,plot=2,phase=0,scale=0.5,amp=40}
	wave2={step=-0.5,plot=-0.1,phase=0,scale=0.4,amp=5}
	addScroller(timing,scroll,wave1,nil)

	timing={showAfter=25}
	wipedata={direc=RTOL,wipeTime=5,wipeCol=0,transCol=12}
	addwipeLR(timing,wipedata)
end

function sceneTwo()
	local s = newscene("LATEST",120,true) 
	--setting up data for all the scrollers
	--cxx sets a colour change 01 to 15
	--pxx pauses scrolling for xx seconds
	local welcome = " c12          WELCOME TO THE c02DEMOc03SCENE c04CONSTRUCTION c05KITc12 p10 (c02Dc03Sc04Cc05Kc12)         c06WRITTEN BY c07HURRAY c08BANANA p10c09.c10.c11.c12.c13.c14.c15.c01.c02.c03.c04.c05.c06."
	local backdrop = "HURRAY BANANA "
	local ta = "THIS WAS CREATED BY HURRAY BANANA ...... "
	
	local greetings = ""..
		"c12 p03  GREETINGS TO "..
		--0123456789abcde
	--	"c06 p20ABCDEFGHIJKLMNO "
		"c06 p02 XXXXX         "..
		"c02 p02 YYYYY          "..
		"c03 p02 ZZZZZ       "..
		"c04 p02 AAAAA       "..
		"c05 p02 BBBBBBB         "..
		"c06 p01 EEEEEEE   "..
		"c02 p02 FFFFFFFF       "..
		"c03 p02 KKKKKKK        "..
		"c04 p02 QQQQQQQ        "


	ghostlist={256,258,260,262}
	conlist=EMPTYCONLIST(ghostlist)

	timing={user={rotateme}}
	data={sprite=256,x=120,y=68,tw=2,th=2,sx=4,sy=4,angle=0,angV=degtorad(20)}
	addUserEffect(timing,data)
	--starfield effect
	timing={showFor=150,showAfter=10}
	stardata={number=45,speed=10,col=12,tcol=nil,type="r"}
	StarField(timing,stardata)

	--large simple scroll message
	timing={showAfter=0}
	scroll={x=241,txt=backdrop,c=4,y=-13,spd=15,sizex=4,sizey=14,wrap=true}
	ScrollHTimeLay(timing,scroll)

	--generate loads of ghost scrollers
	for p=0,10 do
		timing={showFor=20,showAfter=4+p*2}
		scroll={tt=ghostlist,con=conlist,cen=true,y=p*16-16,spd=-5-p*5,sizex=1,sizey=1,tw=2,th=2,wrap=true}
		wave1={scale=0.5,step=6,amp=10}
		--ScrollHTimeWave(timing,scroll,wave1)
	end
	--generate loads of same scroller message
	local ly = 0
	local cols={13,14,15,8,9,10}
	for p=0,5 do
		ly = ly + 8 * (0.8 + p * 0.25)
		timing={showFor=20,showAfter=60,bank=0}
		scroll={x=241,flip=false,cen=true,txt=ta,c=cols[p+1],y=ly,spd=-15-p*15,sizex=1 + p *0.25,wrap=true}
		ScrollHTimeLay(timing,scroll)
	end

	--main large welcome message
	timing={showFor=45,showAfter=5,bank=0}
	scroll={cen=true,txt=welcome,spd=120,sizex=4,sizey=6,x=0,y=68,c=BLU,wrap=true,gs=1}
	wave1={step=-1.5,plot=2,phase=0,scale=0.5,amp=30}
	wave2={step=-0.5,plot=-0.1,phase=0,scale=0.4,amp=5}
	addScroller(timing,scroll,wave1,wave2)

	--greetings message in bank 1 (drawn after everything else)
	timing={showAfter=50,bank=1}
	scroll={txt=greetings,spd=-360,sizex=2,sizey=2,x=240,y=48,c=BLU,wrap=true,gs=1.0}
	wave1={step=-2.5,plot=2,phase=0,scale=0.5,amp=60}
	wave2={step=-3,plot=-0.4,phase=0,scale=0.4,amp=5}
	addScroller(timing,scroll,wave1,wave2)

	--add a mirror effect of final height 30 pixels, showing colours at 30% intensity
	timing={showAfter=15}
	mirrordata={height=36, tint={0.35,0.35,0.45}, easein=0.3, easeout=0.2,amplitude=0.25,fade=4}
	addMirror(timing,mirrordata)
end

--[[=================================================================
===============                                       =============== 
===============                                       =============== 
=============== DO NOT EDIT ANY CODE BEYOND THIS LINE ===============
===============                                       =============== 
===============                                       =============== 
=================================================================--]]

poplo=0.05
scale=true
function wobblegroupline(d)
	local xoff={}
	for p=0,(d.th*8*d.sy)//1-1 do
		xoff[p+1]=4*math.sin(0.2*(d.delta/9+p))
	end
	spriteasrow(d.sprite,d.x,d.y,d.tw,d.th,d.sx,d.sy,xoff,d.trans)
end

function bounce(d)
	px = d.x
	py = d.y
	d.sx = 1.25 + math.sin(d.delta/37)
	d.sy = 1.25 + math.sin((90+d.delta)/37)
	width = 8 * d.tileswide * d.sx
	height = 8 * d.tileshigh * d.sy
	right = d.x+width
	bottom= d.y+height
	line(d.x+width,0,d.x+width,135,12)
	line(0,d.y+height,239,d.y+height,11)
	line(d.x,0,d.x,135,4)
	line(0,d.y,239,d.y,5)
	print((d.y//1)..":"..(bottom//1)..":"..height,0,0,12)
	d.x = d.x + FRAME_DELTA * d.speedx
	if d.x <= 0 then 
		d.speedx = d.speedx * -1
		d.x=px
		d.x = d.x + FRAME_DELTA * d.speedx
	elseif right >= 239 then
		d.speedx = d.speedx * -1
		d.x=px
		d.x = d.x - right + 240
	end
	d.y = d.y + FRAME_DELTA * d.speedy
	if d.y <= 0 then 
		d.y=py
		d.speedy = d.speedy * -1
		d.y = d.y + FRAME_DELTA * d.speedy
	elseif bottom >= 135 then
		trace("Before:"..(d.y//1)..":"..(bottom//1)..":"..height,0,0,12)
		d.speedy = d.speedy * -1
		d.y=py
		d.y = d.y - bottom + 137
		trace("After:"..(d.y//1)..":"..(bottom//1)..":"..height,0,0,12)
		--exit()
	end
end
function spriteasrow(s,x,y,w,h,sx,sy,xoffs,tr)
	--cls(12)
	--trace(s)
	local fp=1/sy
	local row=0
	for p=0,(h*8*sy)//1-1 do
		drawSprHorizStrip(s,x+xoffs[p+1],y+p,w,sx,1,row//1)
		--drawSprHorizStrip(s,80+xd,10+p*4,1,4,4,p)
		--quadrow(s,50+x+xoffs[p+1],y+p,w,h,sx,1,tr,row//1,15)
		row=row+fp

	end	
end

function quadrow(sp,x,y,w,h,sx,sy,tr,row,xoff)
	rows = 8*h-row
	cols = 8*w
	x1=x y1=y
	x2=x y2=y+sy
	--x2=x y2=y+(rows*sy)
	x3=x+(cols*sx) y3=y+sy
	--x3=x+(cols*sx) y3=y+(rows*sy)
	x4=x+(cols*sx) y4=y

	us=8*(sp % 16)
	vs=8* (sp // 16) + row
	u1=us v1=vs
	--u2=us v2=vs+rows
	u2=us v2=vs
	u3=us+cols v3=vs
	--u3=us+cols v3=vs+rows
	u4=us+cols v4=vs
	--[[trace("==== row:"..row)
	trace("u1:"..u1.." v1:"..v1)
	trace("u2:"..u2.." v2:"..v2)
	trace("u3:"..u3.." v3:"..v3)
	trace("u4:"..u4.." v4:"..v4)
	--]]
	--fixed uv for now
	ttri(x1,y1,x2,y2,x3,y3,u1,v1,u2,v2,u3,v3,false,tr)
	ttri(x1,y1,x4,y4,x3,y3,u1,v1,u3,v3,u4,v4,false,tr)
end
function rotateme(d)
	--print(d.angle,d.x,d.y+10,12)
	quadR(d.sprite,d.x,d.y,d.tw,d.th,d.sx,d.sy,d.trans,d.angle)
	d.angle = d.angle + d.angV * FRAME_DELTA
	d.sx = d.sx * 1.01
	d.sy = d.sy * 1.01
	if d.sx > 4 then d.sx =4 end
	if d.sy > 4 then d.sy =4 end
end
function rotpoint(xp,yp,ox,oy,angle)
	--translate to origin
	--pix(ox,oy,4)
	nx=xp-ox
	ny=yp-oy
	rc=math.cos(angle)
	rs=math.sin(angle)
	return ox+(nx*rc-ny*rs),oy+(nx*rs+ny*rc)
end
--xp,yp is considered centre
function quadR(sp,xp,yp,w,h,sx,sy,tr,angle)
	--sp = sp - 256
	rows = 8*h--ready for messing with individual lines
	cols = 8*w
	hh=0.5*rows*sy
	hw=0.5*cols*sx
	cx=xp
	cy=yp
	x={}
	y={}
	x[1]=cx-hw y[1]=cy-hh
	x[2]=cx-hw y[2]=cy+hh
	x[3]=cx+hw y[3]=cy+hh
	x[4]=cx+hw y[4]=cy-hh
	if angle~=0 then
		for p=1,4 do
			x[p],y[p]=rotpoint(x[p],y[p],cx,cy,angle)
		end
	end
	ubase = sp-- - 256
	us=8*(sp % 16)
	vs=8*(sp // 16)
	u1=us v1=vs
	u2=us v2=vs+rows
	u3=us+cols v3=vs+rows
	u4=us+cols v4=vs
	--fixed uv for now
	ttri(x[1],y[1],x[2],y[2],x[3],y[3],u1,v1,u2,v2,u3,v3,false,tr)
	ttri(x[1],y[1],x[3],y[3],x[4],y[4],u1,v1,u3,v3,u4,v4,false,tr)
end


--[[ adds a scene for custom effects drawing,tilemaps and music etc...
place your callbacks in time.user (you can have multiple callbacks)
store variables for effects in the data table so they are accessible and re-entrant 
by your usercode routine
]]
function addUserEffect(time,data)
	local effect={sub=nil,dat=data}
	ScnEffect(effect, time)
end

--]]
-- GLOBALS
--colours
BLK=0	--1A1C2C
PUR=1	--5D275D
RED=2	--B13E53
ORA=3	--EF7D57
YEL=4	--FFCD75
LGN=5	--A7F070
GRN=6	--38B764
DGN=7	--257179
DBL=8	--29366F
BLU=9	--3B5DC9
LBL=10	--41A6F6
CYN=11	--73EFF7
WHT=12	--F4F4F4
LGR=13	--94B0C2
GRY=14	--566C86
DGR=15  --333C57

FRAMES=0
-- holds the list of effects to perform during tic's
-- each effect is made of a method to call and a parameter block object that
-- contains all the data for the routine to operate (this is created by the startmethod of that routine)
--
STATS=false
SHOWTIME = false

DEMOSCENES={}
SCENENUM=0
--holds the managed sprites in the scene
--sprite={remove[r],index[i],width[w],height[h],x[x],y[y],vx[vx],vy[vy],killafter[k],delta[d]}
SPRITES={}
function checkcontrol(ch,d,p,cons)
	--colour change
	if ch == "c" then
		--local pal = d.l.con[conP].d
		local pal = cons[p].d
		
		if pal=="99" then 
			pal = math.random(1,15)
			cons[p].d=pal
		end
		palswap(12, pal)
		if p == 1 then d.firstcolour = pal end
	elseif ch=="x" then
		--local newpal = d.l.con[conP].d or "nil"
		--local oldpal = d.l.con[conP].d2 or "nil"
		local newpal = cons[p].d or "nil"
		local oldpal = cons[p].d2 or "nil"
		palswap(newpal, oldpal)
		--if p == 1 then d.firstcolour = pal end
	--pause but not if already set and only if first encounter
	--elseif ch=="y" then --and p==1 then
		
		--local newpal = d.l.con[conP].d or "nil"
		--local oldpal = d.l.con[conP].d2 or "nil"
		--d.l.y = d.l.y + d.l.con[p].d
	elseif ch=="p" and p == 1 and d.pa == 0 and d.lstCon ~= d.cs then
			--trace("PAUSED"..d.con[conP].d)
			--d.pa = d.l.con[conP].d*60 --deltas-- d.con[conP].d * 60
			d.pa = cons[p].d*60 --deltas-- d.con[conP].d * 60
			d.lstCon = d.cs
	end
end	
function drawCharHZnew(d)
	local gap = d.ch * d.l.sizex * d.l.gs * d.l.tw
	local chars = (240 / gap)//1 + 2
    if d.pa <= 0 then
        d.poff = d.poff + math.abs(d.dx)
        if d.poff >= (gap + d.l.x)  then
--		if d.poff > gap  then
			if d.l.slide and d.l.x > 0 then
				d.l.x = d.l.x - 1
			else
				d.l.slide=false
				d.l.x=0
			end
            d.poff = d.poff - gap - math.abs(d.dx)
            d.cs = d.cs + 1

            if d.cs > #d.l.tt then
				if d.l.wrap then
                	d.cs = 1
					d.lstCon = - 1
				else
					d.cs = 1
					d.lstCon = - 1
					--d.finish = true
					--trace("request my end")
					return
				end
            end
        end
    end 
	--print("pause:"..d.pa.." d.poff:"..d.poff.." d.cs"..d.cs,0,10,12)
	--sprite list version
	local tts = tablesub(d.l.tt, d.cs,d.cs + chars)
	local cons = tablesub(d.l.con,d.cs,d.cs + chars)
	--trace("before want "..chars.." cons#"..#cons.." tts#"..#tts)

	--local conP = d.cs
	--local loop = 0
	if d.l.wrap then
		while #tts < chars do
			--loop = loop + 1
			tableappend(tts, tablesub(d.l.tt,1,chars-#tts))
			tableappend(cons, tablesub(d.l.con,1,chars-#cons))
			--trace("during want "..chars.." did "..loop.." loops got cons#"..#cons.." tts#"..#tts)
		end
	else
		chars = #tts
	end
	--if chars == 0 then d.active = false return end
	--trace("after wanted "..chars.." did "..loop.." loops got cons#"..#cons.." tts#"..#tts)
	--[[if #tts < chars and d.l.wrap then
		tableappend(tts, tablesub(d.l.tt,1,chars-#tts))
	end
	--]]
	--mod 1 to fix rounding error
	local xp = (d.l.x -d.poff - gap)//1
	local yp = 0 --d.pos.y + 50 * math.sin(d.delta/100)
	--trace(xp)
	local ph1 = d.w1.phase
	local ph2 = d.w2.phase
	local skip = 0
	--normal colour swap
	palswap(12,d.l.c)
	--pre process last colour set if no longer part of string
	if d.firstcolour ~= nil then
		palswap(12, d.firstcolour)
	end
	local pal = -1
	local cp=1 -- manage char position myself
	local sy = d.l.sizey
	local sx = d.l.sizex
	for p=1,chars do
		--trace(p)
        --local ch = d.l.con[conP].e or nil
        local ch = cons[p].e or nil
        if ch ~= nil then
			checkcontrol(ch,d,p,cons)
			
        end
		
        --conP = conP + 1
        --wrap if necessary
        --if conP > #d.l.con then conP = 1 end
		xp = xp + gap
		if xp > 240 then break end --stop drawing if gone off screen
		yp = d.l.y + d.w1.amp * math.sin(ph1 + PIXPI*xp*d.w1.scale)
		yp = yp + d.w2.amp * math.sin(ph2 + PIXPI*xp*d.w2.scale)

		--bodgy for y flipping - this works
		if d.l.flip then
			sy = math.sin(ph1)*d.l.sizey
			--pal trick not very convincing - needs pixel level waving
			if sy < 0 then
				palswap(12,13)
			end
		end
		--handle centre y position
		if (d.l.cen) then
			yp = yp - 0.5*8*sy*d.l.th
		end
        ph1 = ph1 + d.w1.plot
        ph2 = ph2 + d.w2.plot

		if skip > 0 then
			skip = skip -1
		else
			if tts[p] >=0 then
				if d.l.pixel then
					local xoff={}
					for p=0,(d.l.th*8*sy)//1-1 do
						xoff[p+1]=5*math.sin(0.2*(d.delta/5+p))
					end
					spriteasrow(tts[p],xp,yp,d.l.tw,d.l.th,sx,sy,xoff,d.l.trans)
				else
					quad(tts[p],xp,yp,d.l.tw,d.l.th,sx,sy,d.l.trans)
				end
			end
		end
	end
	d.w1.phase = d.w1.phase + d.w1.step
	d.w2.phase = d.w2.phase + d.w2.step

	if d.pa ~= 0 then
		d.pa = d.pa - 1
	end
	palswap(12,12)
end

function drawCharVTnew(d)
	local gap = d.ch * d.l.sizey * d.l.gs * d.l.th
	local chars = (136 / gap)//1 + 2
    if d.pa <= 0 then
        d.poff = d.poff + math.abs(d.dy)
        if d.poff >= (gap + d.l.y)  then
--		if d.poff > gap  then
			if d.l.slide and d.l.y > 0 then
				d.l.y = d.l.y - 1
			end
            d.poff = d.poff - gap - math.abs(d.dy)
            d.cs = d.cs + 1

            if d.cs > #d.l.tt then
				if d.l.wrap then
                	d.cs = 1
					d.lstCon = - 1
				else
					d.cs = 1
					d.lstCon = - 1
					--d.finish = true
					--trace("request my end")
					return
				end
            end
        end
    end 
	--print("pause:"..d.pa.." d.poff:"..d.poff.." d.cs"..d.cs,0,10,12)
	--sprite list version
	local tts = tablesub(d.l.tt, d.cs,d.cs + chars)
	local cons = tablesub(d.l.con,d.cs,d.cs + chars)
	--trace("before want "..chars.." cons#"..#cons.." tts#"..#tts)

	--local conP = d.cs
	--local loop = 0
	if d.l.wrap then
		while #tts < chars do
			--loop = loop + 1
			tableappend(tts, tablesub(d.l.tt,1,chars-#tts))
			tableappend(cons, tablesub(d.l.con,1,chars-#cons))
			--trace("during want "..chars.." did "..loop.." loops got cons#"..#cons.." tts#"..#tts)
		end
	else
		chars = #tts
	end
	--if chars == 0 then d.active = false return end
	--trace("after wanted "..chars.." did "..loop.." loops got cons#"..#cons.." tts#"..#tts)
	--[[if #tts < chars and d.l.wrap then
		tableappend(tts, tablesub(d.l.tt,1,chars-#tts))
	end
	--]]
	--mod 1 to fix rounding error
	local xp = 0
	local yp = (d.l.y -d.poff - gap)//1
	--trace(xp)
	local ph1 = d.w1.phase
	local ph2 = d.w2.phase
	local skip = 0
	--normal colour swap
	palswap(12,d.l.c)
	--pre process last colour set if no longer part of string
	if d.firstcolour ~= nil then
		palswap(12, d.firstcolour)
	end
	local pal = -1
	local cp=1 -- manage char position myself
	local sy = d.l.sizey
	local sx = d.l.sizex
	for p=1,chars do
		--trace(p)
        --local ch = d.l.con[conP].e or nil
        local ch = cons[p].e or nil
        if ch ~= nil then
			checkcontrol(ch,d,p,cons)
			--[[
            --colour change
            if ch == "c" then
                --local pal = d.l.con[conP].d
                local pal = cons[p].d
                palswap(12, pal)
                if p == 1 then d.firstcolour = pal end
			elseif ch=="x" then
				--local newpal = d.l.con[conP].d or "nil"
				--local oldpal = d.l.con[conP].d2 or "nil"
				local newpal = cons[p].d or "nil"
				local oldpal = cons[p].d2 or "nil"
                palswap(newpal, oldpal)
                --if p == 1 then d.firstcolour = pal end
            --pause but not if already set and only if first encounter
			--elseif ch=="y" then --and p==1 then
				
				--local newpal = d.l.con[conP].d or "nil"
				--local oldpal = d.l.con[conP].d2 or "nil"
				--d.l.y = d.l.y + d.l.con[p].d
			elseif ch=="p" and p == 1 and d.pa == 0 and d.lstCon ~= d.cs then
					--trace("PAUSED"..d.con[conP].d)
					--d.pa = d.l.con[conP].d*60 --deltas-- d.con[conP].d * 60
					d.pa = cons[p].d*60 --deltas-- d.con[conP].d * 60
					d.lstCon = d.cs
            end
			--]]
        end
		
        --conP = conP + 1
        --wrap if necessary
        --if conP > #d.l.con then conP = 1 end
		yp = yp + gap
		if yp > 136 then break end --stop drawing if gone off screen
		xp = d.l.x + d.w1.amp * math.sin(ph1 + PIXPI*yp*d.w1.scale)
		xp = xp + d.w2.amp * math.sin(ph2 + PIXPI*yp*d.w2.scale)

		--bodgy for y flipping - this works
		if d.l.flip then
			sx = math.sin(ph1)*d.l.sizex
			--pal trick not very convincing - needs pixel level waving
			if sx < 0 then
				palswap(12,13)
			end
		end
		--handle centre y position
		if (d.l.cen) then
			xp = xp - 0.5*8*sx*d.l.tw
		end
        ph1 = ph1 + d.w1.plot
        ph2 = ph2 + d.w2.plot

		if skip > 0 then
			skip = skip -1
		else
			if tts[p] >=0 then
				if d.l.pixel then
					local yoff={}
					for p=0,(d.l.th*8*sy)//1-1 do
						yoff[p+1]=5*math.sin(0.2*(d.delta/5+p))
					end
					--not written yet
					--spriteascol(tts[p],xp,yp,d.l.tw,d.l.th,sx,sy,yoff,d.l.trans)
				else
					quad(tts[p],xp,yp,d.l.tw,d.l.th,sx,sy,d.l.trans)
				end
			end
		end
	end
	d.w1.phase = d.w1.phase + d.w1.step
	d.w2.phase = d.w2.phase + d.w2.step

	if d.pa ~= 0 then
		d.pa = d.pa - 1
	end
	palswap(12,12)
end

--[[
x1, y1 : the screen coordinates of the first corner
x2, y2 : the screen coordinates of the second corner
x3, y3 : the screen coordinates of the third corner
u1, v1 : the UV coordinates of the first corner
u2, v2 : the UV coordinates of the second corner
u3, v3 : the UV coordinates of the third corner
use_map : if false (default), the triangle's texture is read from SPRITES RAM. If true, the texture comes from the MAP RAM.
trans : index (or array of indexes 0.80) of the color(s) that will be used as transparent
z1, z2, z3 : depth parameters for texture correction

1---------4
:  \	  :
:	 \	  :
:	   \  :
2---------3
]]
function quad(sp,x,y,w,h,sx,sy,tr)
	--sp = sp - 256
	--trace("tri")
	rows = 8*h
	cols = 8*w
	x1=x y1=y
	x2=x y2=y+(rows*sy)
	x3=x+(cols*sx) y3=y+(rows*sy)
	x4=x+(cols*sx) y4=y
	ubase = sp-- - 256
	us=8*(sp % 16)
	vs=8* (sp // 16)
	u1=us v1=vs
	u2=us v2=vs+rows
	u3=us+cols v3=vs+rows
	u4=us+cols v4=vs
	--fixed uv for now
	ttri(x1,y1,x2,y2,x3,y3,u1,v1,u2,v2,u3,v3,false,tr)
	ttri(x1,y1,x3,y3,x4,y4,u1,v1,u3,v3,u4,v4,false,tr)
end


function drawRect(d)
	if d.delta % d.mod == 0 then
		rect(0,0,240,136,d.c)
	end
end
function FillRect(c,mod,bank)
	local effect={sub=drawRect,dat={mod=mod,c=c}}
	timing={bank=bank}
	ScnEffect(effect, timing)
end
PIXPI=math.pi/120
function addScroller(time,layout,wave1,wave2,callback)
	time=time or {}
	
	local data={l=layout}
	--check to see if spritelist given
	if layout.tt == nil then
		layout.txt =transText(layout.txt or "NO MESSAGE SET")
		layout.txt, layout.con,layout.tt = effectControl(layout.txt)
	end
	layout.c=layout.c or 12
	layout.x=layout.x or 0
	layout.tw = layout.tw or 1
	layout.th = layout.th or 1
	if layout.wrap == nil then layout.wrap = true end
	layout.sizex=layout.sizex or 1
	layout.sizey=layout.sizey or layout.sizex
	layout.gs=layout.gs or 1
	layout.cen=layout.cen or false
	layout.flip=layout.flip or false
	layout.slide=layout.slide or true
	layout.pixel=layout.pixel or false
	layout.trans=layout.trans or 0

	if wave1==nil then
		wave1={step=0,plot=0,phase=0,scale=0,amp=0}
	end
	if wave2==nil then
		wave2={step=0,plot=0,phase=0,scale=0,amp=0}
	end
	wave1.step=degtorad(wave1.step or 0)
	wave1.plot=degtorad(wave1.plot or 0)
	wave1.phase=degtorad(wave1.phase or 0)
	wave2.step=degtorad(wave2.step or 0)
	wave2.plot=degtorad(wave2.plot or 0)
	wave2.phase=degtorad(wave2.phase or 0)
	wave1.scale=wave1.scale or 1 wave1.amp=wave1.amp or 0
	wave2.scale=wave2.scale or 1 wave2.amp=wave2.amp or 0
	data.w1=wave1
	data.w2=wave2
	data.ch=8 data.dx=layout.spd*FRAME_DELTA data.cs=1
	data.pa=0 data.poff=0 data.lstCon=-1
	local effect={sub=drawCharHZnew,dat=data}
	ScnEffect(effect, time)
end
function addScrollerV(time,layout,wave1,wave2,callback)
	time=time or {}
	
	local data={l=layout}
	--check to see if spritelist given
	if layout.tt == nil then
		layout.txt =transText(layout.txt or "NO MESSAGE SET")
		layout.txt, layout.con,layout.tt = effectControl(layout.txt)
	end
	--trace(layout.txt.." "..#layout.txt.." "..#layout.con.." "..#layout.tt)
	layout.c=layout.c or 12
	layout.x=layout.x or 0
	layout.tw = layout.tw or 1
	layout.th = layout.th or 1
	if layout.wrap == nil then layout.wrap = true end
	layout.sizex=layout.sizex or 1
	layout.sizey=layout.sizey or layout.sizex
	layout.gs=layout.gs or 1
	layout.cen=layout.cen or false
	layout.flip=layout.flip or false
	layout.slide=layout.slide or true
	layout.pixel=layout.pixel or false
	layout.trans=layout.trans or 0

	if wave1==nil then
		wave1={step=0,plot=0,phase=0,scale=0,amp=0}
	end
	if wave2==nil then
		wave2={step=0,plot=0,phase=0,scale=0,amp=0}
	end
	wave1.step=degtorad(wave1.step or 0)
	wave1.plot=degtorad(wave1.plot or 0)
	wave1.phase=degtorad(wave1.phase or 0)
	wave2.step=degtorad(wave2.step or 0)
	wave2.plot=degtorad(wave2.plot or 0)
	wave2.phase=degtorad(wave2.phase or 0)
	wave1.scale=wave1.scale or 1 wave1.amp=wave1.amp or 0
	wave2.scale=wave2.scale or 1 wave2.amp=wave2.amp or 0
	data.w1=wave1
	data.w2=wave2
	data.ch=8 data.dy=layout.spd*FRAME_DELTA data.cs=1
	data.pa=0 data.poff=0 data.lstCon=-1
	local effect={sub=drawCharVTnew,dat=data}
	ScnEffect(effect, time)
end
--{txt="DAVE",y=45,spd=-30,sizex=1}
function ScrollH(layout)
	--local d = {txt=layout.text,spd=speed,sizex=scale,sizey=scale,x=0,y=height,c=WHT,wrap=true,gs=1}
	addScroller(t,layout,nil,nil)
end
function ScrollHTime(time,text, height, speed, scale)
	local d = {txt=text,spd=speed,sizex=scale,sizey=scale,x=0,y=height,c=BLU,wrap=true,gs=1}
	addScroller(time,d,nil,nil)
end
function ScrollHTimeLay(time,layout)
	addScroller(time,layout,nil,nil)
end

function ScrollHTimeWave(time,layout,wave)
	addScroller(time,layout,wave,nil)
end
function EMPTYCONLIST(from)
	local con={}
	for p=1,#from do
		table.insert(con,{})
	end
	return con
end
--callback
function move(d)
	--d.l.y = d.l.y + 3*FT
end
function moveagain(d)
	d.l.sizex = d.l.sizex + 0.001
	d.l.sizey= d.l.sizex
end
--between a and b p range 0[a], 1[b]
function lerp(a,b,p)
	return a + (b-a)*p
end
--[[lerp between 2 given colour tables {r,g,b}]]
function lerpC(a,b,p)
	local c={0,0,0}
	c[1]=lerp(a[1],b[1],p)
	c[2]=lerp(a[2],b[2],p)
	c[3]=lerp(a[3],b[3],p)
	return c
end

tintlist={{0.3,0.3,0.3},
		{0.8,0.3,0.3},{0.3,0.8,0.3},{0.3,0.3,0.8},
		{0.8,0.8,0.3},{0.3,0.8,0.8},{0.8,0.3,0.8}}
function switchtint(d)
	if d.ctint == nil then d.ctint = 1 end
	local mod =d.delta % d.fadef
	if mod == 0 then
		d.ctint = d.ctint + 1
		if d.ctint > #tintlist then d.ctint = 1 end
		d.t = tintlist[d.ctint]
	end
	local p = (d.ctint % #tintlist) + 1
	local q = mod/d.fadef
	--trace(d.ctint..":"..p.." "..q.."%")

	d.t=lerpC(tintlist[d.ctint],tintlist[p],q)
	--local out ="LT["..tintlist[d.ctint][1]..":"..tintlist[d.ctint][2]..":"..tintlist[d.ctint][3].."] RT["..
	--tintlist[p][1]..":"..tintlist[p][2]..":"..tintlist[p][3].."] LERP["..
	--d.t[1]..":"..d.t[2]..":"..d.t[3].."]"
	--trace(out)
end
function degtorad(deg)
	return deg * math.pi / 180
end

--STARFIELD={star={x=0,y=0,xv=0,yv=0}}
function radStar(d)
	local off = 0
	local modo = 240
	local rad = 0
	local spread = 2*math.pi / d.n * 0.1
	local x,y = 0,0
	local dist = 0.1*d.delta % modo--the start offset
	local drad = math.pi * 2 / d.n
	for k=0,30 do
		off = 0
		for p=1,d.n do
		local spread = (d.delta + dist) % modo
			local sx = math.sin(rad) 
			local sy = math.cos(rad) 
			x = 120 + spread * sx + (10+(off%10-5))*sx
			y = 68 + spread * sy + (10+(off%10-5)) *sy
			pix(x,y,d.c)
			rad = rad + drad
			off = off + 1
		end
		dist = dist + 2 + 3 * k
	end
	rad = 0.05
	modo =360
	local dist = 5+ 0.1*d.delta % modo--the start offset
	local drad = math.pi * 2 / d.n * 2
	for k=0,30 do
		for p=1,d.n/2 do
		local spread = (d.delta + dist) % modo
			local sx = math.sin(rad) 
			local sy = math.cos(rad) 
			x = 120 + spread * sx + 10*sx
			y = 68 + spread * sy + 10 *sy
			pix(x,y,13)
			rad = rad + drad
		end
		dist = dist + 2 + 2 * k
	end
end
function horStar(d)
end
--[[type={ty="r",cx=0,cy=0}]]
function StarField(time,set)--after,number,speed,col,tcol,type)
	--StarField({showFor=s.len,showAfter=0},{number=36,speed=10,col=12,tcol=nil,type="r"})
	local data={n=set.number,delta=0,s=set.speed,c=set.col,tc=set.tcol}
	local effect={sub=radStar,dat=data}
	if set.type =="h" then effect.sub = horStar end
	ScnEffect(effect,time)
end

--adds a managed sprite
function spriteAdd(spr)
	SPRITES:insert(spr)
end
--performs sprite updates
function spriteUpd(delta)
	for p=1,#SPRITES do
		local s = SPRITES[p]
		s.d = s.d + delta
		if s.k > s.d then s.r = true end

	end
end
--removes any dead sprites
function spriteRem()
end
--substitutes any magic characters from my
--characterset to alts
function transText(t)
	t=string.gsub(t,"%.","_")
	t=string.gsub(t,"%(","{")
	t=string.gsub(t,"%)","}")
	t=string.gsub(t,"%?","@")
	t=string.gsub(t,"%-","#")
	return t
end
EFFECTS = "cpxy"
--builds effect control table
--pxx pause 0-99 seconds
--cxx change pal 12 to xx
--xppqq change pal pp to qq
function effectControl(t)
	--trace("effectcontrol")
	local con = {}
	local spr = {}
	local newT = ""
	local skip = 0
    local p = 1
	while p <= #t do
		local ch = string.sub(t,p,p)
		if EFFECTS:find(ch) ~= nil then
            --pick up effect data
            local c={e=ch}
			if ch=="c" or ch=="p"then --pxx or cxx
				c.d=string.sub(t,p+1,p+2)
				table.insert(con,c)
				p = p + 3
			elseif ch=="x" then --xppqq
				c.d=string.sub(t,p+1,p+2)
				c.d2=string.sub(t,p+3,p+4)
				table.insert(con,c)
				p = p + 5
			elseif ch=="y" then --y<xx or y>xx
				trace("y<xx found")
				local sign = ""
				if string.sub(t,p+1,p+1) == "<" then sign = "-" end
				c.d=sign..string.sub(t,p+2,p+3)
				trace(c.d)
				table.insert(con,c)
				p = p + 4
			end
			skip=1
		else
			if skip == 0 then
                local c={}
				table.insert(con,c)
			else
				skip = 0
			end 
			table.insert(spr,getCharTile(ch))
			newT = newT..ch
            p = p + 1
		end
	end
	return newT, con, spr
end
--lua magic characters are replaced (see above)
-- magic (   )   .   %   +   –   *   ?   [   ^   $
--this needs changing so all text is transformed into sprites rather than keep looking up
CHARSET={cset="0123456789 _:,{}@ABCDEFGHIJKLMNOPQRSTUVWXYZ#!",s=463}
function getCharTile(ch)
    local p = CHARSET.cset:find(ch)
    if p ~= nil then 
        return p + CHARSET.s  
    end
   
    return CHARSET.s+1
end
--builds character set
function SetCharset()
	CHARSET.tset = {}
	local tile = CHARSET.s
	for p=1,#CHARSET.cset do
		table.insert(CHARSET.tset, tile)
		tile = tile + 1
	end
end

--generates a table from a table like string .sub
function tablesub(t,s,e)
	local nt = {}
	local p = s
	while p <= #t and p <= e do
		table.insert(nt,t[p])
		p = p + 1
	end
	return nt
end
--appends b to a
function tableappend(a,b)
	 for p=1,#b do
		table.insert(a,b[p])
	 end
end
SCREEN2PI=math.pi*2/240
SCREEN2PIY=math.pi*2/136

FRAME_DELTA=1/60

LT=0
SECTRACK=0
FPS=0
LASTFC=0
function TIC()
	local lt=time()
	local millidelta=lt-LT
	FRAME_DELTA=millidelta*.001
	SECTRACK = SECTRACK + millidelta
	FRAMES=FRAMES+1
	if SECTRACK >= 1000 then
		SECTRACK = SECTRACK - 1000
		FPS=FRAMES
		FRAMES=0
	end
	LT=lt
	DRAW()
end
function DRAW()
	
	if #DEMOSCENES > 0 then
		local as=0
		if (DEMOSCENES[1].clr) then
			cls(0)
			vbank(1)
			cls(0)
		end
		--this scene still alive
		for a=1,#DEMOSCENES[1] do
			--get effect
			local e=DEMOSCENES[1][a]
			--check that effects delta is valid
			--may remove the effect if over ??
			--would break the for loop though
			if e.active then
				e.dat.delta = e.dat.delta + 1
				if e.dat.delta >= e.beg then
					--trace(e.bank)
					vbank(e.bank)
					--check for nil as it may be a user effect
					if e.sub ~= nil then e.sub(e.dat) end
					--check for user callback(s)
					if e.user ~= nil then
						for p = 1,#e.user do
							e.user[p](e.dat)
						end
					end
					as = as + 1
				end
				if e.dat.delta >= e.ovr or e.dat.finish then
					e.active = false
					if e.endme ~= null then
						--trace("calling "..tostring(e.dat))
						e.endme(e.dat)
					end
				end
			end
		end
		DEMOSCENES[1].delta = DEMOSCENES[1].delta + 1
		if SHOWTIME then
			local b ="ST:"..deltaToSec(DEMOSCENES[1].delta).." O:"..deltaToSec(DEMOSCENES[1].ovr)
			local f=print(b,0,-10)
			print(b,0,8,12)
		end
		if STATS then print("["..DEMOSCENES[1].sc.."] "..DEMOSCENES[1].ti.." [active:"..as.."]",70,0,12) end
		if (DEMOSCENES[1].delta > DEMOSCENES[1].ovr) then
			for a=1,#DEMOSCENES[1] do
				local e=DEMOSCENES[1][a]
				if e.active then
					--call any end effect routines if we ended early
					if e.endme ~= null then
						e.endme(e.dat)
					end
				end
			end
			if DEMOSCENES[1].callme ~= nil then
				DEMOSCENES[1].callme()
			end
			table.remove(DEMOSCENES,1)
		end
	else
		cls()
		print("SCENE demoscenes EMPTY",40,120)
	end
	if SHOWTIME then print("T:"..deltaToSec(FRAMES),0,0,12) end
	print("FPS:"..FPS,0,131,12)
end

TADDR=0x4000
TADDR4 = 0x8000

ONESHOT = true
--draw a vertical strip from a sprite
function drawSprVert(sp,x,y,w,h,sx,sy,line)
	--pixel start address for plotting
	local pxBaseLine = y//1 * 240 + x
	--sprite base addr (topleft corner)
	local spBaseLine = TADDR4 + (sp // 16 * 1024) + (sp % 16 * 64)

	local pH = clamp( h * 8 * sy, 1, 136-y)
	local pX = clamp(sx,1, 240-x)
	local stepR = 1/sy
	--local stepC = 1/sx
	local pixel = 0

	for row=0,pH-1 do
		local pxAddr = pxBaseLine
		local spRowInt = (row * stepR) // 1
		local spStart = spBaseLine + (spRowInt // 8) * 1024 + ((spRowInt % 8) * 8)
		local spPixelAddr = spStart + line % 8 + ((line // 8) * 64)
		pixel = peek4(spPixelAddr)
		for col=0,pX-1 do
			--local spColInt = (col * stepC) // 1
			--local prevspPA = spPixelAddr
			
			--only get if changed pixel
			--if prevspPA ~= spPixelAddr then
				--pixel = peek4(spPixelAddr)
			--end
			--trans number

			if pixel > 0 then 
				poke4(pxAddr,pixel)
			end
			pxAddr = pxAddr + 1
		end
		pxBaseLine = pxBaseLine + 240
	end
end

--drawmultiple width sprites but only one line of it
--line is the line within this sprite block (if 2 high - 0-15)
function drawSprHorizStrip(sp,x,y,w,sx,sy,line)
	--pixel start address for plotting
	pxBaseLine = (y//1 * 240) + x
	--sprite base addr (topleft corner)
	spBaseLine = TADDR4 + (sp // 16 * 1024) + (sp % 16 * 64)

	pH = clamp(sy, 1, 136-y)
	pX = clamp(w * 8 * sx,1, 240-x)
	stepC = 1/sx
	spStart = spBaseLine + (line // 8) * 1024 + ((line % 8) * 8)
	for row=0,pH-1 do
		pxAddr = pxBaseLine
		for col=0,pX-1 do
			spColInt = (col * stepC) // 1
			prevspPA = spPixelAddr
			spPixelAddr = spStart + spColInt % 8 + ((spColInt // 8) * 64)
			--only get if changed pixel
			if prevspPA ~= spPixelAddr then
				pixel = peek4(spPixelAddr)
			end
			--trans number
			if pixel > 0 then 
				poke4(pxAddr,pixel)
			end
			pxAddr = pxAddr + 1
		end
		--drop row
		pxBaseLine = pxBaseLine + 240
	end
end
--[[scales without infiling pixels, so exploded effect]]
function pixelscaleme(sp,x,y,w,h,sx,sy)
	--pixel start address for plotting
	local pxBaseLine = y//1 * 240 + x
	--sprite base addr (topleft corner)
	local spBaseLine = TADDR4 + (sp // 16 * 1024) + (sp % 16 * 64)
	local pixel = 0

	local rpa
	local rpl=0
	local pxB = pxBaseLine
	for row=0,8*h-1 do 
		rpa = pxBaseLine
		local pxAddr = pxBaseLine
		local spStart = spBaseLine + (row // 8) * 1024 + ((row % 8) * 8)
		for col=0,8*w-1 do
			local spPixelAddr = spStart + col % 8 + ((col // 8) * 64)
			pixel = peek4(spPixelAddr)
			if pixel > 0 then 
				poke4(pxAddr,pixel)
			end
			rpa = rpa + sx
			pxAddr = rpa //1
		end
		rpl=rpl + sy
		pxBaseLine =  pxB + (240 * (rpl//1))
	end
end


--[[scales leaving no gaps]]
function scaleme(sp,x,y,w,h,sx,sy)
	--pixel start address for plotting
	--local pxBaseLine = x
	--if y>0 then pxBaseLine = pxBaseLine + y//1 * 240 end
	local pxBaseLine = y//1 * 240 + x
	--sprite base addr (topleft corner)
	local spBaseLine = TADDR4 + (sp // 16 * 1024) + (sp % 16 * 64)

	local pH = clamp( h * 8 * sy, 1, 136-y)
	local pX = clamp(w * 8 * sx,1, 240-x)
	local stepR = 1/sy
	local stepC = 1/sx
	local pixel = 0
	local ry = y
	trace("y["..y.."] ph["..pH.."]")
	for row=0,pH-1 do
		--ERIC HERE
		local pxAddr = pxBaseLine
		local spRowInt = (row * stepR) // 1
		local spStart = spBaseLine + (spRowInt // 8) * 1024 + ((spRowInt % 8) * 8)
		ry = ry + stepR --added to clip top 
		if ry >= 0 then --draw once on screen
			local rx = x -- added to clip left edge
			for col=0,pX-1 do
				local spColInt = (col * stepC) // 1
				local prevspPA = spPixelAddr
				local spPixelAddr = spStart + spColInt % 8 + ((spColInt // 8) * 64)
				--only get if changed pixel
				
				if prevspPA ~= spPixelAddr then
					pixel = peek4(spPixelAddr)
				end
				--trans number
				rx = rx + stepC --added to clip left edge
				if pixel > 0 and rx >= 0 then --added and rx>=0 for left edge clip
					poke4(pxAddr,pixel)
				end
				pxAddr = pxAddr + 1
			end
		end
		pxBaseLine = pxBaseLine + 240
	end
end
function showSprite(d)
	quad(d.sprite,d.x,d.y,d.tileswide,d.tileshigh,d.sx,d.sy,d.transpen)
end

function addScaledSprite(time,data)
	data=data or {sprite=480,x=0,y=0,tileswide=1,tileshigh=1,sx=10,sy=10,delta=0,transpen=0}
	local effect={sub=showSprite,dat=data,endme=clearover}
	ScnEffect(effect,time)
end


function secToDelta(sec)
	return sec*60
end
function deltaToSec(d)
	return d//60+d%60/100
end
PAL_MAP = 0x3FF0
PAL_MAPx2 = 0x7fe0

function palswap(palchange, newpal)
	poke4(PAL_MAPx2 + palchange, newpal)
end


function ScnEffect(effect, time)
	--trace("add new scene")
	effect.active=true
	effect.bank=time.bank or 0
	time.showFor = time.showFor or DEMOSCENES[SCENENUM].len
	time.showAfter=time.showAfter or 0
	effect.ovr=secToDelta(time.showAfter + time.showFor)
	effect.beg=secToDelta(time.showAfter)
	effect.dat.delta = effect.dat.delta or 0
	effect.dat.finish = false -- allows an effect to ask for termination
	effect.user=time.user or nil
	table.insert(DEMOSCENES[SCENENUM], effect)
end
--time in seconds for scene to last
--if we need to clear the whole screen for this scene each frame
function newscene(title,time,clear,call)
	LINEMODE = "none"
	resetpalette()
	SCENENUM = SCENENUM + 1
	local thisscene = {sc=SCENENUM,ti=title,ovr=secToDelta(time),clr=clear,delta=0,len=time,callme=(call or nil)}
	table.insert(DEMOSCENES, thisscene)
	return thisscene
end
LTOR = 1
RTOL = -1
UTOD = 1
DTOU = -1
function clearover()
	vbank(1)
	poke(0x03FF8, 0) -- reset transp pen
	cls(0)
	vbank(0)
end
function addwipeLR(time, d)
	time=time or {}
	d.direc = d.direc or RTOL
	d.wipeTime=secToDelta(d.wipeTime) or 60
	d.w=120-120*(d.direc or RTOL)
	d.dw=240/d.wipeTime*d.direc
	local effect={sub=wipeLR,dat=d,endme=clearover}
	ScnEffect(effect, time)
end
-- Transition methods
function wipeLR(d)
	vbank(1)
	cls(d.transCol)
	poke(0x03FF8, d.transCol)
	--poke set address for clear index5
	if (d.dw > 0) then
		rect(0,0,clamp(d.w,0,240),136,d.wipeCol)
	else
		rect(clamp(d.w,0,240),0,240,136,d.wipeCol)
	end
	vbank(0)
	d.w = d.w + d.dw
end
-- end of tran


BARS={}
OFFSET = 0

LINEMODE = "none"
PAL={}
SWAPPAL={}
TINT={0.25,0.25,1}
SWAPHEIGHT = 137
--takes a copy of the palette data
function copypalette()
	local c
	local mem=0x3fc0
	for p=1,48 do
		PAL[p] = peek(mem)
		mem = mem + 1
	end
end
function resetpalette()
	local mem=0x3fc0
	for p=1,48 do
		poke(mem, PAL[p])
		mem = mem + 1
	end
end
function setpalette()
	local mem=0x3fc0
	for p=1,48 do
		poke(mem, SWAPPAL[p])
		mem = mem + 1
	end
end

--run automatically after/Before scanline
function BDR(line)
	if LINEMODE == "none" then
		--resetpalette()
		return
	elseif LINEMODE == "swap" then
		if line < 4 or line > 139 then
			resetpalette()
		elseif line == SWAPHEIGHT then
			--make a callback so managed by effect
			setpalette()
		end
	elseif LINEMODE == "bar" then
		local p = {0,0,0}
		if line < 4 or line > 139 then --bdr line + 4
			p = {0,0,0}
		else
			local li = line + OFFSET
			li = li % 256
			p = BARS[li]
		end
		poke(0x3fc0 + barpen,p[1])
		poke(0x3fc1 + barpen,p[2])
		poke(0x3fc2 + barpen,p[3])
   end
end	
function barson(d)
	LINEMODE="bar"
	barpen=d.p * 3
	d.offset=d.offset+d.doff
	if d.offset==255 or d.offset==0 then
		d.doff = d.doff * -1
	end
	OFFSET = d.offset
	--trace(LINEMODE)
end

function startColourBar(divor)
	b = 0
	for i=0, 255 do
	 -- get a val 0-255 ish
		p = i % 32
	 	p = p * 4
	 	if (i % 32==0) then
			b=b+1
	 end
		c={0,0,0,0}
		if b==4 or b==5 or b==6 or b==7 then c[1]=p end
		if b==6 or b==7 or b==2 or b==3 then c[2]=p end
		   --if b==1 or b==3 or b==5 or b==7 then c[3]=p end
		   if not(b%2==0) then c[3]=p end
		BARS[i] = c
	end
end

--basic for now just to activate effect
function addBars(pen,time,after)
	local data={p=pen,delta=0,offset=0,doff=1}
	local effect={sub=barson,dat=data,endme=resetMirror}
	ScnEffect(effect,time, after)
end

--need to do ease out
function mirror(d)
	if d.ah < d.h then
		--linear growth	
		d.ah = clamp(d.ah + d.dhi,0,d.h)
	end
		--radial growth
	local height = d.ah-d.a + d.ah*d.a *math.sin(d.delta*0.03) - d.ah*d.a*.5 *math.sin(d.delta*0.01)
	height = height // 1
	--	local height = d.ah//1
	LINEMODE=d.m
	SWAPHEIGHT= 136-height --d.l
	--might want to do this once but leave here for now
	for p=1,48 do
		SWAPPAL[p] = clamp(PAL[p] * d.t[((p - 1)% 3) + 1],0,255)
	end
	local grads = SWAPHEIGHT/height
	--local bot = 0x3f48 - 120 * (height)---1)
	local bot = SWAPHEIGHT*120
	local rtop = bot - 120
	local top = 0
	for p=1,height do
		top = rtop - (rtop % 120) --keep on a full memory line addr
		memcpy(bot,top, 120)
		rtop = rtop - 120 * grads -- linear difference
		bot = bot + 120
	end
	SWAPHEIGHT = SWAPHEIGHT+5 -- translate for bdr()
end
function resetMirror(d)
	LINEMODE="none"
	resetpalette()
end

function clamp(val,min,max)
	if val > max then return max
	elseif val < min then return min
	else return val	end
end
--adds a reflective surface at bottom of screen
--put in the stack to reflect previous content
--need to think about tinting eventually
function addMirror(time, set)
	local data={fadef=secToDelta(set.fade),a=set.amplitude,ease=true,h=set.height,t=set.tint,m="swap",l=136-set.height,s=(136-set.height)/set.height,delta=0,dhi=set.easein, dho=set.easeout,ah=0}

	local effect={sub=mirror,dat=data,endme=resetMirror}
	ScnEffect(effect,time)
end


function drawtiles(d)
	spr(d.s,d.x,d.y,0,d.sz,0,0,d.w,d.h)
	d.x = d.x + d.vx
	d.y = d.y + d.vy
end

function addtiles(xp, yp, start, width, height,scale, volx, voly, time,after)
	local data={x=xp,y=yp,vx=volx*FRAME_DELTA,vy=voly*FRAME_DELTA,sz=scale,s=start,w=width,h=height,delta=0}
	local effect={sub=drawtiles,dat=data}
	ScnEffect(effect,time, after)
end

function paltint(d)
	LINEMODE=d.m
	SWAPHEIGHT=d.line
	--might want to do this once but leave here for now
	for p=1,48 do
		SWAPPAL[p] = PAL[p] * d.tint[((p - 1)% 3) + 1]
	end
end
function addPalettetint(time, data)
--addPalettetint(68, {0.15,0.15,0.15},100,10)
	data.tint=data.tint or {0.5,0.5,0.5}
	data.line=data.line + 4 -- for bdr()
	data.m="swap"
	--local data={l=line+4,m="swap",t=tint,delta=0}
	local effect={sub=paltint,dat=data,endme=resetMirror}
	ScnEffect(effect,time)
end

function delay(time,call)
	newscene("Greetings",time,true,call)
end

function BOOT()
	math.randomseed( time() )
	--genNibbles()
	copypalette()
	SetCharset()
	startColourBar(16)
	FRAMES = 0
	MAKESCENES()
end


function CLEARSCENES()
	DEMOSCENES={}
	SCENENUM=0
end
