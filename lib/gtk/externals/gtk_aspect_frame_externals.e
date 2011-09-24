-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--

indexing

	description:	"External C calls for GTK_ASPECT_FRAME"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: 	"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_aspect_frame_externals.e,v 1.4 2000/07/10 02:01:27 richieb Exp $"

class GTK_ASPECT_FRAME_EXTERNALS

feature {NONE}  -- GTK+ calls

	gtk_aspect_frame_new (label: POINTER;
				xalign, yalign, ratio: REAL;
				obey_child: BOOLEAN): POINTER is
		external "C"
		end

	gtk_aspect_frame_set (aspect_frame: POINTER;
				xalign, yalign, ratio: REAL;
				obey_child: BOOLEAN) is
		external "C"
		end


end  -- GTK_ASPECT_FRAME_EXTERNALS
