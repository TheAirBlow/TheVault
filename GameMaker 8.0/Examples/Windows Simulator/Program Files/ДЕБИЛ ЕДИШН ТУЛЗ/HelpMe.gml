with(win_window_create(-1,-1,600,400))
  {
  var i;

  win_control_set_sprite(id,global.Win_SprIcon_Help);
  win_control_set_text(id,"онлнцхре акхм!");
  win_window_set_minimize_show(id,1);
  win_window_set_maximize_show(id,1);
  win_window_set_close_show(id,1);
  win_window_set_sizeable(id,1);

  Btn_Back=win_button_create(id,2,2,30,30);
    Btn_Back.HideButton=1;
    win_control_set_sprite(Btn_Back,global.Win_SprBack);
    Btn_Back.AutoStateSpriteSubImage=1;

  Btn_Forward=win_button_create(id,32,2,30,30);
    Btn_Forward.HideButton=1;
    win_control_set_sprite(Btn_Forward,global.Win_SprForward);
    Btn_Forward.AutoStateSpriteSubImage=1;

  List=win_listbox_create(id,0,34,150,noone);
    win_control_set_anchor_bottom(List,1,0);

  TextBox=win_text_create(id,160,10,noone,noone,noone);
    win_control_set_anchor_right(TextBox,1,0);
    win_control_set_anchor_bottom(TextBox,1,0);
    win_control_set_texthalign(TextBox,0);
    win_control_set_textvalign(TextBox,0);

  execute_file(global.Win_SysDir+"help\index.gml");
  
  for(i=0;i<TotalSections;i+=1;)
    {
    win_listbox_item_add(List,Section[i]);
    }

  CurrentSection=-1;
  win_control_set_event(id,global.Win_Ev_Step,
    "
    i=win_control_get_selected(List);
    if(CurrentSection!=i)
      {
      win_control_set_text(TextBox,execute_file(global.Win_SysDir+'help\'+Section[i]+'.gml'));
      CurrentSection=i;
      }
    ");
  }