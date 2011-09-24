-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_FRAME"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_frame_externals.e,v 1.3 2000/07/10 02:01:27 richieb Exp $"

class GTK_FRAME_EXTERNALS


feature {NONE}
			
	gtk_frame_new (l: POINTER): POINTER is
		external "C"
		end

	gtk_frame_set_label (w, l: POINTER) is
		external "C"
		end

	gtk_frame_set_label_align (w: POINTER; a: REAL) is
		external "C"
		end

	gtk_frame_set_shadow_type (w: POINTER; t: INTEGER) is
		external "C"
		end

end  -- GTK_FRAME_EXTERNALS
