-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_GC"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_gc_externals.e,v 1.3 2000/07/10 02:01:27 richieb Exp $"

class GTK_GC_EXTERNALS

feature --  GdkGCValuesMask constants

	Gdk_gc_foreground: INTEGER	is      1	--   1 << 0
	Gdk_gc_background: INTEGER	is      2	--   1 << 1
	Gdk_gc_font: INTEGER		is      4	--   1 << 2
	Gdk_gc_function: INTEGER	is      8	--   1 << 3
	Gdk_gc_fill: INTEGER		is     16	--   1 << 4
	Gdk_gc_tile: INTEGER		is     32	--   1 << 5
	Gdk_gc_stipple: INTEGER		is     64	--   1 << 6
	Gdk_gc_clip_mask: INTEGER	is    128	--   1 << 7
	Gdk_gc_subwindow: INTEGER	is    256	--   1 << 8
	Gdk_gc_ts_x_origin: INTEGER	is    512	--   1 << 9
	Gdk_gc_ts_y_origin: INTEGER	is   1024	--   1 << 10
	Gdk_gc_clip_x_origin: INTEGER	is   2048	--   1 << 11
	Gdk_gc_clip_y_origin: INTEGER	is   4096	--   1 << 12
	Gdk_gc_exposures: INTEGER	is   8192	--   1 << 13
	Gdk_gc_line_width: INTEGER	is  16384	--   1 << 14
	Gdk_gc_line_style: INTEGER	is  32768	--   1 << 15
	Gdk_gc_cap_style: INTEGER	is  65536	--   1 << 16
	Gdk_gc_join_style: INTEGER	is 131072	--   1 << 17


feature {NONE}  -- GTK+ calls

	gtk_gc_get (depth: INTEGER; colourmap, values: POINTER;
			       values_mask: INTEGER): POINTER is
		-- colourmap is a GdkColormap*
		-- values is a GdkGCValues*
		-- values_mask is a GdkGCValuesMask constant (see
		--   gdk/gdktypes.h)
		external "C"
		end

	gtk_gc_release (gc: POINTER) is
		external "C"
		end

end  -- GTK_GC_EXTERNALS
