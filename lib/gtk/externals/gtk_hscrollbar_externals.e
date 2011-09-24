-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_HSCROLLBAR"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_hscrollbar_externals.e,v 1.4 2000/07/10 02:01:28 richieb Exp $"

class GTK_HSCROLLBAR_EXTERNALS

feature {NONE}  -- GTK+ calls

	gtk_hscrollbar_new (adjustment: POINTER): POINTER is
		-- adjustment is a GtkAdjustment*
		external "C"
		end

end  -- GTK_HSCROLLBAR_EXTERNALS
