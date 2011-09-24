-- Copyright (C) 1999 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	cvs: "$Id: gdk_color.e,v 1.5 2000/02/28 03:32:14 richieb Exp $"

class GDK_COLOR

inherit
	
	C_STRUCT
		rename
			handle as color
		end

	GDK_COLOR_EXTERNALS
		undefine
			copy
		end

creation

	make,
	make_rgb,
	make_from_pointer

feature

	make_rgb (red_val, green_val, blue_val: INTEGER) is 
		do
			make
			set_red (red_val)
			set_green (green_val)
			set_blue (blue_val)
		end

feature 

	struct_size: INTEGER is
		do
			Result := c_gdk_color_size 
		end

feature  -- colors

	red: INTEGER is
		do
			Result := c_gdk_color_red (color)
		end

	set_red (val: INTEGER) is
		do
			c_gdk_color_set_red (color, val)
		end

	green: INTEGER is
		do
			Result := c_gdk_color_green (color)
		end

	set_green (val: INTEGER) is
		do
			c_gdk_color_set_green (color, val)
		end

	blue: INTEGER is
		do
			Result := c_gdk_color_blue (color)
		end

	set_blue (val: INTEGER) is
		do
			c_gdk_color_set_blue (color, val)
		end

	pixel: INTEGER is
		do
			Result := c_gdk_color_pixel (color)
		end

	set_pixel (val: INTEGER) is
		do
			c_gdk_color_set_pixel (color, val)
		end


end -- GDK_COLOR
