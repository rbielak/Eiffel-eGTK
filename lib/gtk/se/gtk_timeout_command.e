-- Copyright (C) 2000  RIchie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "This is a callback for timeout functions"
	author: "Richie Bielak"
	version: "v 0.3.5 GTK+ 1.2.x"

deferred class GTK_TIMEOUT_COMMAND

inherit

	GTK_FUNCTION

	GTK_TIMEOUT_COMMAND_EXTERNALS

	EGTK_NON_PORTABLE

feature


	timeout_add (interval: INTEGER) is
		require
			valid_interval: interval > 0
		do
			timeout_interval := interval
			timeout_function_id := npc.c_gtk_timeout_add (interval, Current)
		end

	timeout_remove is
		do
			gtk_timeout_remove (timeout_function_id)
		end

	timeout_interval: INTEGER 
	
feature {NONE}

	timeout_function_id: INTEGER

end

