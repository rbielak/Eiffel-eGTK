-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_DIALOG"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_dialog_externals.e,v 1.3 2000/07/10 02:01:27 richieb Exp $"

class GTK_DIALOG_EXTERNALS

feature {NONE} -- code in the glue library

	c_dialog_vbox (w: POINTER): POINTER is
		external "C"
		end

	c_dialog_action_area (w: POINTER): POINTER is
		external "C"
		end

feature {NONE}

	gtk_dialog_new: POINTER is
		external "C"
		end

end  -- GTK_DIALOG_EXTERNALS
