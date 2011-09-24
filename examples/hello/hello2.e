-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class HELLO2

inherit

	GTK_APPLICATION

creation

	make 

feature

	window: GTK_WINDOW
	button: GTK_BUTTON
	cmd: HELLO_COMMAND
	quit_cmd: QUIT_COMMAND

	make is 
		do
			initialize_tool_kit
			-- create a window with a button
			!!window.make_top_level
			!!button.make_with_label ("Hello World!")
			!!cmd
			-- cmd.connect ("clicked", button)
			button.add_action ("clicked", cmd)
			window.add_widget (button)
			window.set_border_width (10)
			-- handle "destroy" window event
			!!quit_cmd.make (window)
			button.show
			window.show
			-- wait_for_events
			main_loop
		end
	
end
