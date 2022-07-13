## Creating mulitple scenes
A scene is a container for a group of effects. It needs to be created first in your function before you add effects to display
You already have a default scene function called **myscene()**

You can see one here:
   
  ```lua
  function myscene()
    local s = newscene("SPRITE",30,true) 
    -- effect code goes here
  end
  ```
 The demo system can work with multiple scenes in order to do this we need to create another scene function. Start by creating a new function (we can call this whatever we want) but I have decided to call mine **mysecondscene** Place this directly after the MAKESCENES function. You can copy this code as it is but remember to change the time value (currently **35**)
  
```lua
function mysecondscene()
  local s = newscene("SCENE TWO",35,true) 
  -- effect code goes here
end
```
 
then go into **MAKESCENES()** and add a line to run your new scene function
  Once you have a scene you can "call it" in the `MAKESCENES()` function at the top of the user code. Use the `-- comment characters to disable other function calls (rather than deleting the code)
  
```lua
function MAKESCENES()
  CLEARSCENES()
  myscene()
  mysecondscene()
end  
```

As soon as the first scene finishes the second scene will start. You can add as many scenes as you want this way.

