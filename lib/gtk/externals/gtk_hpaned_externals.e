-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_HPANED"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_hpaned_externals.e,v 1.4 2000/07/10 02:01:28 richieb Exp $"

class GTK_HPANED_EXTERNALS

feature

	gtk_hpaned_new: POINTER is
		external "C"
		end

end  -- GTK_HPANED_EXTERNALS
