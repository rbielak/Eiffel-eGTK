-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class PACKING

inherit

	GTK_APPLICATION
	
	EGTK_SHARED_TOOLTIPS

creation

	make

feature

	make is
		do
			initialize_tool_kit
			set_up_widgets
			main_loop
		end

	window: GTK_WINDOW
	button1, button2: GTK_BUTTON
	box: GTK_BOX

	cmd1: B1_COMMAND
	cmd2: B2_COMMAND
	quit: QUIT_COMMAND

	set_up_widgets is
		do
			-- first the window
			!!window.make_top_level
			window.set_title ("Packing")
			!!quit.make (window)
			window.set_border_width (10)
			-- then the box
			!!box.make_horizontal (False, 2)
			window.add_widget (box)
			-- then the buttons
			!!button1.make_with_label ("Button1")
			button1.set_tool_tip ("This is button 1")
			box.pack (button1, True, True, 1)
			!!cmd1
			-- cmd1.connect ("clicked", button1)
			button1.add_action ("clicked", cmd1)
			!!button2.make_with_label ("Button2")
			button2.set_tool_tip ("This is button 2")
			box.pack (button2, True, True, 1)
			!!cmd2
			-- cmd2.connect ("clicked", button2)
			button2.add_action ("clicked", cmd2)
			-- show all widgetss
			button1.show
			button2.show
			box.show
			window.show
		end


end
