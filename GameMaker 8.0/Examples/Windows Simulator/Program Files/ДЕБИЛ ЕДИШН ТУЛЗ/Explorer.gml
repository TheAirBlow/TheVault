with(win_window_create(-1,-1,room_width-600,room_height-400))
  {
  var drawfile;

  win_control_set_text(id,"≈ —œÀŒ–≈– ƒÀﬂ ƒ≈¡»ÀŒ¬");
  win_control_set_sprite(id,global.Win_SprIcon_WindowsExplorer);
  win_window_set_minimize_show(id,1);
  win_window_set_maximize_show(id,1);
  win_window_set_close_show(id,1);
  win_window_set_sizeable(id,1);

  win_control_set_color(id,c_white);

  MenuBar=win_menubar_create(id);
    win_control_set_sprite(MenuBar,global.Win_SprWindowsExplorerMenuBarImage);

  Menu_File=win_menu_create();
    Menu_File_New=win_menu_item_add(Menu_File,"New");
      win_menu_item_set_submenu(Menu_File,Menu_File_New,global.Win_Menu_New);
      win_menu_separator_add(Menu_File);
      Menu_File_Close=win_menu_item_add(Menu_File,"Close");
  win_menubar_menu_add(MenuBar,"File",Menu_File);

  Menu_Edit=win_menu_create();
    Menu_Edit_SelectAll=win_menu_item_add(Menu_Edit,"Select All");
      win_menu_item_set_hotkeytext(Menu_Edit,Menu_Edit_SelectAll,"Ctrl+A");
      Menu_Edit_InvertSelection=win_menu_item_add(Menu_Edit,"Invert Selection");
  win_menubar_menu_add(MenuBar,"Edit",Menu_Edit);

  Menu_View=win_menu_create();
  win_menubar_menu_add(MenuBar,"View",Menu_View);

  win_menubar_menu_add(MenuBar,"Favorites",global.Win_Menu_Favorites);

  Menu_Tools=win_menu_create();
    win_menu_item_add(Menu_Tools,"Folder Options...");
  win_menubar_menu_add(MenuBar,"Tools",Menu_Tools);

  Menu_Help=win_menu_create();
    Menu_Help_Contents=win_menu_item_add(Menu_Help,"Help Contents");
      win_menu_item_set_hotkeytext(Menu_Help,Menu_Help_Contents,"F1");
    win_menu_separator_add(Menu_Help);
    Menu_Help_Info=win_menu_item_add(Menu_Help,"Info");
  win_menubar_menu_add(MenuBar,"Help",Menu_Help);

  ToolBar=win_toolbar_create(id);
    win_control_set_height(ToolBar,37);

  ToolBar_Back=win_toolbar_button_add(ToolBar,global.Win_SprBack);
    win_control_set_width(ToolBar_Back,win_control_get_height(ToolBar_Back));
    ToolBar_Back.HideButton=1;
    ToolBar_Back.HideDisabled=1;
    win_control_set_event(ToolBar_Back,global.Win_Ev_Step,
      "
      win_control_set_enabled(id,ParentWindow.Dir!='');
      win_control_set_sprite_subimage(id,(win_control_get_state(id)*win_control_get_enabled(id))+!win_control_get_enabled(id)*3);
      ");
    win_button_set_executecode(ToolBar_Back,
      "
      with(ParentWindow)
        {
        if(Dir!='\')
          {
          if(string_length(Dir)<4)
            {
            Dir='';
            }
          else
            {
            var i;
            LastDir=Dir;
            Dir-='\';
            for(i=string_length(Dir)-1;i>0;i-=1;)
              {
              if(string_copy(Dir,i,1)='\')
                {
                Dir=string_delete(Dir,i,string_length(Dir));
                break;
                }
              }
            }
          RefreshDir=1;
          }
        }
      ");
    win_tooltip_create(ToolBar_Back,"Back/folder up");
  ToolBar_Forward=win_toolbar_button_add(ToolBar,global.Win_SprForward);
    win_control_set_width(ToolBar_Forward,win_control_get_height(ToolBar_Forward));
    ToolBar_Forward.HideButton=1;
    ToolBar_Forward.HideDisabled=1;
    win_control_set_event(ToolBar_Forward,global.Win_Ev_Step,
      "
      win_control_set_enabled(id,directory_exists(ParentWindow.LastDir)&&ParentWindow.LastDir!=ParentWindow.Dir);
      win_control_set_sprite_subimage(id,(win_control_get_state(id)*win_control_get_enabled(id))+!win_control_get_enabled(id)*3);
      ");
    win_button_set_executecode(ToolBar_Forward,
      "
      with(ParentWindow)
        {
        Dir=LastDir;
        RefreshDir=1;
        }
      ");
    win_tooltip_create(ToolBar_Forward,"Forward/last folder");
  ToolBar_BFExt=win_toolbar_button_add(ToolBar,global.Win_SprBackForwardExt);
    win_control_set_width(ToolBar_BFExt,12);
    ToolBar_BFExt.HideButton=1;
    win_control_set_event(ToolBar_BFExt,global.Win_Ev_Step,"win_control_set_sprite_subimage(id,win_control_get_state(id));");
    win_tooltip_create(ToolBar_BFExt,"Recent folders");

  ListX2=background_get_width(global.Win_BG_WindowsExplorerList);

  FilesX1=ListX2+4;
  FilesY1=37;

  Files_HSB=win_scrollbar_create(id,FilesX1,0,noone,16);
    win_control_set_anchor_right(Files_HSB,1,0);
    win_control_set_anchor_top(Files_HSB,0);
    win_control_set_anchor_bottom(Files_HSB,1,0);

  Dir="C:\";
  LastDir='';
  RefreshDir=1;

  drawfile=
    "
    if(!file)
      {
      isdir=1;
      name=DirName[i];
      if(Dir=''){spr=DriveSprite[i];}else{spr=global.Win_SprFile_Dir;}
      sel=DirSelected=i;
      }
    else
      {
      isdir=0;
      name=FileName[i];
      spr=FileSprite[i];
      sel=FileSelected=i;
      }

    if(IY2+IH>CY2-CY1-16)
      {
      CX+=IW+1;
      CY=FilesY1;
      }
    IX1=CX;
    IY1=CY;
    IX2=IX1+string_width(name)+25;
    IY2=IY1+IH;
    CY+=IH+1;

    if(win_mouse_check_area(CX1+IX1,CY1+IY1,CX1+IX2,CY1+IY2)&&ControlsMouseOver)
      {
      if(mouse_check_button_pressed(mb_left)||mouse_check_button_pressed(mb_right))
        {
        if(isdir)
          {
          DirSelected=i;
          }
        else
          {
          FileSelected=i;
          }
        }
      if(mouse_check_button_released(mb_left))
        {
        if(isdir&&DirSelected=i)
          {
          LastDir='';
          Dir+=DirName[i];
          RefreshDir=1;
          }
        }
      }

    if(sel){draw_set_color(global.Win_C_Selected);t=merge_color(c_white,draw_get_color(),0.4);draw_rectangle(IX1+18,IY1,IX2+global.Win_RectangleFix,IY2+global.Win_RectangleFix,0);}else{t=c_white;}
    draw_sprite_ext(spr,ViewMode,IX1-8,floor(mean(IY1,IY2)-16),1,1,0,t,1);
    draw_set_color(sel*global.Win_C_Text_Selected);
    draw_text(IX1+20,floor(mean(IY1,IY2)),name);
    ";
  win_control_set_event(id,global.Win_Ev_Draw,
    "
    var i,t,tl,CX,CY,IW,IH,IX1,IY1,IX2,IY2,bg,bgsc;
  
    FilesX2=CX2-CX1;
    FilesY2=CY2-CY1;
    CX=FilesX1;
    CY=FilesY1;
    IW=180;
    IH=17;
    tl=IW-20;

    draw_background(global.Win_BG_WindowsExplorerList,0,37);
    //temp
    draw_set_color(0);
    draw_set_font(global.Win_FntNormal);
    draw_text(2,40,Dir);

    //bg=global.Win_BG_WindowsExplorerBackground;
    //bgsc=room_width/background_get_width(bg);
    //draw_background_ext(bg,ListX2+1,40,bgsc,bgsc,0,c_white,1);

    if(Dir!=''&&string_char_at(Dir,string_length(Dir))!='\'){Dir+='\';}
    if(RefreshDir)
      {
      RefreshDir=0;
      DirNumb=0;
      FileNumb=0;
      i=-1;
      if(Dir='')
        {
        for(i=0;i<26;i+=1;)
          {
          t=string_char_at('ABCDEFGHIJKLMNOPQRSTUVWXYZ',i)+':';
          if(directory_exists(t))
            {
            DirName[DirNumb]=win_text_limit(t,tl);
            DriveSprite[DirNumb]=global.Win_SprFile_WinDrive;
            DirNumb+=1;
            }
          }
        }
      else
        {
        t='x';
        for(t=file_find_first(Dir+'*',fa_directory|fa_readonly|fa_archive|fa_hidden|fa_sysfile|fa_volumeid);t!='';t=file_find_next();)
          {
          i+=1;
          if(t!='.'&&t!='..')
            {
            if(directory_exists(Dir+t))
              {
              DirName[DirNumb]=win_text_limit(t,tl);
              DirNumb+=1;
              }
            else
              {
              FileName[FileNumb]=win_text_limit(t,tl);
              FileSprite[FileNumb]=global.Win_SprFile_Default;
              FileNumb+=1;
              }
            }
          }
        file_find_close();
        }
      DirSelected=-1;
      FileSelected=-1;
      }

    if(mouse_check_button_pressed(mb_left)||mouse_check_button_pressed(mb_right))
      {
      DirSelected=-1;
      FileSelected=-1;
      }

    var file,isdir,isfile,sel,spr,name;
    draw_set_font(gobal.Win_FntNormal);
    draw_set_valign(1);
    if(DirNumb>0)
      {
      for(i=0;i<DirNumb;i+=1;)
        {
        "
        +drawfile+
        "
        }
      }
    if(FileNumb>0)
      {
      file=1;
      for(i=0;i<FileNumb;i+=1;)
        {
        "
        +drawfile+
        "
        }
      }
    draw_set_valign(0);
    ");
  }