-- Copyright (c) 2000 Oliver Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1 is
-- (see forum.txt)
--
indexing

	description:	"Window function enumeration for GDK_WINDOWS"
	author:		"Oliver Elphick"
	date:		"25th May 2000"
	cvs:		"$Id: gdk_window_functions_enum.e,v 1.1 2000/05/26 01:20:42 elphick Exp $"

class GDK_WINDOW_FUNCTIONS_ENUM

-- These values may be summed and the result given as a parameter to
-- GDK_WINDOW set_function to determine what controls are given 
-- to the window by the window manager

feature -- GdkWMFunction enumeration

	Gdk_func_all: INTEGER		  is  1
	Gdk_func_resize: INTEGER	  is  2
   Gdk_func_move: INTEGER		  is  4
   Gdk_func_minimize: INTEGER	  is  8
   Gdk_func_maximize: INTEGER	  is 16
   Gdk_func_close: INTEGER		  is 32

feature

	Gdk_max_function: INTEGER is
		do
			Result := Gdk_func_all + Gdk_func_resize + Gdk_func_move +
				Gdk_func_minimize + Gdk_func_maximize + Gdk_func_close
		end

end -- GDK_WINDOW_FUNCTIONS_ENUM
