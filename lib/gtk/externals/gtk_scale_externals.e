-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_SCALE"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_scale_externals.e,v 1.5 2000/07/10 02:01:28 richieb Exp $"

class GTK_SCALE_EXTERNALS

inherit
	
	GTK_POSITIONTYPE_ENUM

feature {NONE}  -- GTK+ calls

	gtk_scale_set_digits (scale: POINTER; digits: INTEGER) is
		external "C"
		end

	gtk_scale_set_draw_value (scale: POINTER; draw_value: BOOLEAN) is
		external "C"
		end

	gtk_scale_set_value_pos (scale: POINTER; pos: INTEGER) is
		-- pos is a GtkPositionType constant
		require
			position: pos >= Gtk_pos_left and pos <= Gtk_pos_bottom
		external "C"
		end

	gtk_scale_get_value_width (scale: POINTER): INTEGER is
		external "C"
		end

	gtk_scale_draw_value (scale: POINTER) is
		external "C"
		end

end  -- GTK_SCALE_EXTERNALS
