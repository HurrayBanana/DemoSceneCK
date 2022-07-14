## Creating a shareable cartridge

We can create a cartridge that is stored as a PNG image file such as:

![Example cartridge](https://github.com/HurrayBanana/DemoSceneCK/blob/main/assets/cartexample.png)

This can then be easily shared with somebody else. To set this up and save the cartridge we have to do a couple of things

### step 1 edit the cartridge information

the first four lines of code in your user.lua file contain this information.

```lua
-- title:  DemoScene Contruction Kit
-- author: Hurray Banana
-- desc:   A little program to allow Yr7 students to build a demo scene project
-- script: lua
```
You need to edit the **title** line **no more than 19 characters**

You need to edit the **author** (american spelling) line **no more than 16 characters**

### step 2 capturing the cartridge cover

Run your demo and when you get to a part that you would like to use for your cover image press **F7**

This will save internally an image to use in the next step

### step 3 saving the cartridge

Really simple, in the console window type:

```lua
save mycart.png
```

Obviously change the name to something relevant to you, but make sure you put **.png** on the end

You should then have a nice cartridge that can be loaded by typing:

```lua
load mycart.png
```

If you don't like how it turned out go back through the previous steps and make any changes
