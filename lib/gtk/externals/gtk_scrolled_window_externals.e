-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_SCROLLED_WINDOW"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_scrolled_window_externals.e,v 1.4 2000/07/10 02:01:28 richieb Exp $"

class GTK_SCROLLED_WINDOW_EXTERNALS

inherit

	GTK_POLICY_TYPE_ENUM

feature  -- GtkCornerType constants

	Gtk_corner_top_left: INTEGER		is 0
	Gtk_corner_bottom_left: INTEGER		is 1
	Gtk_corner_top_right: INTEGER		is 2
	Gtk_corner_bottom_right: INTEGER	is 3
	
feature {NONE}

	gtk_scrolled_window_new (hadj, vadj: POINTER): POINTER is
		external "C"
		end
	
	gtk_scrolled_window_set_hadjustment (scrwin,
					      hadjustment: POINTER) is
		-- hadjustment is a GtkAdjustment*
		external "C"
		end

	gtk_scrolled_window_set_vadjustment (scrwin,
					      hadjustment: POINTER) is
		-- hadjustment is a GtkAdjustment*
		external "C"
		end

	gtk_scrolled_window_get_hadjustment (scrwin: POINTER): POINTER is
		external "C"
		end

	gtk_scrolled_window_get_vadjustment (scrwin: POINTER): POINTER is
		external "C"
		end

	gtk_scrolled_window_set_policy (w: POINTER; h, v: INTEGER) is
		external "C"
		end

	gtk_scrolled_window_set_placement (scrwin: POINTER;
					      window_placement: INTEGER) is
		-- window_placement is a GtkCornerType constant
		external "C"
		end

	gtk_scrolled_window_add_with_viewport (w, o: POINTER) is
		external "C"
		end

end  -- GTK_SCROLLED_WINDOW_EXTERNALS
