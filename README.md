# Test scene

A simple Godot addon that adds a extra run mode to the editor. When pressing the "run test scene" 
button for the first time, a file dialog will allow you to choose a different scene in the project
as test scene. When this run test scene button is pressed later it will run the test scene instead
of the current scene. This can be helpfull if your scene in itself is not playable (has no camera 
or environment for example) you can still test its behaviour wihout having to start the main scene
and traverse through the whole game or having to find the correct scene in "run specific scene". 

## How to use?
First enable the addons in project settings. After enabling it an additional button will appear.

![A screenschot of the godot editor with an additional play button and pointers to relevant areas](https://github.com/DouweRavers/godot_scene_reroute/blob/main/res/test_scene_explain_1.png?raw=true)

When pressing the "run test scene" button the first time on a scene it will open a file dialog asking
to assign the test scene. This can be any scene, but its intention is that the current scene is a child
of the test scene or the test scene is an inherited scene from the current.

![A screenschot of the godot editor with an additional play button and pointers to relevant areas](https://github.com/DouweRavers/godot_scene_reroute/blob/main/res/test_scene_explain_2.png?raw=true)

When pressing the "run test scene" button when the test scene is set up it will just start this test
scene instead of the current one. However you will see that it appears if the "run custom scene" is 
pressed. That is just because in under the hood it actually is. Also you can see that the test scene
path is saved as meta data on the root node of the current scene. If you want to remove the test scene
just remove the meta data label. 

If the path of the test scene is changed, it will be removed on pressing "run test scene" and you will
be prompted point to the new location.
