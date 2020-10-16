     _    _      _ _         ______             _              _____ __ 
    | |  | |    | | |       |  ____|           (_)            | ____/_ |
    | |__| | ___| | | ___   | |__   _ __   __ _ _ _ __   ___  | |__  | |
    |  __  |/ _ \ | |/ _ \  |  __| | '_ \ / _` | | '_ \ / _ \ |___ \ | |
    | |  | |  __/ | | (_) | | |____| | | | (_| | | | | |  __/  ___) || |
    |_|  |_|\___|_|_|\___/  |______|_| |_|\__, |_|_| |_|\___| |____(_)_|
                                           __/ |                        
                 Open Source Mario Engine |___/ 
============================================================================

Thanks for downloading the Hello Engine 5.1 Source for Game Maker 8.0+!

Feel free to modify this engine however you like. You may also redistribute
this engine if you want to! Just make sure that you don't claim this engine
as your own creation. This engine is not compatible with Game Maker Lite.

====================================Q&A=====================================

Q: Am I allowed to make games with your engine?
A: Of course!

Q: What are all of those large collision objects for?
A: They are used to reduce the number of collision objects in your level,
   which can help reduce lag on older computers.

Q: How do I place tiles?
A: Turn on Advanced Mode. The tile menu in the room editor will appear only
   when this is enabled.

Q: What do I do if I want to change the size of Mario's sprites?
A: Change the x origin to half the width of the sprite, and change the y
   origin to the height of the sprite minus 32.

Q: Is there a guide for the Hello Engine 5?
A: Look at the included example levels to see how everything is used. These
   levels use every single feature in the engine for a reason!

Q: How do I change the title that shows up on top of the game?
A: click on Resources > Define Constants, then change "Hello Engine 5"
   to "Your Title Here".

Q: What happened to the FPS counter on the bottom corner?
A: Uncomment the last line in obj_camera's draw event if you want it back.

Q: Can you add Luigi to your engine?
A: I don't take feature requests, but nothing is stopping you from adding
   him in yourself!

===============================Creation Codes===============================

Some objects in this engine require creation codes when you place them in
rooms. To do this, press Ctrl + Right Click on it, and choose creation code.
What is needed is found commented in the create events of these objects.

Object: obj_musicplayer
Reason: To choose the music and time limit.

Object: obj_bganimator
Reason: To select what order to animate backgrounds.

Object: obj_block_sprout
Reason: To choose what comes out.

Object: obj_block_spiked
Reason: To choose what comes out.

Object: obj_block_Winged
Reason: To choose what comes out.

Object: obj_sproutblock_hidden
Reason: To choose what comes out.

Object: obj_messageblock
Reason: To choose the message to display.

Object: obj_noteblock
Reason: Only if you want a powerup to come out when you bounce on it.

Object: obj_warpnoteblock_hidden
Reason: To select a destination.

Object: obj_noteblock_warp
Reason: To select a destination.

Object: obj_lakitu
Reason: To set the boundary for where he appears.

Object: obj_lakitu_ball
Reason: To set the boundary for where he appears.

Object: obj_magikoopa
Reason: To set the boundary for where he appears.

Object: obj_diacannon
Reason: To set its direction.

Object: obj_bombcannon
Reason: To set its direction.

Object: obj_sidecannon
Reason: To set its direction.

Object: obj_pipeenemygenerator
Reason: To choose its direction and enemy.

Object: obj_bulletgenerator
Reason: To set the boundary for where it generates.

Object: obj_stormgenerator
Reason: To set the boundary for where it generates.

Object: obj_cheepgenerator
Reason: To set the boundary for where it generates.

Object: obj_classicbowser
Reason: To set where Bowser's flames start generating.

Object: obj_levelpanel
Reason: To select a name, destination, and number.

Object: obj_levelcastle
Reason: To select a name and destination.

Object: obj_mappipe
Reason: To select a destination.

Object: obj_mushhouse
Reason: To select the powerups in the boxes.

Object: obj_mapbro
Reason: To select a prize powerup.

Object: obj_postchange
Reason: To select Mario's new position.

Object: obj_warproom
Reason: To select Mario's new room and position.

Object: obj_warpnextroom
Reason: To select Mario's new position in the next room.

Object: obj_platformtimed
Reason: To set the time limit.

Object: obj_movingrope
Reason: To choose how long the rope is.

Object: obj_movingrope_touch
Reason: To choose how long the rope is.

Object: obj_bubble_item
Reason: To choose the item in it.

Object: obj_veggie_sprout
Reason: To choose the item in it.

Object: obj_stormmaker
Reason: To change the color of the rain.