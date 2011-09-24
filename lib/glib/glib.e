-- Copyright 2003 Oliver Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--

indexing

	description: "Wrapping of glib general utilities"
	author: "Oliver Elphick"
	date: "January 2nd, 2003"

class GLIB

-- Some general glib routines that may be needed anywhere

feature

	gscanner_new: POINTER is
		do
			Result := g_scanner_new(default_pointer)
		end

	g_free(p: POINTER) is
		external "C"
		end
		
	g_scanner_new(p: POINTER): POINTER is
		external "C"
		end

end
