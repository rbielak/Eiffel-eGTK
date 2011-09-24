-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class PIXMAP_BUTTON

inherit

	GTK_APPLICATION

creation

	make

feature


	make is
		do
			initialize_tool_kit
			set_up_widgets
			-- wait_for_events
			main_loop
		end

feature -- widgets

	quit: EGTK_QUIT_COMMAND

	window: GTK_WINDOW

	button: GTK_BUTTON

	box: GTK_BOX

	label: GTK_LABEL

feature -- pixmaps

			-- ***
			-- Sorry about the absolute path here, but I'm being lazy
			-- ***

	mona1: GDK_PIXMAP is
		once
			!!Result.make_from_xpm (window.gdk_window, 
									Void, "./monalisa.xpm")
		end

	mona2: GDK_PIXMAP is
		once
			!!Result.make_from_xpm (window.gdk_window, 
									Void, "./monalisa2.xpm")
		end


	
feature -- set up widgets


	set_up_widgets is
		do
			-- start with the window
			!!window.make_top_level
			window.set_title ("Pixmap")
			window.set_border_width (10)
			!!quit
			window.add_action ("delete_event", quit)
			!!box.make_vertical (False, 0)
			box.set_border_width (2)
			window.add_widget (box)
			-- next the button
			make_pixmap_button
			box.pack (button, False, False, 3)
			!!label.make ("Press me!")
			box.pack (label, False, False, 3)
			-- Display all widgets
			window.show_all
		end

	make_pixmap_button is
		local
			on_press_cmd: ON_BUTTON_PRESS_COMMAND
			p1, p2: GTK_PIXMAP
		do
			!!button.make
			!!p1.make (mona1, default_pointer)
			p1.show
			button.set_pixmap (p1)
			!!on_press_cmd.make (mona1, mona2)
			button.add_action ("pressed", on_press_cmd)
		end

end
