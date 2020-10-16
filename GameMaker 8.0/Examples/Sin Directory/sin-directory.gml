#define sin_directory_init
/*SIN DIRECTORY DLL VERSION 3.0 */

//initialize the DLL

//DLL path
var_sin_directory_dll=working_directory+"\dirdll.dll";

//Declare functions available
global.var_directory_sin1=external_define(var_sin_directory_dll,"sin_directory_create",dll_stdcall,ty_real,1,ty_string);
global.var_directory_sin2=external_define(var_sin_directory_dll,"sin_directory_remove",dll_stdcall,ty_real,1,ty_string);
global.var_directory_sin3=external_define(var_sin_directory_dll,"sin_directory_get_windows",dll_stdcall,ty_string,0);
global.var_directory_sin4=external_define(var_sin_directory_dll,"sin_directory_get_current_working",dll_stdcall,ty_string,0);
global.var_directory_sin5=external_define(var_sin_directory_dll,"sin_directory_get_temp",dll_stdcall,ty_string,0);
global.var_directory_sin6=external_define(var_sin_directory_dll,"sin_directory_get_current_program",dll_stdcall,ty_string,0);
global.var_directory_sin7=external_define(var_sin_directory_dll,"sin_directory_get_desktop",dll_stdcall,ty_string,0);
global.var_directory_sin8=external_define(var_sin_directory_dll,"sin_directory_get_mydocuments",dll_stdcall,ty_string,0);
global.var_directory_sin9=external_define(var_sin_directory_dll,"sin_directory_get_mypictures",dll_stdcall,ty_string,0);
global.var_directory_sin10=external_define(var_sin_directory_dll,"sin_directory_get_mymusic",dll_stdcall,ty_string,0);
global.var_directory_sin11=external_define(var_sin_directory_dll,"sin_directory_get_myvideo",dll_stdcall,ty_string,0);
global.var_directory_sin12=external_define(var_sin_directory_dll,"sin_directory_get_favorites",dll_stdcall,ty_string,0);
global.var_directory_sin13=external_define(var_sin_directory_dll,"sin_directory_get_cookies",dll_stdcall,ty_string,0);
global.var_directory_sin14=external_define(var_sin_directory_dll,"sin_directory_get_history",dll_stdcall,ty_string,0);
global.var_directory_sin15=external_define(var_sin_directory_dll,"sin_directory_get_internetcache",dll_stdcall,ty_string,0);
global.var_directory_sin16=external_define(var_sin_directory_dll,"sin_directory_get_recent",dll_stdcall,ty_string,0);
global.var_directory_sin17=external_define(var_sin_directory_dll,"sin_directory_get_user",dll_stdcall,ty_string,0);
global.var_directory_sin18=external_define(var_sin_directory_dll,"sin_directory_get_startup",dll_stdcall,ty_string,0);
global.var_directory_sin19=external_define(var_sin_directory_dll,"sin_directory_get_startmenu",dll_stdcall,ty_string,0);
global.var_directory_sin20=external_define(var_sin_directory_dll,"sin_directory_get_programs",dll_stdcall,ty_string,0);
global.var_directory_sin21=external_define(var_sin_directory_dll,"sin_directory_get_sendto",dll_stdcall,ty_string,0);
global.var_directory_sin22=external_define(var_sin_directory_dll,"sin_directory_get_nethood",dll_stdcall,ty_string,0);
global.var_directory_sin23=external_define(var_sin_directory_dll,"sin_directory_get_printhood",dll_stdcall,ty_string,0);
global.var_directory_sin24=external_define(var_sin_directory_dll,"sin_directory_get_cdburn",dll_stdcall,ty_string,0);
global.var_directory_sin25=external_define(var_sin_directory_dll,"sin_directory_get_fonts",dll_stdcall,ty_string,0);
global.var_directory_sin26=external_define(var_sin_directory_dll,"sin_directory_get_appdata",dll_stdcall,ty_string,0);
global.var_directory_sin27=external_define(var_sin_directory_dll,"sin_directory_get_local_appdata",dll_stdcall,ty_string,0);
global.var_directory_sin28=external_define(var_sin_directory_dll,"sin_directory_get_programfiles",dll_stdcall,ty_string,0);
global.var_directory_sin29=external_define(var_sin_directory_dll,"sin_directory_get_system",dll_stdcall,ty_string,0);
global.var_directory_sin30=external_define(var_sin_directory_dll,"sin_directory_get_public_appdata",dll_stdcall,ty_string,0);
global.var_directory_sin31=external_define(var_sin_directory_dll,"sin_directory_get_public_documents",dll_stdcall,ty_string,0);
global.var_directory_sin32=external_define(var_sin_directory_dll,"sin_directory_get_public_pictures",dll_stdcall,ty_string,0);
global.var_directory_sin33=external_define(var_sin_directory_dll,"sin_directory_get_public_music",dll_stdcall,ty_string,0);
global.var_directory_sin34=external_define(var_sin_directory_dll,"sin_directory_get_public_video",dll_stdcall,ty_string,0);
global.var_directory_sin35=external_define(var_sin_directory_dll,"sin_directory_get_public_favorites",dll_stdcall,ty_string,0);
global.var_directory_sin36=external_define(var_sin_directory_dll,"sin_directory_get_public_startup",dll_stdcall,ty_string,0);
global.var_directory_sin37=external_define(var_sin_directory_dll,"sin_directory_get_public_startmenu",dll_stdcall,ty_string,0);
global.var_directory_sin38=external_define(var_sin_directory_dll,"sin_directory_get_public_programs",dll_stdcall,ty_string,0);
global.var_directory_sin39=external_define(var_sin_directory_dll,"sin_directory_get_public_desktop",dll_stdcall,ty_string,0);
global.var_directory_sin40=external_define(var_sin_directory_dll,"sin_directory_get_freespace",dll_stdcall,ty_real,1,ty_string);
global.var_directory_sin41=external_define(var_sin_directory_dll,"sin_directory_get_totalspace",dll_stdcall,ty_real,1,ty_string);
global.var_directory_sin42=external_define(var_sin_directory_dll,"sin_directory_get_totalfree",dll_stdcall,ty_real,1,ty_string);
global.var_directory_sin43=external_define(var_sin_directory_dll,"sin_directory_rename",dll_stdcall,ty_real,2,ty_string,ty_string);
global.var_directory_sin44=external_define(var_sin_directory_dll,"sin_directory_get_shortpath",dll_stdcall,ty_string,1,ty_string);
global.var_directory_sin45=external_define(var_sin_directory_dll,"sin_directory_get_longpath",dll_stdcall,ty_string,1,ty_string);
global.var_directory_sin46=external_define(var_sin_directory_dll,"sin_directory_get_commonfiles",dll_stdcall,ty_string,0);
global.var_directory_sin47=external_define(var_sin_directory_dll,"sin_directory_set_current_working",dll_stdcall,ty_real,1,ty_string);


#define sin_directory_create
/*

Create a new directory in the specified path

NOTES:

:: MSDN documentation advices to use \ backslashes for the path, NOT / slashes
:: You may also use working_directory, program_directory and temp_directory with this function

returns 1 on success, 0 on failure

*/

return external_call(global.var_directory_sin1,argument0);

#define sin_directory_remove
/*

Removes a directory in the specified path

NOTES:

:: MSDN documentation advices to use \ backslashes for the path, NOT / slashes
:: You may also use working_directory, program_directory and temp_directory with this function
:: Directory must be empty before deletion otherwise this function will fail

returns 1 on success, 0 on failure

*/

return external_call(global.var_directory_sin2,argument0);

#define sin_directory_rename
/*

Change the name of a directory

NOTES:

:: MSDN documentation advices to use \ backslashes for the path, NOT / slashes
:: You may also use working_directory, program_directory and temp_directory with this function
:: Directory will the new name must not exist otherwise this function will fail

returns 1 on success, 0 on failure

*/

return external_call(global.var_directory_sin43, argument0,argument1);

#define sin_directory_get_current_working
/*

Retrieves the current working directory (same as working_directory())

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin4);

#define sin_directory_set_current_working
/*

Changes the current working directory

returns the 1 on success, 0 on failure

*/

return external_call(global.var_directory_sin47, argument0);

#define sin_directory_get_current_program
/*

Retrieves the current directory the game .exe is in (same as program_directory())

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin6);

#define sin_directory_get_temp
/*

Retrieves the TEMP directory

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin5);

#define sin_directory_get_desktop
/*

Retrieves the Desktop directory

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin7);

#define sin_directory_get_mydocuments
/*

Retrieves the My Documents directory

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin8);

#define sin_directory_get_mypictures
/*

Retrieves the My Pictures directory

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin9);

#define sin_directory_get_mymusic
/*

Retrieves the My Music directory

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin10);

#define sin_directory_get_myvideo
/*

Retrieves the My Video directory

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin11);

#define sin_directory_get_favorites
/*

Retrieves the Favorites directory

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin12);

#define sin_directory_get_cookies
/*

Retrieves the Cookies directory

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin13);

#define sin_directory_get_history
/*

Retrieves the History directory

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin14);

#define sin_directory_get_internetcache
/*

Retrieves the Temporary Internet Files directory

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin15);

#define sin_directory_get_recent
/*

Retrieves the Recent Items directory

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin16);

#define sin_directory_get_user
/*

Retrieves the User Profile directory

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin17);

#define sin_directory_get_startup
/*

Retrieves the Startup directory

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin18);

#define sin_directory_get_startmenu
/*

Retrieves the Start Menu directory

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin19);

#define sin_directory_get_programs
/*

Retrieves the Programs directory

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin20);

#define sin_directory_get_sendto
/*

Retrieves the Send To directory

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin21);

#define sin_directory_get_nethood
/*

Retrieves the Network Shortcuts directory

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin22);

#define sin_directory_get_printhood
/*

Retrieves the Printer Shortcuts directory

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin23);

#define sin_directory_get_cdburn
/*

Retrieves the CD Burn Cache directory

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin24);

#define sin_directory_get_fonts
/*

Retrieves the Fonts directory

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin25);

#define sin_directory_get_appdata
/*

Retrieves the AppData directory (Roaming)

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin26);

#define sin_directory_get_local_appdata
/*

Retrieves the AppData directory (non-Roaming)

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin27);

#define sin_directory_get_programfiles
/*

Retrieves the Program Files directory

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin28);

#define sin_directory_get_commonfiles
/*

Retrieves the Common Files directory

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin46);

#define sin_directory_get_windows
/*

Retrieves the Windows folder

returns the path on success (e.g. C:/WINDOWS), 0 on failure

*/

return external_call(global.var_directory_sin3);

#define sin_directory_get_system
/*

Retrieves the System32 directory

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin29);

#define sin_directory_get_public_appdata
/*

Retrieves the AddData directory for all Users (Returns Program Data folder in Windows Vista)

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin30);

#define sin_directory_get_public_documents
/*

Retrieves the Documents directory for all Users

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin31);

#define sin_directory_get_public_pictures
/*

Retrieves the Pictures directory for all Users

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin32);

#define sin_directory_get_public_music
/*

Retrieves the Music directory for all Users

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin33);

#define sin_directory_get_public_video
/*

Retrieves the Video directory for all Users

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin34);

#define sin_directory_get_public_favorites
/*

Retrieves the Favorites directory for all Users

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin35);

#define sin_directory_get_public_startup
/*

Retrieves the StartUp directory for all Users

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin36);

#define sin_directory_get_public_startmenu
/*

Retrieves the Start Menu directory for all Users

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin37);

#define sin_directory_get_public_programs
/*

Retrieves the Programs directory for all Users

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin38);

#define sin_directory_get_public_desktop
/*

Retrieves the Desktop directory for all Users

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin39);

#define sin_directory_get_shortpath
/*

Converts a long path to a short form

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin44, argument0);

#define sin_directory_get_longpath
/*

Converts a short path to a long form

returns the path on success, 0 on failure

*/

return external_call(global.var_directory_sin45, argument0);

#define sin_directory_get_freespace
/*

Retrieves the free space of a drive

returns the size on success (in bytes), 0 on failure

*/

return external_call(global.var_directory_sin40, argument0);

#define sin_directory_get_totalspace
/*

Retrieves the total space of a drive

returns the size on success (in bytes), 0 on failure
If per-user quotas are being used, this value may be less than the total number of bytes on a disk

*/

return external_call(global.var_directory_sin41, argument0);

#define sin_directory_get_totalfree
/*

Retrieves the total free space of a drive

returns the size on success (in bytes), 0 on failure

*/

return external_call(global.var_directory_sin42, argument0);

