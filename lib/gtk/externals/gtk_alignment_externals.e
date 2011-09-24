-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--

indexing

	description:	"External C calls for GTK_ALIGNMENT"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_alignment_externals.e,v 1.3 2000/07/10 02:01:27 richieb Exp $"

class GTK_ALIGNMENT_EXTERNALS

feature {NONE}  -- GTK+ direct interface

	gtk_alignment_new (xalign,
			yalign,
			xscale,
			yscale: REAL): POINTER is
		external "C"
		end

	gtk_alignment_set (alignment: POINTER;
			xalign,
			yalign,
			xscale,
			yscale: REAL) is
		external "C"
		end

end -- GTK_ALIGNMENT_EXTERNALS
