global.Win_RegUser = "ƒ≈¡»À"
global.Win_RegCompany = "timine group for debils tm"
with(win_window_create(-1,-1,sprite_get_width(global.Win_SprWindowsInfo)+6,329))
  {
  win_control_set_text(id,"About Windows");
  win_window_set_close_show(id,1);

  win_sprite_create(id,0,0,global.Win_SprWindowsInfo);
  win_text_create(id,100,75,200,150,global.Win_WinName+"#Version "+global.Win_WinVer+"#2009, 2010 RobinT##This software is registered to:##    "+global.Win_RegUser+"#    "+global.Win_RegCompany);

  with(win_button_create(id,335,275,75,23))
    {
    win_control_set_text(id,"OK");
    win_button_set_executecode(id,"with(Parent){instance_destroy();}");
    win_button_set_default(id,1);
    }
  }