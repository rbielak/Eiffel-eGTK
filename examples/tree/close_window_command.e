-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class CLOSE_WINDOW_COMMAND

inherit

	GDK_EVENT_COMMAND
		redefine
			parent
		end

	GTK_APPLICATION

creation

	make

feature

	make (new_window: GTK_WINDOW) is
		do
			window := new_window
		end


	execute is
		do
			-- quit_application
			main_loop_quit
		end

	window: GTK_WINDOW
			-- window to close

	parent: GTK_WIDGET
			-- parent widget

end
