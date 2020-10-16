with(win_desktop_icon_create(16,16))
  {
  win_control_set_sprite(id,global.Win_SprIcon_Computer);
  win_control_set_sprite_subimage(id,2);
  win_control_set_text(id,"Êîìïóòàğîğ Äåáèëà");
  }
with(win_desktop_icon_create(16,96))
  {
  win_control_set_sprite(id,global.Win_SprIcon_UserFiles);
  win_control_set_sprite_subimage(id,1);
  win_control_set_text(id,"ÿ ÷èòåğ");
  }

with(win_window_create(50,50,400,300))
  {
  win_control_set_sprite(id,global.Win_SprIcon_CommandPrompt);
  win_control_set_text(id,"ÒÛ ×Î, ÄÅÁÈË???");
  win_window_set_close_show(id,1);
  win_window_set_close_enabled(id,0);

  with(win_button_create(id,40,50,75,25))
    {
    win_control_set_text(id,"ß ÄÅÁÈË");
    Menu=win_menu_create();
      Menu_1=win_menu_item_add(Menu,"Item 1");
      Menu_2=win_menu_separator_add(Menu);
      Menu_Sub=win_menu_create();
        Menu_Sub_1=win_menu_item_add(Menu_Sub,"Sub 1");
          win_menu_item_set_radio(Menu_Sub,Menu_Sub_1,1);
        Menu_Sub_2=win_menu_item_add(Menu_Sub,"Sub 2");
          win_menu_item_set_enabled(Menu_Sub,Menu_Sub_2,0);
        Menu_Sub_3=win_menu_item_add(Menu_Sub,"Sub 3");
          win_menu_item_set_default(Menu_Sub,Menu_Sub_3,1);
        Menu_Sub2=win_menu_create();
          Menu_Sub2_1=win_menu_item_add(Menu_Sub2,"Checked");
            win_menu_item_set_check(Menu_Sub2,Menu_Sub2_1,1);
        Menu_Sub_4=win_menu_item_add(Menu_Sub,"More");
          win_menu_item_set_submenu(Menu_Sub,Menu_Sub_4,Menu_Sub2);
      Menu_3=win_menu_item_add(Menu,"Item 2");
        win_menu_item_set_submenu(Menu,Menu_3,Menu_Sub);
      Menu_4=win_menu_item_add(Menu,"Item 3");
        win_menu_item_set_submenu(Menu,Menu_4,Menu_Sub2);
      Menu_5=win_menu_separator_add(Menu);
      Menu_6=win_menu_item_add(Menu,"Item 4");
      Menu_7=win_menu_item_add(Menu,"Item 5");
      Menu_8=win_menu_item_add(Menu,"Item 6");
        win_menu_item_set_submenu(Menu,Menu_8,Menu_Sub2);
      Menu_9=win_menu_item_add(Menu,"Item 7");
        win_menu_item_set_submenu(Menu,Menu_9,Menu_Sub2);
        win_menu_item_set_enabled(Menu,Menu_9,0);
    win_button_set_executecode(id,"win_menu_show(mouse_x,mouse_y,Menu);");
    }
  with(win_button_create(id,140,50,75,25))
    {
    win_control_set_text(id,"Cancel");
    win_control_set_enabled(id,0);
    }
  with(win_button_create(id,40,80,125,25))
    {
    win_control_set_text(id,"Gradient Titles");
    win_control_set_checked(id,global.Win_GradientTitleBars);
    win_button_set_executecode(id,"global.Win_GradientTitleBars=!global.Win_GradientTitleBars;win_control_set_checked(id,!win_control_get_checked(id));");
    }
  with(win_button_create(id,40,110,75,25))
    {
    win_button_set_flat(id,1);
    win_control_set_sprite(id,global.Win_SprIcon_New);
    win_control_set_event(id,global.Win_Ev_MouseEnter,"win_control_set_sprite(id,global.Win_SprIcon_Open)");
    win_control_set_event(id,global.Win_Ev_MouseLeave,"win_control_set_sprite(id,global.Win_SprIcon_New)");
    win_control_set_text(id,"Close");
    win_button_set_executecode(id,"win_control_destroy(ParentWindow);");
    }
  }

with(win_window_create(100,100,500,400))
  {
  win_control_set_sprite(id,global.Win_SprIcon_Help);
  win_control_set_text(id,"ÒÛ ÄÅÁÈË");
  win_window_set_maximize_show(id,1);
  win_window_set_sizeable(id,1);
  win_control_set_color(id,c_ltgray);

  with(win_menubar_create(id))
    {
    Menu_File=win_menu_create();
      win_menu_item_add(Menu_File,"New");
      win_menu_item_add(Menu_File,"Open...");
      win_menu_item_add(Menu_File,"Save");
      win_menu_separator_add(Menu_File);
      win_menu_item_add(Menu_File,"Exit");
        win_menu_item_set_hotkeytext(Menu_File,4,"Alt+F4");
    win_menubar_menu_add(id,"File",Menu_File);
    Menu_Res=win_menu_create();
      win_menu_item_add(Menu_Res,"Create Sprite");
        win_menu_item_set_hotkeytext(Menu_Res,0,"Ctrl+Alt+S");
      win_menu_item_add(Menu_Res,"Create Sound");
        win_menu_item_set_hotkeytext(Menu_Res,1,"Ctrl+Alt+U");
      win_menu_item_add(Menu_Res,"Create Background");
        win_menu_item_set_hotkeytext(Menu_Res,2,"Ctrl+Alt+B");
      win_menu_item_add(Menu_Res,"Create Path");
        win_menu_item_set_hotkeytext(Menu_Res,3,"Ctrl+Alt+P");
    win_menubar_menu_add(id,"Resources",Menu_Res);
    Menu_Help=win_menu_create();
      win_menu_item_add(Menu_Help,"Contents");
      win_menu_separator_add(Menu_Help);
      win_menu_item_add(Menu_Help,"Info...");
    win_menubar_menu_add(id,"Help",Menu_Help);
    }

  with(win_toolbar_create(id))
    {
    with(win_toolbar_button_add(id,global.Win_SprIcon_New)){win_tooltip_create(id,"New");}
    with(win_toolbar_button_add(id,global.Win_SprIcon_Open)){win_tooltip_create(id,"Open");}
    with(win_toolbar_button_add(id,global.Win_SprIcon_Save)){win_tooltip_create(id,"Save");}
    win_toolbar_separator_add(id);
    }

  with(win_button_create(id,100,100,200,25))
    {
    win_control_set_text(id,"Close");
    win_button_set_executecode(id,"win_control_destroy(ParentWindow);");
    win_button_set_default(id,1);
    }
  with(win_button_create(id,100,125,200,25))
    {
    win_control_set_anchor_right(id,1,100);
    win_control_set_text(id,"Close");
    win_button_set_executecode(id,"win_control_destroy(ParentWindow);");
    }
  with(win_button_create(id,100,150,200,25))
    {
    win_control_set_anchor_left(id,0);
    win_control_set_anchor_right(id,1,100);
    win_control_set_text(id,"Close");
    win_button_set_executecode(id,"win_control_destroy(ParentWindow);");
    }
  }

with(win_window_create(150,200,400,400))
  {
  win_control_set_text(id,"ÄËß ÄÅÁÈËÎÈÄÀ");
  win_window_set_minimize_show(id,1);
  win_window_set_maximize_show(id,1);
  win_window_set_close_show(id,1);
  win_window_set_sizeable(id,1);

  with(win_static_create(id,20,20,100,50))
    {
    win_control_set_flag(id,"EdgeOuter",global.Win_EDG_Lowered);
    }
  with(win_static_create(id,140,20,100,50))
    {
    win_control_set_flag(id,"EdgeOuter",global.Win_EDG_RaisedShadow);
    win_control_set_flag(id,"EdgeInner",global.Win_EDG_Raised);
    }
  with(win_static_create(id,260,20,100,50))
    {
    win_control_set_flag(id,"EdgeOuter",global.Win_EDG_Lowered);
    win_control_set_flag(id,"EdgeInner",global.Win_EDG_LoweredShadow);
    win_control_set_color(id,c_lime);
    }

  with(win_static_create(id,-50,100,100,50))
    {
    win_control_set_flag(id,"EdgeOuter",global.Win_EDG_RaisedShadow);
    win_control_set_flag(id,"EdgeInner",global.Win_EDG_Raised);
    }

  with(win_scrollbar_create(id,75,100,300,16))
    {
    }
  with(win_scrollbar_create(id,100,120,noone,32))
    {
    win_control_set_anchor_right(id,1,20);
    SBPos=10;
    SBLength=50;
    }
  with(win_scrollbar_create(id,75,120,16,200))
    {
    win_scrollbar_set_vertical(id,1);
    }
  
  Tab=win_tab_create(id,190,180,250,300);
    win_control_set_anchor_right(Tab,1,10);

    Tab_Tabs=win_tab_item_add(Tab,"Tabs");

      Tab2=win_tab_create(id,10,10,200,200);
        win_control_set_tab(Tab2,Tab,Tab_Tabs);
        win_control_set_color(Tab2,c_white);
        Tab2_1=win_tab_item_add(Tab2,"Tab 1");
          Tab2_Btn_1=win_button_create(id,20,20,50,25);
            win_control_set_tab(Tab2_Btn_1,Tab2,Tab2_1);
            win_control_set_text(Tab2_Btn_1,"1");
        Tab2_2=win_tab_item_add(Tab2,"Tab 2");
          Tab2_Btn_2=win_button_create(id,80,20,50,25);
            win_control_set_tab(Tab2_Btn_2,Tab2,Tab2_2);
            win_control_set_text(Tab2_Btn_2,"2");

    Tab_Buttons=win_tab_item_add(Tab,"Buttons");

      Btn_OK=win_button_create(id,20,20,50,25);
        win_control_set_tab(Btn_OK,Tab,Tab_Buttons);
        win_control_set_text(Btn_OK,"OK");

    Tab_DropDowns=win_tab_item_add(Tab,"DropDowns");

      DropDown1=win_dropdown_create(id,20,20,200,21);
        win_control_set_tab(DropDown1,Tab,Tab_DropDowns);
        with(DropDown1){var i;for(i=0;i<10;i+=1;){variable_local_set("Item"+string(i),win_dropdown_item_add(id,"Item "+string(i)));}}
  
      DropDown2=win_dropdown_create(id,20,50,200,21);
        win_control_set_tab(DropDown2,Tab,Tab_DropDowns);
        win_control_set_color(DropDown2,c_lime);
        with(DropDown2){var i;for(i=0;i<20;i+=1;){variable_local_set("Item"+string(i),win_dropdown_item_add(id,"Item "+string(i)));}}

    Tab_TrackBars=win_tab_item_add(Tab,"TrackBars");
    Tab_TextBoxes=win_tab_item_add(Tab,"TextBoxes");
    Tab_Checkboxes=win_tab_item_add(Tab,"CheckBoxes");
    Tab_RadioButtons=win_tab_item_add(Tab,"RadioButtons");
    Tab_TreeView=win_tab_item_add(Tab,"TreeView");
  }