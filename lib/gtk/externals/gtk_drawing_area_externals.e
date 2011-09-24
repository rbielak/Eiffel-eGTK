-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_DRAWING_AREA"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_drawing_area_externals.e,v 1.3 2000/07/10 02:01:27 richieb Exp $"

class GTK_DRAWING_AREA_EXTERNALS


feature {NONE}
			
	gtk_drawing_area_new: POINTER is
		external "C"
		end

	gtk_drawing_area_size (a: POINTER; w, h: INTEGER) is
		external "C"
		end

end  -- GTK_DRAWING_AREA_EXTERNALS
