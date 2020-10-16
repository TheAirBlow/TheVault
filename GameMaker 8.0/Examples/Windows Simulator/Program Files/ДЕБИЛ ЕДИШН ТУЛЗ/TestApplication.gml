with(win_window_create(-1,-1,600,400))
  {
  win_control_set_sprite(id,global.Win_SprIcon_TestApplication);
  win_control_set_text(id,"При ло ж ка    ту пос ти");
  win_window_set_minimize_show(id,1);
  win_window_set_maximize_show(id,1);
  win_window_set_close_show(id,1);
  win_window_set_sizeable(id,1);
  win_control_set_color(id,global.Win_C_WindowBackground);

  MenuBar=win_menubar_create(id);
    MenuBar.Menu_File=win_menu_create();
    MenuBar.Menu_File_New=win_menu_item_add(MenuBar.Menu_File,"New...");
      win_menu_item_set_hotkeytext(MenuBar.Menu_File,MenuBar.Menu_File_New,"Ctrl+N");
    win_menu_separator_add(MenuBar.Menu_File);
    MenuBar.Menu_File_Open=win_menu_item_add(MenuBar.Menu_File,"Open...");
      win_menu_item_set_hotkeytext(MenuBar.Menu_File,MenuBar.Menu_File_Open,"Ctrl+O");
    win_menu_separator_add(MenuBar.Menu_File);
    MenuBar.Menu_File_Save=win_menu_item_add(MenuBar.Menu_File,"Save");
      win_menu_item_set_hotkeytext(MenuBar.Menu_File,MenuBar.Menu_File_Save,"Ctrl+S");
    MenuBar.Menu_File_SaveAs=win_menu_item_add(MenuBar.Menu_File,"Save As...");
    win_menu_separator_add(MenuBar.Menu_File);
    MenuBar.Menu_File_Exit=win_menu_item_add(MenuBar.Menu_File,"Exit");
      win_menu_item_set_hotkeytext(MenuBar.Menu_File,MenuBar.Menu_File_Exit,"Alt+F4");
    win_menubar_menu_add(MenuBar,"File",MenuBar.Menu_File);
  
    MenuBar.Menu_Edit=win_menu_create();
    MenuBar.Menu_Edit_Undo=win_menu_item_add(MenuBar.Menu_Edit,"Undo");
      win_menu_item_set_hotkeytext(MenuBar.Menu_Edit,MenuBar.Menu_Edit_Undo,"Ctrl+Z");
    MenuBar.Menu_Edit_Redo=win_menu_item_add(MenuBar.Menu_Edit,"Redo");
      win_menu_item_set_hotkeytext(MenuBar.Menu_Edit,MenuBar.Menu_Edit_Redo,"Ctrl+Y");
    win_menu_separator_add(MenuBar.Menu_Edit);
    MenuBar.Menu_Edit_Cut=win_menu_item_add(MenuBar.Menu_Edit,"Cut");
      win_menu_item_set_hotkeytext(MenuBar.Menu_Edit,MenuBar.Menu_Edit_Cut,"Ctrl+X");
    MenuBar.Menu_Edit_Copy=win_menu_item_add(MenuBar.Menu_Edit,"Copy");
      win_menu_item_set_hotkeytext(MenuBar.Menu_Edit,MenuBar.Menu_Edit_Copy,"Ctrl+C");
    MenuBar.Menu_Edit_Paste=win_menu_item_add(MenuBar.Menu_Edit,"Paste");
      win_menu_item_set_hotkeytext(MenuBar.Menu_Edit,MenuBar.Menu_Edit_Paste,"Ctrl+V");
    win_menu_separator_add(MenuBar.Menu_Edit);
    win_menubar_menu_add(MenuBar,"Edit",MenuBar.Menu_Edit);
  
    MenuBar.Menu_Generate=win_menu_create();
    MenuBar.Menu_Generate_Water=win_menu_item_add(MenuBar.Menu_Generate,"Water");
    win_menu_separator_add(MenuBar.Menu_Generate);
    win_menubar_menu_add(MenuBar,"Generate",MenuBar.Menu_Generate);
  
    MenuBar.Menu_Settings=win_menu_create();
    MenuBar.Menu_Settings_X=win_menu_item_add(MenuBar.Menu_Settings,"X");
    win_menubar_menu_add(MenuBar,"Settings",MenuBar.Menu_Settings);
  
    MenuBar.Menu_Help=win_menu_create();
    MenuBar.Menu_Help_Help=win_menu_item_add(MenuBar.Menu_Help,"Help Topics");
      win_menu_item_set_hotkeytext(MenuBar.Menu_Help,MenuBar.Menu_Help_Help,"F1");
    win_menu_separator_add(MenuBar.Menu_Help);
	MenuBar.Menu_Help_Info=win_menu_item_add(MenuBar.Menu_Help,"Info");
    win_menubar_menu_add(MenuBar,"Help",MenuBar.Menu_Help);
  
  ToolBar=win_toolbar_create(id);
    ToolBar.Btn_New=win_toolbar_button_add(ToolBar,global.Win_SprIcon_New);
    ToolBar.Btn_Open=win_toolbar_button_add(ToolBar,global.Win_SprIcon_Open);
    ToolBar.Btn_Save=win_toolbar_button_add(ToolBar,global.Win_SprIcon_Save);
    win_toolbar_separator_add(ToolBar);
    ToolBar.Btn_Undo=win_toolbar_button_add(ToolBar,global.Win_SprIcon_Undo);
    ToolBar.Btn_Redo=win_toolbar_button_add(ToolBar,global.Win_SprIcon_Redo);
  }