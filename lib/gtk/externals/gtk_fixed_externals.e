-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_FIXED"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_fixed_externals.e,v 1.3 2000/07/10 02:01:27 richieb Exp $"

class GTK_FIXED_EXTERNALS


feature {NONE}
			
	gtk_fixed_new: POINTER is
		external "C"
		end

	gtk_fixed_put (w, c: POINTER; x, y: INTEGER) is
		external "C"
		end

	gtk_fixed_move (fixed, widget: POINTER; x, y: INTEGER) is
		-- x and y are gint16
		external "C"
		end

end  -- GTK_FIXED_EXTERNALS
