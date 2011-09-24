-- Copyright (c) 2000 Oliver Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1 is
-- (see forum.txt)
--
indexing

	description:	"External C calls for GDK_WINDOWS"
	author:		"Oliver Elphick"
	date:		"5th May 2000"
	cvs:		"$Id: gdk_window_externals.e,v 1.3 2002/04/16 23:02:33 elphick Exp $"

class GDK_WINDOW_EXTERNALS

inherit

	GDK_WINDOW_DECORATIONS_ENUM

	GDK_WINDOW_FUNCTIONS_ENUM

feature

	gdk_window_set_background(w, c: POINTER) is
			-- w is a *GdkWindow
			-- c is a *GdkColor
		external
			"C"
		end

	gdk_window_set_back_pixmap(w, p: POINTER; parent_relative: INTEGER) is
			-- w is a *GdkWindow
			-- p is a *GdkPixmap
			-- if parent_relative is non-zero, use ParentRelative pixmap 
		external
			"C"
		end

	gdk_window_set_cursor(w, c: POINTER) is
			-- w is a *GdkWindow
			-- c is a *GdkCursor (i.e. struct{enum})
		external
			"C"
		end

	gdk_window_set_colormap(w, c: POINTER) is
			-- w is a *GdkWindow
			-- c is a *GdkColormap
		external
			"C"
		end

	gdk_window_get_colormap(w: POINTER): POINTER is
			-- w is a *GdkWindow
			-- This feature returns a *GdkColormap
		external
			"C"
		end

	gdk_window_set_decorations(w: POINTER; d: INTEGER) is
		require
			d_in_range: d >= 0 and d <= Gdk_max_decoration
		external
			"C"
		end

	gdk_window_set_functions(w: POINTER; f: INTEGER) is
		require
			f_in_range: f >= 0 and f <= Gdk_max_function
		external
			"C"
		end
 
       gdk_window_lower(w: POINTER) is
               require
                       have_window: w /= Void
               external
                       "C"
               end

       gdk_window_raise(w: POINTER) is
               require
                       have_window: w /= Void
               external
                       "C"
               end

-- There are more functions in gdkwindow.c; I'm not sure whether we 
-- will ever need them, so I will leave them for now.


end -- GDK_WINDOW_EXTERNALS
