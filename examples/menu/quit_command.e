-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class QUIT_COMMAND

inherit

	GDK_EVENT_COMMAND

	GTK_APPLICATION

feature

	execute is
		do
			main_loop_quit
		end

end
