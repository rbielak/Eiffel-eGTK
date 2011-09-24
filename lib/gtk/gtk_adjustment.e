-- Copyright (C) 1999 Dave E Martin XXIII and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing
	description: "Gtk Data"
	author: "Dave E Martin XXIII"
	genesis: "199905120612 utc"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"
	cvs: "$Id: gtk_adjustment.e,v 1.10 2000/07/10 02:01:26 richieb Exp $"

class GTK_ADJUSTMENT

	-- This class represents a value which has an associated lower and 
	-- upper bound, together with step and page increments, and a page size. 
	-- It is used within several widgets, including GTK_SPIN_BUTTON, 
	-- GTK_VIEWPORT, and GTK_RANGE.
	--
	-- The GTK_ADJUSTMENT object does not update the value itself. Instead it 
	-- is left to the owner of the GTK_ADJUSTMENT to control the value.
	--
	-- The owner of the GTK_ADJUSTMENT typically calls value_changed or 
	-- changed  after changing the value and its bounds. This results in 
	-- the emission of the "value_changed" or "changed" signal 
	-- respectively.

	--TODO clone/copy for this class must always be "deep"
	--
	-- Signals (from gtkadjustment.c):
	--     "changed"        - Emitted when one or more of the GtkAdjustment 
	--                        fields have been changed, other than the 
	--                        value field
	--     "value_changed"  - Emitted when the GtkAdjustment value field 
	--                        has been changed.


inherit

	GTK_ADJUSTMENT_EXTERNALS
		undefine
			copy, is_equal
		end

	GTK_DATA
		rename
			data as adjustment
		end

creation

	make,
	make_from_pointer

feature {NONE} -- initialization

	make (the_value, the_lower, the_upper, the_step_increment,
		the_page_increment, the_page_size: REAL) is
		do
			adjustment := gtk_adjustment_new (the_value, the_lower,
				the_upper, the_step_increment, the_page_increment, the_page_size)
		end

feature -- query

	lower: REAL is
			-- the minimum value
		do
			Result := c_gtk_adjustment_get_lower (adjustment)
		end

	upper: REAL is
			-- the maximum value
		do
			Result := c_gtk_adjustment_get_upper (adjustment)
		end

	value: REAL is
			-- the current value
		do
			Result := c_gtk_adjustment_get_value (adjustment)
		end

	step_increment: REAL is
			-- the increment to use to make minor changes to the value. In 
			-- a GTK_SCROLLBAR this increment is used when the mouse is clicked 
			-- on the arrows at the top and bottom of the scrollbar, to 
			-- scroll by a small amount.
		do
			Result := c_gtk_adjustment_get_step_increment (adjustment)
		end

	page_increment: REAL is
			-- the increment to use to make major changes to the value. In 
			-- a GTK_SCROLLBAR this increment is used when the mouse is 
			-- clicked in the trough, to scroll by a large amount.
		do
			Result := c_gtk_adjustment_get_page_increment (adjustment)
		end

	page_size: REAL is
			-- the page size. In a GTK_SCROLLBAR this is the size of the 
			-- area which is currently visible.
		do
			Result := c_gtk_adjustment_get_page_size (adjustment)
		end

feature -- commands

	changed is
			-- notify all associated widgets via "changed" gtk signal
		do
			gtk_adjustment_changed (adjustment)
		end

	value_changed is
			-- notify all associated widgets via "value changed" gtk signal
		do
			gtk_adjustment_value_changed (adjustment)
		end

	clamp_page (the_lower, the_upper: REAL) is
			-- Updates  value to ensure that the range between lower and 
			-- upper is in the current page (i.e. between value and value + 
			-- page_size). If the range is larger than the page size, only 
			-- the start of it will be in the current page. A "changed" 
			-- signal will be emitted if the value is changed.
		do
			gtk_adjustment_clamp_page (adjustment, the_lower, the_upper);
		end

feature -- setters

	set_lower (the_value: REAL) is
			-- invoke "changed" after you are done setting things
		do
			c_gtk_adjustment_set_lower (adjustment, the_value)
		end

	set_upper (the_value: REAL) is
			-- invoke "changed" after you are done setting things
		do
			c_gtk_adjustment_set_upper (adjustment, the_value)
		end

	set_value (the_value: REAL) is
			-- sets value, clamping it to the range specified by lower and upper
			-- automatically calls value_changed, if the value actually changed
		do
			gtk_adjustment_set_value (adjustment, the_value)
			-- the C code automatically calls value_changed, 
			-- if the value actually changed
		end

	set_step_increment (the_value: REAL) is
			-- invoke "changed" after you are done setting things
		do
			c_gtk_adjustment_set_step_increment (adjustment, the_value)
		end

	set_page_increment (the_value: REAL) is
			-- invoke "changed" after you are done setting things
		do
			c_gtk_adjustment_set_page_increment (adjustment, the_value)
		end

	set_page_size (the_value: REAL) is
			-- at time of writing, page_size is only used by scrollbar widgets
			-- and the highest value you get is actually upper - page_size.
			-- invoke "changed" after you are done setting things
		do
			c_gtk_adjustment_set_page_size (adjustment, the_value)
		end

	-- NOTE, by using various set operations, it is possible for value to become
	-- "illegal" temporarily (until it is changed again by set_value, or GUI
	-- action)

end --  GTK_ADJUSTMENT
