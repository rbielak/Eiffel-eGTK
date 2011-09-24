-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class QUIT_COMMAND

inherit

	GDK_EVENT_COMMAND

	GTK_APPLICATION

creation

	make

feature

	make (window: GTK_WINDOW) is
		do
			-- connect ("delete_event", window)
			window.add_action ("delete_event", Current)
		end

	execute is
		do
			-- quit_application
			main_loop_quit
		end

end
