# Scene Reroute
A simple Godot addon that allows to reroute your godot scenes when pressing "run current scene". 
If your scene in itself is not playable (has no camera or environment) you can still test its
behaviour wihout having to start the main scene or having to find the correct scene in "run specific 
scene". 

## Example
You have a 3D player character with movement, camera controls, UI and such. But running it directly 
would just load a dark scene (no environemnt and light on your player character) and the character
would fall into the void as their is no world to stand on. 

Creating a simple test_character scene where the environment, light and a simple terrain is present 
in combination with the player character itself would work to test its movement for example. 
Currently this would mean you have to switch to this scene or search for it in the "run specific 
scene" tab. However with this simple addon allows you to just redirect the "run current scene" to the test
scene. So you can work on just the character in the editor but run it with a simple test environment
around it.
