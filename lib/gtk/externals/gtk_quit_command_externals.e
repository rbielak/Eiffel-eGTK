-- Copyright (C) 2000  Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Externals for registering quit functions"
	author: "Richie Bielak"
	version: "v 0.3.5 GTK+ 1.2.x"

class GTK_QUIT_COMMAND_EXTERNALS

feature {NONE}

	gtk_quit_remove (id: INTEGER) is
		external "C"
		end

end
