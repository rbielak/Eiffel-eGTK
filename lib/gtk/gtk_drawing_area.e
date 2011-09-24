-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_DRAWING_AREA"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"
	cvs: "$Id: gtk_drawing_area.e,v 1.7 2000/07/10 02:01:27 richieb Exp $"

class GTK_DRAWING_AREA

inherit

	GTK_WIDGET
		rename
			widget as area
		end
	
	GTK_DRAWING_AREA_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make,
	make_from_pointer

feature

	set_area_size (new_width: INTEGER; new_height: INTEGER) is
		require
			valid_dimensions: (new_width > 0) and (new_height > 0)
		do
			gtk_drawing_area_size (area, new_width, new_height)
		end

feature {NONE}

	make is
		do
			area := gtk_drawing_area_new
			register_widget
		end


end
