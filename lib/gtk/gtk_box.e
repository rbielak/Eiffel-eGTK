-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_BOX  - you can pack it with other widgets"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"
	changed: "11/10/98"
	cvs: "$Id: gtk_box.e,v 1.7 2003/01/11 19:32:51 elphick Exp $"

class GTK_BOX

-- A container class for child widgets arranged in a single row, either
-- horizontally or vertically

inherit

	GTK_COMPOSED_BIN
	
	GTK_VBOX_EXTERNALS
		undefine
			copy, is_equal
		end

	GTK_HBOX_EXTERNALS
		undefine
			copy, is_equal
		end

	GTK_BOX_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make_horizontal,
	make_vertical,
	make_from_pointer
	
feature

	pack (child: GTK_WIDGET; expand, fill: BOOLEAN; padding: INTEGER) is
			-- Insert the child widget starting at the left or top of the box;
			-- subsequent uses of pack add items to the right or bottom of
			-- existing items added by pack.
			--
			-- If expand is true and the box is not homogenous, the
			-- box around the widgets is expanded to use any
			-- remaining space.  If fill is true, the widget uses
			-- all the space allocated by the packing box.
			-- padding is the number of pixels of padding to
			-- surround the box
		require
			child_exists: child /= Void
			sane_padding: padding >= 0
		do
			add_child (child)
			gtk_box_pack_start (widget, child.widget, expand, fill, padding)
		end

	pack_end (child: GTK_WIDGET; expand, fill: BOOLEAN; padding: INTEGER) is
			-- Insert the child widget starting at the right or bottom of
			-- the box.  See pack for parameter comments.  Subsequent uses of
			-- pack_end add items at the top or left of items previously added
			-- by pack_end, but below or to the right of items added by pack.
		require
			child_exists: child /= Void
			sane_padding: padding >= 0
		do
			add_child (child)
			gtk_box_pack_end (widget, child.widget, expand, fill, padding)
		end

feature -- Creation

	make_horizontal (homogenous: BOOLEAN; spacing: INTEGER) is
			-- Creation routine to make a horizontal box; if
			-- homogenous is true, every child widget is made the
			-- same size (as the largest of them); spacing is
			-- the number of pixels between each widget.
		require
			spacing >= 0
		do
			create children.make (1, 0)
			widget := gtk_hbox_new (homogenous, spacing)
			register_widget
		end

	make_vertical (homogenous: BOOLEAN; spacing: INTEGER) is
			-- Creation routine to make a vertical box; see
			-- make_horizontal for parameter comments.
		require
			spacing >= 0
		do
			create children.make (1, 0)
			widget := gtk_vbox_new (homogenous, spacing)
			register_widget
		end

end
