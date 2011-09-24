-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_VRULER"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_vruler_externals.e,v 1.3 2000/07/10 02:01:28 richieb Exp $"

class GTK_VRULER_EXTERNALS

feature {NONE}  -- GTK+ calls

	gtk_vruler_new: POINTER is
		external "C"
		end

end  -- GTK_VRULER_EXTERNALS
