-- Copyright 1999 Daniel Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_ALIGNMENT - a widget which controls the alignment and %
	                            % size of its child."
	author: "Daniel Elphick"
	date: "1999"
	cvs: "$Id: gtk_alignment.e,v 1.3 2000/06/28 08:16:07 elphick Exp $"

class GTK_ALIGNMENT

	-- The GtkAlignment widget controls the alignment and size of its child 
	-- widget.  Its scale settings are used to specify how much the child 
	-- widget should expand to fill the space allocated to the alignment. The 
	-- values can range from 0 (meaning the child doesn't expand at all) to 1 
	-- (meaning the child expands to fill all of the available space).
	--
	-- The align settings are used to place the child widget within the 
	-- available area. The values range from 0 (top or left) to 1 (bottom or 
	-- right).  Of course, if the scale settings are both set to 1, the 
	-- alignment settings have no effect.

inherit

	GTK_BIN

	GTK_ALIGNMENT_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make

feature

	set_alignment(xalign, yalign, xscale, yscale: REAL) is
			-- xalign : the horizontal alignment of the child widget, from 0 
			--          (left) to 1 (right).
         -- yalign : the vertical alignment of the child widget, from 0 (top) 
         --          to 1 (bottom).
         -- xscale : the amount that the child widget expands horizontally to 
         --          fill up unused space, from 0 to 1. A value of 0 indicates 
         --          that the child widget should never expand. A value of 1 
         --          indicates that the child widget will expand to fill 
         --          all of the space allocated for the Alignment.
         -- yscale : the amount that the child widget expands vertically to 
         --          fill up unused space, from 0 to 1. The values are similar 
         --          to xscale. 
		do
			gtk_alignment_set(widget, xalign, yalign, xscale, yscale)
		end

feature {NONE}

	make(xalign, yalign, xscale, yscale: REAL) is
			-- Create a alignment
		do
			widget := gtk_alignment_new(xalign, yalign, xscale, yscale)
			register_widget
		end
   
end -- GTK_ALIGNMENT
