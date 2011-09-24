-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_THEMES"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_themes_externals.e,v 1.4 2000/07/10 02:01:28 richieb Exp $"

class GTK_THEMES_EXTERNALS

feature {NONE}  -- GTK+ calls

-- at GTK 1.2.3, these routines are listed in gtk/gtkthemes.h but do not
-- appear in gtk/gtkthemes.c nor in the compiled library
--	gtk_themes_init	 (argc, argv: POINTER) is
--		-- argc is int*
--		-- argv is char***
--		external "C"
--		end
--
--	gtk_themes_exit	 (error_code: INTEGER) is
--		external "C"
--		end

end  -- GTK_THEMES_EXTERNALS
