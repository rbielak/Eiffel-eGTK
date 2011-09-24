-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--

indexing

	description:	"External C calls for GTK_APPLICATION"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_application_externals.e,v 1.4 2000/07/10 02:01:27 richieb Exp $"

class GTK_APPLICATION_EXTERNALS

feature {NONE} -- code in the glue library

	c_gtk_init_tool_kit is
		external "C"
		end

	c_gtk_init_tool_kit_check: INTEGER is
		external "C"
		end

end  -- GTK_APPLICATION_EXTERNALS

