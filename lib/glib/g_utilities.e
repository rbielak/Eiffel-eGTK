-- Copyright 2000 Oliver Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--

indexing

	description: "Wrapping of selected utility functions from glib"
	author: "Oliver Elphick"
	date: "June 7th, 2000"
	cvs: "$Id: g_utilities.e,v 1.2 2000/07/01 17:30:30 richieb Exp $"

class G_UTILITIES
-- A set of utilities using features from glib

inherit

	GLIB_NON_PORTABLE_CALLS
	
feature -- queries

	home_directory: STRING is
		do
			Result := npc_home_directory(g_get_home_dir)
		ensure
			Result /= Void and then not (Result.count = 0)
		end

feature {NONE} -- internal

	g_get_home_dir: POINTER is
		external
			"C"
		end

end -- G_UTILITIES
