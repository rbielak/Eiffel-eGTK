-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_SPIN_BUTTON"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_spin_button_externals.e,v 1.5 2000/07/29 01:58:27 richieb Exp $"

class GTK_SPIN_BUTTON_EXTERNALS

inherit

	GTK_SHADOWTYPE_ENUM
	GTK_UPDATE_ENUM

feature  -- GtkSpinButtonUpdatePolicy constants

	Gtk_update_always: INTEGER		is 0
	Gtk_update_if_valid: INTEGER		is 1

feature  -- GtkSpinType constants

	Gtk_spin_step_forward: INTEGER		is 0
	Gtk_spin_step_backward: INTEGER		is 1
	Gtk_spin_page_forward: INTEGER		is 2
	Gtk_spin_page_backward: INTEGER		is 3
	Gtk_spin_home: INTEGER			is 4
	Gtk_spin_end: INTEGER			is 5
	Gtk_spin_user_defined: INTEGER		is 6

feature {NONE}  -- GTK+ calls

	gtk_spin_button_configure (spin_button, adjustment: POINTER;
						    climb_rate: REAL;
						    digits: INTEGER) is
		-- adjustment is a GtkAdjustment*
		external "C"
		end

	gtk_spin_button_new (adjustment: POINTER; climb_rate: REAL;
				    digits: INTEGER): POINTER is
		-- adjustment is a GtkAdjustment*
		-- retuns a GtkWidget*
		external "C"
		end

	gtk_spin_button_set_adjustment (spin_button, adjustment: POINTER) is
		-- adjustment is a GtkAdjustment*
		external "C"
		end

	gtk_spin_button_get_adjustment (spin_button: POINTER): POINTER is
		-- returns a GtkAdjustment*
		external "C"
		end

	gtk_spin_button_set_digits (spin_button: POINTER; digits: INTEGER) is
		external "C"
		end

	gtk_spin_button_get_value_as_float (spin_button: POINTER): REAL is
		external "C"
		end

	gtk_spin_button_get_value_as_int (spin_button: POINTER): INTEGER is
		external "C"
		end

	gtk_spin_button_set_value (spin_button: POINTER; value: REAL) is
		external "C"
		end

	gtk_spin_button_set_update_policy (spin_button: POINTER;
					    policy: INTEGER) is
		-- policy is a GtkSpinButtonUpdatePolicy constant
		external "C"
		end

	gtk_spin_button_set_numeric (spin_button: POINTER;
					    numeric: BOOLEAN) is
		external "C"
		end

	gtk_spin_button_spin (spin_button: POINTER; direction: INTEGER;
					    increment: REAL) is
		-- direction is a GtkSpinType constant
		external "C"
		end

	gtk_spin_button_set_wrap (spin_button: POINTER; wrap: BOOLEAN) is
		external "C"
		end

	gtk_spin_button_set_shadow_type (spin_button: POINTER;
					    type: INTEGER) is
		-- type is a GtkShadowType constant
		require
			good_type: type >= Gtk_shadow_none and type <= Gtk_shadow_etched_out
		external "C"
		end

	gtk_spin_button_set_snap_to_ticks (spin_button: POINTER;
					    snap_to_ticks: BOOLEAN) is
		external "C"
		end

	gtk_spin_button_update (spin_button: POINTER) is
		external "C"
		end

end  -- GTK_SPIN_BUTTON_EXTERNALS
