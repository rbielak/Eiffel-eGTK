-- Copyright (C) 1999 Dave E Martin XXIII and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Gdk image"
	author: "Dave E Martin XXIII"
	genesis: "199903110045 mst"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"
	cvs: "$Id: gdk_image.e,v 1.5 2000/07/10 02:01:26 richieb Exp $"

class GDK_IMAGE

inherit

	GDK_OBJECT
		rename
			object as image
		redefine
			dispose
		end

creation

	make,
	make_from_window

feature -- creation

	make (visual: GDK_VISUAL; the_width, the_height: INTEGER) is
		do
			image := c_gdk_image_new (visual.visual, the_width, the_height)
			width := the_width
			height := the_height
		end

	make_from_window (window: GDK_WINDOW) is
		do
			-- intended to call gdk_image_get, but need to find out what/how it
			-- does/works first HERE
			check not_yet_implemented: False end
		end

feature {NONE} -- destruction

	dispose is
		do
			precursor
			gdk_image_destroy (image)
		end

feature -- manipulation

	put_pixel (x,y: INTEGER; pixel: INTEGER) is
		require
			x_in_range: x >= 0 and x <= width
			y_in_range: y >= 0 and y <= height
		do
			gdk_image_put_pixel (image, x, y, pixel)
		ensure
			pixel_plotted: -- pixel has been set in the image
				-- cannot call get_pixel to check, because the visual may not be
				-- true color
		end

feature -- query

	width: INTEGER

	height: INTEGER

	get_pixel (x, y: INTEGER): INTEGER is
		-- get the pixel value at the given coordinates
		-- (original type is guint32)
		require
			valid_x: 0 <= x and x < width
			valid_y: 0 <= y and y < height
		do
			Result := gdk_image_get_pixel (image, x, y)
		end

end -- GDK_IMAGE
