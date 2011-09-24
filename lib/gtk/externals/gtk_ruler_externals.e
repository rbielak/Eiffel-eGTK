-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_RULER"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_ruler_externals.e,v 1.3 2000/07/10 02:01:28 richieb Exp $"

class GTK_RULER_EXTERNALS

feature  -- GtkMetricType constants

	Gtk_pixels: INTEGER		is 0
	Gtk_inches: INTEGER		is 1
	Gtk_centimeters: INTEGER	is 2

feature {NONE}  -- GTK+ calls

	gtk_ruler_set_metric (ruler: POINTER; metric: INTEGER) is
		-- metric is a GtkMetricType constant
		external "C"
		end

	gtk_ruler_set_range  (ruler: POINTER;
			    lower, upper, position, max_size: REAL) is
		external "C"
		end

	gtk_ruler_draw_ticks (ruler: POINTER) is
		external "C"
		end

	gtk_ruler_draw_pos   (ruler: POINTER) is
		external "C"
		end

end  -- GTK_RULER_EXTERNALS
