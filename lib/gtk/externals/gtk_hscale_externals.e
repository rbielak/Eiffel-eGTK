-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_HSCALE"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_hscale_externals.e,v 1.3 2000/07/10 02:01:28 richieb Exp $"

class GTK_HSCALE_EXTERNALS

feature {NONE}  -- GTK+ calls

	gtk_hscale_new (adjustment: POINTER): POINTER is
		-- adjustment is a GtkAdjustment*
		external "C"
		end

end  -- GTK_HSCALE_EXTERNALS
