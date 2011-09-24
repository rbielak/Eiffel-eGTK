-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_TOGGLE_BUTTON"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_toggle_button_externals.e,v 1.3 2000/07/10 02:01:28 richieb Exp $"

class GTK_TOGGLE_BUTTON_EXTERNALS


feature {NONE}

	gtk_toggle_button_new: POINTER is
		external "C"
		end

	gtk_toggle_button_new_with_label (label: POINTER): POINTER is
		external "C"
		end

	gtk_toggle_button_set_mode (toggle_button: POINTER;
					     draw_indicator: BOOLEAN) is
		external "C"
		end

	gtk_toggle_button_set_active (button: POINTER; state: INTEGER) is
		external "C"
		end

	gtk_toggle_button_get_active(toggle_button: POINTER): BOOLEAN is
		external "C"
		end

	gtk_toggle_button_toggled (toggle_button: POINTER) is
		external "C"
		end

feature {NONE} -- code in the glue library

	c_gtk_toggle_button_active (button: POINTER) : BOOLEAN is
		external "C"
		end


end  -- GTK_TOGGLE_BUTTON_EXTERNALS
