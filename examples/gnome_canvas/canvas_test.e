class CANVAS_TEST

inherit 

	GNOME_APPLICATION
	GTK_MAIN
	GTK_CONSTANTS;
   
creation {ANY} 
   make

feature {ANY} 
   
   window: GTK_WINDOW;
   
   make is 
      do  
         initialize_gnome ("e_test", "v0.1");
         build_widgets;
         main_loop;
      end -- make
   
   build_widgets is 
      local 
         hbox, vbox: GTK_BOX;
         scrolled_window: GTK_SCROLLED_WINDOW;
         d_area: GTK_DRAWING_AREA;
         quit: EGTK_QUIT_COMMAND;
         cmd: GTK_COMMAND;
         gcmd: GDK_EVENT_COMMAND;
         root_canvas: GNOME_CANVAS;
         canvas_item: GNOME_CANVAS_ITEM;
         root_canvas_group, canvas_group, another_group: GNOME_CANVAS_GROUP;
         canvas_text: GNOME_CANVAS_TEXT;
         line_item: GNOME_CANVAS_LINE;
         points: ARRAY[DOUBLE];
      do  
         !!window.make_top_level;
         window.set_title("Drawing example");
         !!quit;
         window.add_action("delete_event",quit);
         !!hbox.make_vertical(false,1);
         window.add_widget(hbox);
         window.set_size(600,400);
         window.set_position(20,20);
            --draw_background
            -- make a scrolled region
         !!scrolled_window.make;
         scrolled_window.set_border_width(10);
         scrolled_window.set_policy(GTK_POLICY_ALWAYS,GTK_POLICY_ALWAYS);
         hbox.pack(scrolled_window,true,true,0);
            --	make_zoom_button(hbox)
         window.show_all;
            --needs to be done BEFORE the canvas. (why?)
         !!root_canvas.make_as_aa;
         root_canvas.set_scroll_region(0,0,200,200);
         root_canvas.set_pixels_per_units(1);
         scrolled_window.add_widget_with_viewport(root_canvas);
            --group
         !!root_canvas_group.make_as_root(root_canvas);
         !!canvas_group.make(root_canvas_group);
            --events
         !ON_GNOME_CANVAS_ITEM_EVENT!gcmd;
            --  another_group.add_action("event",gcmd);
            --!ON_GNOME_CANVAS_EVENT!gcmd;
            --widget (button) canvas item
         !!canvas_group.make(root_canvas_group);
         make_widget(canvas_group);
         attach_move_behavior(canvas_group);
            --text canvas item
         !!canvas_group.make(root_canvas_group);
         make_text(canvas_group);
         attach_move_behavior(canvas_group);
            --line item 
         !!canvas_group.make(root_canvas_group);
         make_line(canvas_group);
         attach_move_behavior(canvas_group);
            --rectangle item
         !!canvas_group.make(root_canvas_group);
         make_rectangle(canvas_group);
         attach_move_behavior(canvas_group);
            --
         make_zoom_button(hbox,root_canvas);
         window.show_all;
      end -- build_widgets
   
   make_rectangle(canvas_group: GNOME_CANVAS_GROUP) is 
      local 
         canvas_item: GNOME_CANVAS_ITEM;
      do  
         !!canvas_item.make(canvas_group);
            --decoration attributes
         canvas_item.set_outline_color("black");
         canvas_item.set_fill_color_rgba(1018392960);
            --canvas_item.set_fill_color("red");
         canvas_item.set_outline_width_units(1);
         canvas_item.set_position(50,20);
         canvas_item.set_size(30,30);
      end -- make_rectangle
   
   make_text(canvas_group: GNOME_CANVAS_GROUP) is 
      local 
         canvas_text: GNOME_CANVAS_TEXT;
      do  
         !!canvas_text.make(canvas_group);
         canvas_text.set_text("hello");
         canvas_text.set_position(5,5);
         canvas_text.set_fill_color("red");
      end -- make_text
   
   make_line(group: GNOME_CANVAS_GROUP) is 
      local 
         points: ARRAY[DOUBLE];
         line_item: GNOME_CANVAS_LINE;
      do  
         !!points.make(1,6);
         points.force(10,1);
         points.force(10,2);
         points.force(70,3);
         points.force(71,4);
         points.force(100,5);
         points.force(150,6);
         !!line_item.make_with_points(group,points);
         line_item.set_fill_color("red");
         line_item.set_width_units(1.0);
         line_item.set_arrowhead_width(5);
         line_item.set_arrowhead_length(10);
         line_item.set_arrowhead_edges(15);
         line_item.set_arrowhead_first(true);
         line_item.set_arrowhead_last(true);
            --smooth seems no effect
         line_item.set_smooth(true);
         line_item.set_spline_steps(5);
      end -- make_line
   
   make_widget(canvas_group: GNOME_CANVAS_GROUP) is 
      local 
         button: GTK_BUTTON;
         text_label: GTK_LABEL;
         canvas_widget: GNOME_CANVAS_WIDGET;
      do  
         !!button.make_with_label("Hello World!");
            --    !!text_label.make("hello la belle!");
            --         window.show_all;
         !!canvas_widget.make(canvas_group);
         canvas_widget.add_widget(button);
            --    canvas_widget.add_widget(text_label);
         canvas_widget.set_position(90,90);
            --probably a bug around
            -- need a hide/show, if not the widget doesnt display		
            --    canvas_widget.hide;
            --    canvas_widget.show;
            --   canvas_widget.set_size(50,50);
            --canvas_widget.set_otuline_color("black");
            --	 button.show
            --    text_label.show;
         
      end -- make_widget
   
   attach_move_behavior(group: GNOME_CANVAS_GROUP) is 
      local 
         gcmd: GDK_EVENT_COMMAND;
      do  
         !ON_GNOME_CANVAS_ITEM_EVENT!gcmd;
         group.add_action("event",gcmd);
      end -- attach_move_behavior
   
   make_zoom_button(parent: GTK_BOX; root_canvas: GNOME_CANVAS) is 
      local 
         hbox: GTK_BOX;
         button: GTK_BUTTON;
         zoom_cmd: ON_ZOOM;
      do  
         !!hbox.make_horizontal(true,2);
         parent.pack(hbox,false,true,1);
         !!zoom_cmd.make(root_canvas,0.5);
         !!button.make_with_label("x0.5");
         button.add_action("clicked",zoom_cmd);
         hbox.pack(button,false,true,1);
         !!button.make_with_label("x1");
         hbox.pack(button,false,true,1);
         !!zoom_cmd.make(root_canvas,1);
         button.add_action("clicked",zoom_cmd);
         !!button.make_with_label("x3");
         hbox.pack(button,false,true,1);
         !!zoom_cmd.make(root_canvas,3);
         button.add_action("clicked",zoom_cmd);
      end -- make_zoom_button

end -- class CANVAS_TEST
