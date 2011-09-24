-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_VSEPARATOR"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_vseparator_externals.e,v 1.3 2000/07/10 02:01:28 richieb Exp $"

class GTK_VSEPARATOR_EXTERNALS


feature {NONE}

	gtk_vseparator_new: POINTER is
		external "C"
		end
		
end  -- GTK_VSEPARATOR_EXTERNALS
