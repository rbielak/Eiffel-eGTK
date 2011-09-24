-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_WINDOW"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_window_externals.e,v 1.5 2000/07/10 02:01:28 richieb Exp $"

class GTK_WINDOW_EXTERNALS

feature  -- GdkWindowHints constants

	Gdk_hint_pos: INTEGER			is  1	--  1 << 0,
	Gdk_hint_min_size: INTEGER		is  2	--  1 << 1,
	Gdk_hint_max_size: INTEGER		is  4	--  1 << 2,
	Gdk_hint_base_size: INTEGER		is  8	--  1 << 3,
	Gdk_hint_aspect: INTEGER		is 16	--  1 << 4,
	Gdk_hint_resize_inc: INTEGER		is 32	--  1 << 5

feature  -- GtkWindowPosition constants

	Gtk_win_pos_none: INTEGER		is 0
	Gtk_win_pos_center: INTEGER		is 1
	Gtk_win_pos_mouse: INTEGER		is 2

feature {NONE}

	gtk_window_new (opt: INTEGER): POINTER is
		external "C"
		end

	gtk_window_set_title (widget: POINTER; t: POINTER) is
		external "C"
		end

	gtk_window_set_wmclass (window, wmclass_name, wmclass_class: POINTER) is
		-- wnclass_name, wmclass_class are const gchar*
		external "C"
		end

	gtk_window_set_policy (w: POINTER;
			allow_shrink, allow_grow, auto_shrink: BOOLEAN) is
		external "C"
		end

	gtk_window_add_accel_group (window, accel_group: POINTER) is
		-- accel_group is a GtkAccelGroup*
		external "C"
		end

	gtk_window_remove_accel_group (window, accel_group: POINTER) is
		-- accel_group is a GtkAccelGroup*
		external "C"
		end

	gtk_window_set_position (window: POINTER; position: INTEGER) is
		-- positions is a GtkWindowPosition constant
		external "C"
		end

	gtk_window_activate_focus (window: POINTER): INTEGER is
		external "C"
		end

	gtk_window_activate_default (window: POINTER): INTEGER is
		external "C"
		end


	gtk_window_set_transient_for (window, parent: POINTER) is
		external "C"
		end

	gtk_window_set_geometry_hints (window,
				geometry_widget, geometry: POINTER;
				geom_mask: INTEGER) is
		 --		geometry_widget is a GtkWidget*
		 --		geometry is a GdkGeometry*
		 --		geom_mask is a GdkWindowHints
		external "C"
		end

	-- The following differs from gtk_widget_set_usize, in that
	-- gtk_widget_set_usize () overrides the requisition, so sets a
	-- minimum size, while this only sets the size requested from the WM.
	gtk_window_set_default_size (window: POINTER;
					width, height: INTEGER) is
		external "C"
		end

	-- If window is set modal, input will be grabbed when show and
	-- released when hide
	gtk_window_set_modal (window: POINTER; modal: BOOLEAN) is
		external "C"
		end

end  -- GTK_WINDOW_EXTERNALS
