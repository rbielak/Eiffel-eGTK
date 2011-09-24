-- Copyright (C) 1999 Dave E Martin XXIII and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "type-safe wrapper for GdkGCValues"
	author: "Dave E Martin XXIII"
	genesis: "199904280332 utc"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"
	cvs: "$Id: gdk_gc_values.e,v 1.5 2000/07/10 02:01:26 richieb Exp $"

class GDK_GC_VALUES

inherit 

	GDK_OBJECT
		rename
			object as values
		end

	GDK_GC_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make

feature -- creation

	make is
		do
			values := c_gdk_make_gc_values
		end

feature -- query

---TODO	foreground: GDK_COLOR
---	background: GDK_COLOR
---	font: GDK_FONT

	function: expanded GDK_FUNCTION_VALUE is
		do
			Result.set_value (c_gdk_gc_values_get_function (values))
		end

---	fill: GDK_FILL
---	tile: GDK_PIXMAP
---	stipple: GDK_PIXMAP
---	clip_mask: GDK_PIXMAP
---	subwindow_mode: GDK_SUBWINDOWMODE -- HERE ???
---	ts_x_origin: INTEGER
---	ts_y_origin: INTEGER
---	clip_x_origin: INTEGER
---	clip_y_origin: INTEGER
---	graphics_exposures: INTEGER
---	line_width: INTEGER
---	line_style: GDK_LINE_STYLE
---	cap_style: GDK_CAP_STYLE
---	join_style: GDK_JOIN_STYLE

feature -- setters

---	set_foreground (the_foreground: GDK_COLOR)
---	set_background: GDK_COLOR
---	set_font: GDK_FONT

	set_function (the_function: expanded GDK_FUNCTION_VALUE) is

		require
			valid_arg: the_function /= Void
		do
			c_gdk_gc_values_set_function (values, the_function.value)
		ensure
			set: function.value = the_function.value
		end

---	set_fill: GDK_FILL
---	set_tile: GDK_PIXMAP
---	set_stipple: GDK_PIXMAP
---	set_clip_mask: GDK_PIXMAP
---	set_subwindow_mode: GDK_SUBWINDOWMODE -- HERE ???
---	set_ts_x_origin: INTEGER
---	set_ts_y_origin: INTEGER
---	set_clip_x_origin: INTEGER
---	set_clip_y_origin: INTEGER
---	set_graphics_exposures: INTEGER
---	set_line_width: INTEGER
---	set_line_style: GDK_LINE_STYLE
---	set_cap_style: GDK_CAP_STYLE
---	set_join_style: GDK_JOIN_STYLE

end -- GDK_GC_VALUES
