-- Copyright (C) 1999 Dave E Martin XXIII and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "type-safe wrapper for GdkGC"
	author: "Dave E Martin XXIII"
	genesis: "199903180503 utc"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"
	cvs: "$Id: gdk_gc.e,v 1.8 2003/01/11 19:32:51 elphick Exp $"

class GDK_GC

inherit

	GDK_OBJECT
		rename
			object as gc
		export
			{GDK_DRAWABLE, GTK_STYLE, GTK_PREVIEW} gc
		redefine
			dispose
		end

	GDK_GC_EXTERNALS
		undefine 
			is_equal, copy
		end

creation

	make,
	make_from_pointer

feature {GTK_STYLE} -- restricted creation

	make_from_pointer (the_gc: POINTER) is
		do
			gc := the_gc
			ref
		ensure
			gc_set: gc = the_gc
		end

feature -- creation

	make (window: GDK_WINDOW) is
		require
			window_valid: window /= Void
		do
			gc := gdk_gc_new (window.window)
		end

feature {NONE} -- destruction

	dispose is
		do
			precursor
			unref
--			gdk_gc_destroy (gc)
		end

feature -- query

	values: GDK_GC_VALUES is
		do
			create  Result.make
			gdk_gc_get_values (gc, Result.values)
		end

feature -- setters

	ref is
		do
			gdk_gc_ref (gc)
		end

	unref is
		do
			gdk_gc_unref (gc)
		end

---	set_foreground (color: GDK_COLOR)
---	set_background (color: GDK_COLOR)
---	set_font (font: GDK_FONT)

	set_function (function: expanded GDK_FUNCTION_VALUE) is
			-- set the graphics context drawing function code
		require
			function /= Void
		do
			gdk_gc_set_function (gc, function.value)
		ensure
			function_set: values.function.value = function.value
				-- gc function code is set to specified function code
		end

---	set_fill (fill: GDK_FILL)
---	set_tile (font: GDK_PIXMAP)
---	set_stipple (stipple: GDK_PIXMAP)
---	set_ts_origin (x, y: INTEGER)
---	set_clip_origin (x, y: INTEGER)
---	set_clip_mask (mask: GDK_BITMAP)
---	set_clip_rectangle (rectangle: GDK_RECTANGLE)
---	set_clip_region (region: GDK_REGION)
---	set_subwindow (mode: GDK_SUBWINDOW_MODE)
---	set_exposures (exposures: INTEGER)
---	set_line_attributes (line_width: INTEGER; line_style: GDK_LINE_STYLE;
---		cap_style: GDK_CAP_STYLE; join_style: GDK_JOIN_STYLE)
---	set_dashes (dash_offset: INTEGER; dash_list: STRING)

feature

--- gdk_gc_copy fix clone to do this

end -- GDK_GC
