## Creating a scene

	A scene is a container for a group of effects. It needs to be created first in your function before you add effects to display
  
  the 30 indicates the number of seconds that this scene will last
  ```lua
  function myscene()
    local s = newscene("SPRITE",30,true) 
    -- effect code goes here
  end
  ```
  
  Once you have a scene you can "call it" in the `MAKESCENES()` function at the top of the user code. Use the `-- comment characters to disable other function calls (rather than deleting the code)
  
  ```lua
function MAKESCENES()
	CLEARSCENES()
	myscene()
	--sceneOne()
	--sceneTwo()
end
  
  ```

