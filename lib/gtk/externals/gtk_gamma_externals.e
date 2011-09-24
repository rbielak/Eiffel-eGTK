-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_GAMMA"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_gamma_externals.e,v 1.5 2000/07/10 02:01:27 richieb Exp $"

class GTK_GAMMA_EXTERNALS

feature {NONE}

	gtk_gamma_curve_new: POINTER is
		external "C"
		end

	c_gtk_gamma_curve_curve(curve: POINTER): POINTER is
		external "C"
		end

end  -- GTK_GAMMA_EXTERNALS
