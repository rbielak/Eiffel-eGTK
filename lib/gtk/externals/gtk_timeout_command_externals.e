-- Copyright (C) 2000  Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Externals for timeout functions"
	author: "Richie Bielak"
	version: "v 0.3.5 GTK+ 1.2.x"

class GTK_TIMEOUT_COMMAND_EXTERNALS


feature {NONE}

	gtk_timeout_add (interval: INTEGER; funcp: POINTER; data: POINTER): INTEGER is
		external "C"
		end

	gtk_timeout_remove (id: INTEGER) is
		external "C"
		end

end
