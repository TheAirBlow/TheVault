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

