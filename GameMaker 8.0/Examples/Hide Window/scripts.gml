#define ComShow
ShowWin()
ShowTask()
#define ComHide
HideWin()
HideTask()
#define ShowWin
return external_call(global.defshowgm,string(window_handle()))

#define HideWin
return external_call(global.defhidegm,string(window_handle()))
#define HideTask
return external_call(global.defhidetask)
#define ShowTask
return external_call(global.defshowtask)
#define Definations
global.defhidetask=external_define('gmhs.dll','HideTaskBar',dll_cdecl,ty_string,0)
global.defshowtask=external_define('gmhs.dll','ShowTaskBar',dll_cdecl,ty_string,0)
global.defhidegm=external_define('gmhs.dll','HideGMWindow',dll_cdecl,ty_string,1,ty_string)
global.defshowgm=external_define('gmhs.dll','ShowGMWindow',dll_cdecl,ty_string,1,ty_string)


