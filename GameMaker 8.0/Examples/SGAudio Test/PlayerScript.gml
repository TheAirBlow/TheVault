#define sga_Init

//// This script initializes the DLL and the sound system

var nm, ct, rt;
nm = "SGAudio.dll";
ct = dll_cdecl;
rt = ty_real;
st = ty_string;
//// main functions
// system
global._sga_init = external_define( nm, "sga_Init", ct, rt, 0 );
global._sga_free = external_define( nm, "sga_Free", ct, rt, 0 );
// listener
global._sga_setlp = external_define( nm, "sga_SetListenerPosition", ct, rt, 3, rt, rt, rt );
global._sga_setld = external_define( nm, "sga_SetListenerDirection", ct, rt, 6, rt, rt, rt, rt, rt, rt );
// groups
global._sga_setgv = external_define( nm, "sga_SetGroupVolume", ct, rt, 2, rt, rt );
global._sga_getgv = external_define( nm, "sga_GetGroupVolume", ct, rt, 1, rt );
//// emitters
// instances
global._sga_crem = external_define( nm, "sga_CreateEmitter", ct, rt, 1, st );
global._sga_dsem = external_define( nm, "sga_DestroyEmitter", ct, rt, 1, rt );
// playback control
global._sga_play = external_define( nm, "sga_Play", ct, rt, 1, rt );
global._sga_pause = external_define( nm, "sga_Pause", ct, rt, 1, rt );
global._sga_stop = external_define( nm, "sga_Stop", ct, rt, 1, rt );
global._sga_rwnd = external_define( nm, "sga_Rewind", ct, rt, 1, rt );
global._sga_isply = external_define( nm, "sga_IsPlaying", ct, rt, 1, rt );
// "flow" control
global._sga_setvol = external_define( nm, "sga_SetVolume", ct, rt, 2, rt, rt );
global._sga_getvol = external_define( nm, "sga_GetVolume", ct, rt, 1, rt );
global._sga_fadevol = external_define( nm, "sga_FadeVolume", ct, rt, 3, rt, rt, rt );
global._sga_setflg = external_define( nm, "sga_SetType", ct, rt, 2, rt, rt );
global._sga_getflg = external_define( nm, "sga_GetType", ct, rt, 1, rt );
global._sga_setloop = external_define( nm, "sga_SetLooping", ct, rt, 2, rt, rt );
// 3D control
global._sga_set3dm = external_define( nm, "sga_Set3DMode", ct, rt, 2, rt, rt );
global._sga_setdf = external_define( nm, "sga_SetDistFactor", ct, rt, 2, rt, rt );
global._sga_setpos = external_define( nm, "sga_SetPosition", ct, rt, 4, rt, rt, rt, rt );
//// tracks
global._sga_trkply = external_define( nm, "sga_TrackPlay", ct, rt, 4, rt, st, rt, rt );

external_call( global._sga_init );


#define sga_Free

//// This script frees the sound system and the DLL

external_call( global._sga_free );
external_free( "SGAudio.dll" );

#define sga_SetCamPos

//// This script sets the camera position
// Arguments: X, Y, Z

external_call( global._sga_setlp, argument0, argument1, argument2 );

#define sga_SetCamDir

//// This script sets the camera direction vectors
// Arguments: dirX, dirY, dirZ, upX, upY, upZ
// Vectors should be neither parallel nor 0

external_call( global._sga_setld, argument0, argument1, argument2, argument3, argument4, argument5 );

#define sga_SetGroupVol

//// This script sets the volume of the group
// Arguments: group ID (0-31), volume (0-1)

external_call( global._sga_setgv, argument0, argument1 );

#define sga_GetGroupVol

//// This script gets the volume of the group
// Arguments: group ID (0-31)
// Returns the volume (0-1)

return external_call( global._sga_getgv, argument0 );

#define sga_CreateEmitter

//// This script makes a sound emitter
// Arguments: file name
// Returns emitter ID

return external_call( global._sga_crem, argument0 );

#define sga_DestroyEmitter

//// This script makes a sound emitter
// Arguments: emitter ID
// nothing happens with an invalid ID

external_call( global._sga_dsem, argument0 );

#define sga_Play

//// This script starts playing sound through an emitter
// Arguments: emitter ID

external_call( global._sga_play, argument0 );

#define sga_Pause

//// This script makes an emitter stop playing sound (without rewinding)
// Arguments: emitter ID

external_call( global._sga_pause, argument0 );

#define sga_Stop

//// This script makes an emitter stop playing sound (with rewinding)
// Arguments: emitter ID

external_call( global._sga_stop, argument0 );

#define sga_Rewind

//// This script rewinds the emitter
// Arguments: emitter ID

external_call( global._sga_rwnd, argument0 );

#define sga_IsPlaying

//// This script checks if an emitter is playing
// Arguments: emitter ID
// Returns 0 or 1

return external_call( global._sga_isply, argument0 );

#define sga_SetVol

//// This script sets the volume of an emitter
// Arguments: emitter ID, volume (0-1)

external_call( global._sga_setvol, argument0, argument1 );

#define sga_GetVol

//// This script gets the volume of an emitter
// Arguments: emitter ID
// Returns volume (0-1)

return external_call( global._sga_getvol, argument0 );

#define sga_FadeVol

//// This script fades the volume of an emitter over time
// Arguments: emitter ID, target volume (0-1), time (0-inf.)

external_call( global._sga_fadevol, argument0, argument1, argument2 );

#define sga_SetType

//// This script sets the type (group flags) of an emitter
// Arguments: emitter ID, type (0 - 2^32-1)

external_call( global._sga_setflg, argument0, argument1 );

#define sga_GetType

//// This script gets the volume of an emitter
// Arguments: emitter ID
// Returns type(0 - 2^32-1)

return external_call( global._sga_getflg, argument0 );

#define sga_SetLooping

//// This script sets the looping mode of an emitter
// Arguments: emitter ID, looping mode (0-once, 1-forever)

external_call( global._sga_setloop, argument0, argument1 );

#define sga_Set3DMode

//// This script sets the 3D mode of an emitter
// Arguments: emitter ID, 3D mode (0-2D, 1-3D)
// The actual changes are:
//// for 2D: going to relative position mode, setting position to 0
//// for 3D: going to absolute position mode

external_call( global._sga_set3dm, argument0, argument1 );

#define sga_SetDistFactor

//// This script sets the 3D distance factor of an emitter
// Arguments: emitter ID, distance factor (0 < x < inf)
// distance factor - how quickly the sound fades out in distance

external_call( global._sga_setdf, argument0, argument1 );

#define sga_SetPosition

//// This script sets the 3D position of an emitter
// Arguments: emitter ID, X, Y, Z

external_call( global._sga_setpos, argument0, argument1, argument2, argument3 );

#define sga_TrackPlay

//// This script plays a track
// Arguments: emitter ID or -1 for the first time, File name, Looping mode (0/1), Type flags
// Returns the ID
// Sample usage:
// [on creation]: TrackID = -1
// [on song change]: TrackID = sga_TrackPlay( TrackID, newfile, loop, flags );
// [on destruction]: sga_DestroyEmitter( TrackID );

return external_call( global._sga_trkply, argument0, argument1, argument2, argument3 );

#define sga_Create3DFX

// Creates a 3D sound effect
// Arguments: file name, type flags

var eid;
eid = sga_CreateEmitter( argument0 );
sga_Set3DMode( eid, 1 );
sga_SetType( eid, argument1 );
return eid;

#define sga_CreateFX

// Creates a simple sound effect
// Arguments: file name, type flags

var eid;
eid = sga_CreateEmitter( argument0 );
sga_Set3DMode( eid, 0 );
sga_SetType( eid, argument1 );
return eid;

#define sga_Play3DFX

// Plays a 3D sound effect
sga_Stop( argument0 );
sga_SetPosition( argument0, argument1, argument2, argument3 );
sga_Play( argument0 );

#define sga_PlayFX

// Plays a simple sound effect
sga_Stop( argument0 );
sga_Play( argument0 );

