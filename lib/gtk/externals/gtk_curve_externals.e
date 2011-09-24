-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_CURVE"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_curve_externals.e,v 1.3 2000/07/10 02:01:27 richieb Exp $"

class GTK_CURVE_EXTERNALS

feature  -- GtkCurveType constants

	Gtk_curve_type_linear: INTEGER	is 0  --   linear interpolation
	Gtk_curve_type_spline: INTEGER	is 1  --   spline interpolation
	Gtk_curve_type_free: INTEGER	is 2  --   free form curve

feature {NONE}  -- GTK+ calls

	gtk_curve_new: POINTER is
		external "C"
		end

	gtk_curve_reset (curve: POINTER) is
                external "C"
                end

	gtk_curve_set_gamma (curve: POINTER; gamma: REAL) is
                external "C"
                end

	gtk_curve_set_range (curve: POINTER;
				min_x, max_x, min_y, max_y: REAL) is
                external "C"
                end

	gtk_curve_get_vector (curve: POINTER; veclen: INTEGER;
				vector: POINTER) is
		-- vector is a gfloat[]
                external "C"
                end

	gtk_curve_set_vector (curve: POINTER; veclen: INTEGER;
				vector: POINTER) is
		-- vector is a gfloat[]
                external "C"
                end

	gtk_curve_set_curve_type (curve: POINTER; type: INTEGER) is
		-- type is a GtkCurveType constant
                external "C"
                end

end  -- GTK_CURVE_EXTERNALS
