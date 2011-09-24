-- Copyright (c) 2000 Oliver Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1 is
-- (see forum.txt)
--
indexing

	description:	"Window decoration enumeration for GDK_WINDOWS"
	author:		"Oliver Elphick"
	date:		"25th May 2000"
	cvs:		"$Id: gdk_window_decorations_enum.e,v 1.1 2000/05/26 01:20:42 elphick Exp $"

class GDK_WINDOW_DECORATIONS_ENUM

-- These values may be summed and the result given as a parameter to
-- GDK_WINDOW set_function to determine what decorations are given 
-- to the window by the window manager

feature -- GdkWMDecoration enumeration

	Gdk_decor_all: INTEGER		  is  1
	Gdk_decor_border: INTEGER	  is  2
   Gdk_decor_resizeh: INTEGER	  is  4
   Gdk_decor_title: INTEGER	  is  8
   Gdk_decor_menu: INTEGER		  is 16
   Gdk_decor_minimize: INTEGER  is 32
   Gdk_decor_maximize: INTEGER  is 64

feature

	Gdk_max_decoration: INTEGER is
		do
			Result := Gdk_decor_all + Gdk_decor_border +
				Gdk_decor_resizeh + Gdk_decor_title +
				Gdk_decor_menu + Gdk_decor_minimize + Gdk_decor_maximize
		end

end -- GDK_WINDOW_DECORATIONS_ENUM
