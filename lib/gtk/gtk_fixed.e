-- Copyright 1999 Oliver Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_FIXED - container widget for placing objects by %
		% co-ordinates."
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Oliver Elphick"
	changed: "6 June 1999"
	cvs: "$Id: gtk_fixed.e,v 1.7 2003/01/11 19:32:51 elphick Exp $"

class GTK_FIXED

-- This is a container into which other widgets can be placed by
-- x/y co-ordinates, counting in pixels.  The origin (top left
-- corner) is 0,0.

inherit

	GTK_COMPOSED_BIN

	GTK_FIXED_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make

feature

	attach (child: GTK_WIDGET; x, y: INTEGER) is
			-- Attach a child widget to the table, placing it's
			-- top left corner at position x,y (relative to the
			-- top left of this widget and counting in pixels)
		require
			child_not_void: child /= Void
			sane_x: x >= 0
			sane_y: y >= 0
		do
			gtk_fixed_put(widget, child.widget, x, y)
			add_child (child)
		end

	move (child: GTK_WIDGET; x, y: INTEGER) is
			-- Move a child widget in the table, placing its
			-- top left corner at position x,y (relative to the
			-- top left of this widget and counting in pixels
			-- from 0,0).
		require
			child_not_void: child /= Void
			is_child: is_child (child)
			sane_x: x >= 0
			sane_y: y >= 0
		do
			gtk_fixed_move(widget, child.widget, x, y)
		end

feature {NONE} -- creation

	make is
			-- create a new fixed widget
		do
			widget := gtk_fixed_new
			-- create an emty array to hold this widget's
			-- child objects
			create children.make (1, 0)
			register_widget
		end

end -- GTK_FIXED
