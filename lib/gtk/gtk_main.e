-- Copyright 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_MAIN - calls for handling the main loop"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"
	
class GTK_MAIN

inherit

	GTK_MAIN_EXTERNALS

feature -- main loop control

	main_loop is
			-- run main loop. This routine doesn't return until 
			-- someone calls 'main_loop_quit'
		do
			gtk_main
		end

	main_loop_quit is
			-- quit the current event handling loop
		do
			gtk_main_quit
		end

	main_loop_iteration is
			-- run the main iteration loop once 
		local
			junk: INTEGER
		do
			-- TODO: not sure what return means..
			junk := gtk_main_iteration
		end

	events_pending: BOOLEAN is
			-- are there events pending?
		do
			Result := gtk_events_pending /= 0
		end

	main_loop_level: INTEGER is
			-- level of current loop
		do
			Result := gtk_main_level
		end

end
