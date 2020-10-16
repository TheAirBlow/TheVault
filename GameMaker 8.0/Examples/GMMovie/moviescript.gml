#define GMMovie_Init
GMMovieDLL = "GMMovie.dll";

global._GMMovie_Load = external_define(GMMovieDLL,"GMMovie_Load",dll_cdecl,ty_real,3,ty_real,ty_string,ty_string);
global._GMMovie_Close = external_define(GMMovieDLL,"GMMovie_Close",dll_cdecl,ty_real,1,ty_real);
global._GMMovie_Play = external_define(GMMovieDLL,"GMMovie_Play",dll_cdecl,ty_real,1,ty_real);
global._GMMovie_Stop = external_define(GMMovieDLL,"GMMovie_Stop",dll_cdecl,ty_real,1,ty_real);
global._GMMovie_Pause = external_define(GMMovieDLL,"GMMovie_Pause",dll_cdecl,ty_real,1,ty_real);
global._GMMovie_Resume = external_define(GMMovieDLL,"GMMovie_Resume",dll_cdecl,ty_real,1,ty_real);
global._GMMovie_GetSeek = external_define(GMMovieDLL,"GMMovie_GetSeek",dll_cdecl,ty_real,1,ty_real);
global._GMMovie_Seek = external_define(GMMovieDLL,"GMMovie_Seek",dll_cdecl,ty_real,2,ty_real,ty_real);
global._GMMovie_GetVolume = external_define(GMMovieDLL,"GMMovie_GetVolume",dll_cdecl,ty_real,1,ty_real);
global._GMMovie_SetVolume = external_define(GMMovieDLL,"GMMovie_SetVolume",dll_cdecl,ty_real,2,ty_real,ty_real);
global._GMMovie_GetLength = external_define(GMMovieDLL,"GMMovie_GetLength",dll_cdecl,ty_real,1,ty_real);
global._GMMovie_GetZoom = external_define(GMMovieDLL,"GMMovie_GetZoom",dll_cdecl,ty_real,1,ty_real);
global._GMMovie_SetZoom = external_define(GMMovieDLL,"GMMovie_SetZoom",dll_cdecl,ty_real,2,ty_real,ty_real);
global._GMMovie_GetSize = external_define(GMMovieDLL,"GMMovie_GetSize",dll_cdecl,ty_real,2,ty_real,ty_real);
global._GMMovie_SetSize = external_define(GMMovieDLL,"GMMovie_SetSize",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
global._GMMovie_GetPosition = external_define(GMMovieDLL,"GMMovie_GetPosition",dll_cdecl,ty_real,2,ty_real,ty_real);
global._GMMovie_SetPosition = external_define(GMMovieDLL,"GMMovie_SetPosition",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
global._GMMovie_GetRepeat = external_define(GMMovieDLL,"GMMovie_GetRepeat",dll_cdecl,ty_real,1,ty_real);
global._GMMovie_SetRepeat = external_define(GMMovieDLL,"GMMovie_SetRepeat",dll_cdecl,ty_real,2,ty_real,ty_real);

#define GMMovie_Load
return external_call(global._GMMovie_Load,argument0,argument1,argument2);

#define GMMovie_Close
return external_call(global._GMMovie_Close,argument0);

#define GMMovie_Play
return external_call(global._GMMovie_Play,argument0);

#define GMMovie_Stop
return external_call(global._GMMovie_Stop,argument0);

#define GMMovie_Pause
return external_call(global._GMMovie_Pause,argument0);

#define GMMovie_Resume
return external_call(global._GMMovie_Resume,argument0);

#define GMMovie_GetSeek
return external_call(global._GMMovie_GetSeek,argument0);

#define GMMovie_Seek
return external_call(global._GMMovie_Seek,argument0,argument1);
//NOTE: Use -1 for the start, -2 for the end - 
//otherwise time is in milliseconds?

#define GMMovie_GetVolume
return external_call(global._GMMovie_GetVolume,argument0);

#define GMMovie_SetVolume
return external_call(global._GMMovie_SetVolume,argument0,argument1);

#define GMMovie_GetLength
return external_call(global._GMMovie_GetLength,argument0);

#define GMMovie_GetZoom
return external_call(global._GMMovie_GetZoom,argument0);

#define GMMovie_SetZoom
return external_call(global._GMMovie_SetZoom,argument0,argument1);

#define GMMovie_GetSize
return external_call(global._GMMovie_GetSize,argument0,argument1);

#define GMMovie_SetSize
return external_call(global._GMMovie_SetSize,argument0,argument1,argument2);

#define GMMovie_GetPosition
return external_call(global._GMMovie_GetPosition,argument0,argument1);

#define GMMovie_SetPosition
return external_call(global._GMMovie_SetPosition,argument0,argument1,argument2);

#define GMMovie_GetRepeat
return external_call(global._GMMovie_GetRepeat,argument0);

#define GMMovie_SetRepeat
return external_call(global._GMMovie_SetRepeat,argument0,argument1);
