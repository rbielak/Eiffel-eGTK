-- Copyright (C) 2000  Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Externals for idle functions"
	author: "Richie Bielak"
	version: "v 0.3.5 GTK+ 1.2.x"

class GTK_IDLE_COMMAND_EXTERNALS

feature {NONE}

	gtk_idle_add (fp: POINTER; data: POINTER): INTEGER is
		external "C"
		end

	gtk_idle_remove (id: INTEGER) is
		external "C"
		end
			
end

