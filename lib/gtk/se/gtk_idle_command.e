-- Copyright (C) 2000  Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "This is a callback for idle functions"
	author: "Richie Bielak"
	version: "v 0.3.5 GTK+ 1.2.x"

deferred class GTK_IDLE_COMMAND

inherit

	GTK_FUNCTION

	GTK_IDLE_COMMAND_EXTERNALS

	EGTK_NON_PORTABLE

feature

	idle_add is
		do
			idle_function_id := npc.c_gtk_idle_add (Current)
		end

	idle_remove is
		do
			gtk_idle_remove (idle_function_id)
		end

feature {NONE}

	idle_function_id: INTEGER

end
