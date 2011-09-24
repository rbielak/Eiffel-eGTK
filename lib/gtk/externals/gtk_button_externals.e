-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1 is
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_BUTTON"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_button_externals.e,v 1.3 2000/07/10 02:01:27 richieb Exp $"

class GTK_BUTTON_EXTERNALS

feature  -- GtkReliefStyle constants

	Gtk_relief_normal: INTEGER	is 0
	Gtk_relief_half: INTEGER	is 1
	Gtk_relief_none: INTEGER	is 2

feature {NONE} -- GTK+ calls -- button creation

	gtk_button_new: POINTER is
		external "C"
		end

	gtk_button_new_with_label (label: POINTER): POINTER is
		external "C"
		end

feature {NONE} -- GTK+ calls -- emit signals

	gtk_button_pressed (button: POINTER) is
		external "C"
		end

	gtk_button_released (button: POINTER) is
		external "C"
		end

	gtk_button_clicked (button: POINTER) is
		external "C"
		end

	gtk_button_enter (button: POINTER) is
		external "C"
		end

	gtk_button_leave (button: POINTER) is
		external "C"
		end

feature {NONE} -- GTK+ calls -- button relief style

	gtk_button_set_relief (button: POINTER; newstyle: INTEGER) is
		require
			GtkReliefStyle: newstyle >= Gtk_relief_normal and
				newstyle <= Gtk_relief_none
		external "C"
		end

	gtk_button_get_relief (button: POINTER): INTEGER is
		-- returns a GtkReliefStyle value
		external "C"
		end

end  -- GTK_BUTTON_EXTERNALS
