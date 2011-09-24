-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--

indexing

	description:	"External C calls for GTK_ADJUSTMENT"
	version: "v 0.3.5 GTK+ 1.2.x"
	changed:	"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_adjustment_externals.e,v 1.4 2000/07/10 02:01:27 richieb Exp $"

class GTK_ADJUSTMENT_EXTERNALS

feature {NONE} -- GTK+ interface

	gtk_adjustment_new (value, lower, upper, step_increment,
			page_increment, page_size: REAL): POINTER is
			-- NOTE: for some reason, the C function returns
			-- a GtkObject instead of a GtkAdjustment.  We are
			-- assuming, however, that it is in fact actually
			-- returning a GtkAdjustment (which is derived
			-- from GtkObject)
		external "C"
		end

	gtk_adjustment_set_value (adjustment: POINTER; value: REAL) is
		external "C"
		end

	gtk_adjustment_clamp_page (adjustment: POINTER; lower, upper: REAL) is
		external "C"
		end

	gtk_adjustment_changed (adjustment: POINTER) is
		external "C"
		end

	gtk_adjustment_value_changed (adjustment: POINTER) is
		external "C"
		end

feature {NONE} -- code in the glue library

	c_gtk_adjustment_get_value (adjustment: POINTER): REAL is
		external "C"
		end

	c_gtk_adjustment_set_step_increment (adjustment: POINTER;
			value: REAL) is
		external "C"
		end

	c_gtk_adjustment_get_step_increment (adjustment: POINTER): REAL is
		external "C"
		end

	c_gtk_adjustment_set_page_increment (adjustment: POINTER;
			value: REAL) is
		external "C"
		end

	c_gtk_adjustment_get_page_increment (adjustment: POINTER): REAL is
		external "C"
		end

	c_gtk_adjustment_set_page_size (adjustment: POINTER; value: REAL) is
		external "C"
		end

	c_gtk_adjustment_get_page_size (adjustment: POINTER): REAL is
		external "C"
		end

	c_gtk_adjustment_set_lower (adjustment: POINTER; value: REAL) is
		external "C"
		end

	c_gtk_adjustment_get_lower (adjustment: POINTER): REAL is
		external "C"
		end

	c_gtk_adjustment_set_upper (adjustment: POINTER; value: REAL) is
		external "C"
		end

	c_gtk_adjustment_get_upper (adjustment: POINTER): REAL is
		external "C"
		end

end -- GTK_ADJUSTMENT_EXTERNALS
