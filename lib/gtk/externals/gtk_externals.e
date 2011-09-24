-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_externals.e,v 1.3 2000/07/10 02:01:27 richieb Exp $"

class GTK_EXTERNALS

feature {NONE} -- used by GTK_CONTAINER and GTK_LIST_ITEM

	c_focus_child (w: POINTER): POINTER is
			-- access to field of GTK_CONTAINER
		external "C"
		end

feature {NONE} -- used by GTK_COMMAND_TYPE and GTK_TOOLBAR_COMMAND (ise only)

	c_free_call_back_block (p: POINTER) is
		external "C"
		end

end -- GTK_EXTERNALS
