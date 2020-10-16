#define DM_Init
    global.external_dm_createdownload = external_define ('DownloadManager2.dll','hobbl_com_createdownload',dll_stdcall,ty_real,2,ty_string,ty_string);
    global.external_dm_createhandle = external_define ('DownloadManager2.dll','hobbl_com_createhandle',dll_stdcall,ty_real,0);
    global.external_dm_opendownload = external_define ('DownloadManager2.dll','hobbl_com_opendownload',dll_stdcall,ty_real,3,ty_real,ty_string,ty_string);
    global.external_dm_startdownload = external_define ('DownloadManager2.dll','hobbl_com_startdownload',dll_stdcall,ty_real,1,ty_real);
    global.external_dm_getresponse = external_define ('DownloadManager2.dll','hobbl_com_getresponse',dll_stdcall,ty_real,1,ty_real);
    global.external_dm_getresponseheader = external_define ('DownloadManager2.dll','hobbl_com_getresponseheader',dll_stdcall,ty_string,2,ty_real,ty_string);
    global.external_dm_getspeed = external_define ('DownloadManager2.dll','hobbl_com_getspeed',dll_stdcall,ty_real,1,ty_real);
    global.external_dm_getprogress = external_define ('DownloadManager2.dll','hobbl_com_getprogress',dll_stdcall,ty_real,1,ty_real);
    global.external_dm_closedownload = external_define ('DownloadManager2.dll','hobbl_com_closedownload',dll_stdcall,ty_real,1,ty_real);
    global.external_dm_stopdownload = external_define ('DownloadManager2.dll','hobbl_com_stopdownload',dll_stdcall,ty_real,1,ty_real);
    global.external_dm_pausedownload = external_define ('DownloadManager2.dll','hobbl_com_pausedownload',dll_stdcall,ty_real,1,ty_real);
    global.external_dm_resumedownload = external_define ('DownloadManager2.dll','hobbl_com_resumedownload',dll_stdcall,ty_real,1,ty_real);
    global.external_dm_downloadstatus = external_define ('DownloadManager2.dll','hobbl_com_downloadstatus',dll_stdcall,ty_real,1,ty_real);
    global.external_dm_getcontenttype = external_define ('DownloadManager2.dll','hobbl_com_getcontenttype',dll_stdcall,ty_string,1,ty_real);
    global.external_dm_getcompleted = external_define ('DownloadManager2.dll','hobbl_com_getcompleted',dll_stdcall,ty_real,1,ty_real);
    global.external_dm_getlength = external_define ('DownloadManager2.dll','hobbl_com_getlength',dll_stdcall,ty_real,1,ty_real);
    global.external_dm_getresponseheaders = external_define ('DownloadManager2.dll','hobbl_com_getresponseheaders',dll_stdcall,ty_real,1,ty_real);
    global.external_dm_getresponseheadername = external_define ('DownloadManager2.dll','hobbl_com_getresponseheadername',dll_stdcall,ty_string,2,ty_real,ty_real);
    global.external_dm_getresponseheadervalue = external_define ('DownloadManager2.dll','hobbl_com_getresponseheadervalue',dll_stdcall,ty_string,2,ty_real,ty_real);
    global.external_dm_setrange = external_define ('DownloadManager2.dll','hobbl_com_setrange',dll_stdcall,ty_real,3,ty_real,ty_real,ty_real);
    global.external_dm_setheader = external_define ('DownloadManager2.dll','hobbl_com_setheader',dll_stdcall,ty_real,3,ty_real,ty_string,ty_string);
    global.external_dm_addcookie = external_define ('DownloadManager2.dll','hobbl_com_addcookie',dll_stdcall,ty_real,3,ty_real,ty_string,ty_string);
    global.external_dm_setproxy = external_define ('DownloadManager2.dll','hobbl_com_setproxy',dll_stdcall,ty_real,3,ty_real,ty_string,ty_real);
    global.external_dm_addsubproxy = external_define ('DownloadManager2.dll','hobbl_com_addsubproxy',dll_stdcall,ty_real,3,ty_real,ty_string,ty_real);
    
    DmStatusFailed      = -1;
    DmStatusInvalid      = 0;
    DmStatusReady		= 1; 
    DmStatusDownloading	= 2;
    DmStatusCompleted	= 3; 
    DmStatusPaused	= 4;
    DmStatusStopped	= 5; 
    DmStatusInterrupted	= 6; 
#define DM_CreateDownload
    return external_call(global.external_dm_createdownload,argument0,argument1);
#define DM_CreateHandle
    return external_call(global.external_dm_createhandle);
#define DM_OpenDownload
    return external_call(global.external_dm_opendownload,argument0,argument1,argument2);
#define DM_GetResponse
    return external_call(global.external_dm_getresponse,argument0);
#define DM_StartDownload
    return external_call(global.external_dm_startdownload,argument0);
#define DM_StopDownload
    return external_call(global.external_dm_stopdownload,argument0);
#define DM_PauseDownload
    return external_call(global.external_dm_pausedownload,argument0);
#define DM_ResumeDownload
    return external_call(global.external_dm_resumedownload,argument0);
#define DM_CloseDownload
    return external_call(global.external_dm_closedownload,argument0);
#define DM_GetSpeed
    return external_call(global.external_dm_getspeed,argument0);
#define DM_GetProgress
    return external_call(global.external_dm_getprogress,argument0);
#define DM_DownloadStatus
    return external_call(global.external_dm_downloadstatus,argument0);
#define DM_GetContentType
    return external_call (global.external_dm_getcontenttype,argument0);
#define DM_GetCompleted
    return external_call (global.external_dm_getcompleted,argument0);
#define DM_GetLength
    return external_call (global.external_dm_getlength,argument0);
#define DM_GetResponseHeader
    return external_call (global.external_dm_getresponseheader,argument0,argument1); 
#define DM_GetResponseHeaders
    return external_call (global.external_dm_getresponseheaders,argument0); 
#define DM_GetResponseHeaderName
    return external_call (global.external_dm_getresponseheadername,argument0,argument1); 
#define DM_GetResponseHeaderValue
    return external_call (global.external_dm_getresponseheadervalue,argument0,argument1); 
#define DM_SetRange
    return external_call (global.external_dm_setrange,argument0,argument1,argument2); 
#define DM_SetHeader
    return external_call (global.external_dm_setheader,argument0,argument1,argument2); 
#define DM_AddCookie
    return external_call (global.external_dm_addcookie,argument0,argument1,argument2); 
#define DM_SetProxy
    return external_call (global.external_dm_setproxy,argument0,argument1,argument2); 
#define DM_AddSubProxy
    return external_call (global.external_dm_addsubproxy,argument0,argument1,argument2); 
#define GMZ_FileAdd
//argument0: zip index
//argument1: filename in zip.
//argument2: source filename.

return external_call(global.GMZ_fileadd,argument0,argument1,argument2)
#define GMZ_FolderAdd
//argument0: zip index
//argument1: folder name.

return external_call(global.GMZ_folderadd,argument0,argument1)
#define GMZ_ExtractAll
//argument0: zip index
//Extracts to Dll directory

return external_call(global.GMZ_fileextractall,argument0)
#define GMZ_ExtractPos
//argument0: zip index
//argument1: extract file at position.
//Extracts to Dll directory

return external_call(global.GMZ_fileextractpos,argument0,argument1)
#define GMZ_ExtractName
//argument0: zip index
//argument1: extract file with name.
//Extracts to Dll directory

return external_call(global.GMZ_fileextractname,argument0,argument1)
#define GMZ_GetCount
//returns how many files contained within the zip
//argument0: zip index

return external_call(global.GMZ_filegetcount,argument0)
#define GMZ_GetName
//argument0: zip index
//argument1: position
//returns: name of file at position.

return external_call(global.GMZ_filegetname,argument0,argument1)
#define GMZ_GetPos
//argument0: zip index
//argument1: name
//returns: position of file with name

return external_call(global.GMZ_filegetpos,argument0,argument1)
#define GMZ_GetSize
//argument0: zip index
//argument1: pos
//returns: returns extracted file size 

return external_call(global.GMZ_filegetsize,argument0,argument1)
#define GMZ_GetCsize
//argument0: zip index
//argument1: pos
//returns: returns compressed file size 

return external_call(global.GMZ_filegetcsize,argument0,argument1)
#define GMZ_ZipOpen
//argument0: file
//argument1: password
//returns: zip index.

return external_call(global.GMZ_zipopen,argument0,argument1)
#define GMZ_ZipCreate
//argument0: filename
//argument1: password
//returns: zip index.

return external_call(global.GMZ_zipcreate,argument0,argument1)
#define GMZ_ZipClose
//argument0: zip index

return external_call(global.GMZ_zipclose,argument0)
#define GMZ_Init
//argument0: Alternative Dll Filename, leave blank for default

global.GMZ_dll = "GMZ.dll"
if is_string(argument0){
    global.GMZ_dll = argument0;
    }

if file_exists(global.GMZ_dll){
    global.GMZ_zipopen = external_define(global.GMZ_dll,"gmz_zip_open",dll_stdcall,ty_real,2,ty_string,ty_string);
    global.GMZ_zipcreate = external_define(global.GMZ_dll,"gmz_zip_create",dll_stdcall,ty_real,2,ty_string,ty_string);
    global.GMZ_zipclose = external_define(global.GMZ_dll,"gmz_zip_close",dll_stdcall,ty_real,1,ty_real);
    
    global.GMZ_fileadd = external_define(global.GMZ_dll,"gmz_file_add",dll_stdcall,ty_real,3,ty_real,ty_string,ty_string);
    global.GMZ_folderadd = external_define(global.GMZ_dll,"gmz_folder_add",dll_stdcall,ty_real,2,ty_real,ty_string);
    
    global.GMZ_fileextractall = external_define(global.GMZ_dll,"gmz_file_extract_all",dll_stdcall,ty_real,1,ty_real);
    global.GMZ_fileextractpos = external_define(global.GMZ_dll,"gmz_file_extract_pos",dll_stdcall,ty_real,2,ty_real,ty_real);
    global.GMZ_fileextractname = external_define(global.GMZ_dll,"gmz_file_extract_name",dll_stdcall,ty_real,2,ty_real,ty_string);
    
    global.GMZ_filegetcount = external_define(global.GMZ_dll,"gmz_file_get_count",dll_stdcall,ty_real,1,ty_real);
    global.GMZ_filegetpos = external_define(global.GMZ_dll,"gmz_file_get_pos",dll_stdcall,ty_real,2,ty_real,ty_string);
    global.GMZ_filegetname = external_define(global.GMZ_dll,"gmz_file_get_name",dll_stdcall,ty_string,2,ty_real,ty_real);
    global.GMZ_filegetsize = external_define(global.GMZ_dll,"gmz_file_get_size",dll_stdcall,ty_real,2,ty_real,ty_real);
    global.GMZ_filegetcsize = external_define(global.GMZ_dll,"gmz_file_get_csize",dll_stdcall,ty_real,2,ty_real,ty_real);
    }
else{show_error("Could not locate "+global.GMZ_dll,1)}
#define download
url = argument0; 
name = filename_name(string_replace_all(url, '/', '\'));
path = argument1;
task = DM_CreateDownload(url, path + string(name));
if (task = 0)
{
    show_message ('Не могу найти ' + string(name)); 
    exit;
}
DM_StartDownload(task);
sleep(1); // Без этой строчки нbчего не работает.

#define check_version
if (current_version != ds_list_find_value(version_list, ds_list_size(version_list) - 1))
{
    ver = ds_list_find_value(version_list, ds_list_find_index(version_list, current_version) + 1);
    show_message('Доступно обновление ' + string(ver) + '!');
    download('ССЫЛКА' + string(ver) + '.zip', 'NewVersion/');
}
else
{
    show_message('FireWare - AutoUpdater заметил, что обновление ненужно.');
    break;
}

#define load_version
var file;
file = file_text_open_read('current_version.txt'); // Узнаем текущую версию клиента
current_version = file_text_read_string(file);
file_text_close(file);

