-- Copyright (C) 2000  RIchie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "This is a callback for a quit function. Once %
                 %registered this function will be called when the %
                 %'main_quit' is called."
	author: "Richie Bielak"
	version: "v 0.3.5 GTK+ 1.2.x"

deferred class GTK_QUIT_COMMAND

inherit 

	GTK_FUNCTION

	GTK_QUIT_COMMAND_EXTERNALS

	EGTK_NON_PORTABLE

feature

	quit_add (level: INTEGER) is
			-- register a quit function
		require
			valid_level: level >= 0
		do
			quit_function_id := npc.c_gtk_quit_add (level, Current)
		end

	quit_remove is
		do
			gtk_quit_remove (quit_function_id)
		end

feature {NONE}

	quit_function_id: INTEGER

end
