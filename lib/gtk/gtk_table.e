-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_TABLE - table widget"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"
	changed: "11/10/98"
	cvs: "$Id: gtk_table.e,v 1.8 2003/01/11 19:32:51 elphick Exp $"

class GTK_TABLE

-- A table is a container organised in cells by row and column. The widgets
-- attached to it must use at least one cell each, but can use more.

inherit

	GTK_COMPOSED_BIN

	GTK_TABLE_EXTERNALS
		undefine
			copy, is_equal
		end

	GTK_CONSTANTS
		undefine
			copy, is_equal
		end

creation

	make

feature

	set_row_spacings (n: INTEGER) is
			-- change the vertical spacing between widgets
		require
			n >= 0
		do
			gtk_table_set_row_spacings (widget, n)
		end

	set_column_spacings (n: INTEGER) is
			-- change the horizontal spacing between widgets
		require
			n >= 0
		do
			gtk_table_set_col_spacings (widget, n)
		end

	attach (child: GTK_WIDGET; left, right, top, bottom: INTEGER;
			x_opt, y_opt: INTEGER; x_pad, y_pad: INTEGER) is
			-- Attach a child widget to the table, using cells
			-- from left,top (top left corner) to 
			-- right-1,bottom-1 (bottom right corner);
			-- the top left cell is numbered 0,0;
			-- x_opt and y_opt are the sum of zero to all of
			-- GTK_FILL, GTK_SHRINK and GTK_EXPAND;
			-- xpadding and ypadding specify the horizontal
			-- and vertical padding around the widget in pixels
		require
			child_not_void: child /= Void
			sane_horizontal: left < right
			sane_vertical: top < bottom
			in_bounds: left >= 0 and top >= 0 
			-- how can we check the upper bounds?
			sane_padding: x_pad >= 0 and y_pad >= 0
		do
			gtk_table_attach (widget, child.widget, left, right,
				top, bottom, x_opt, y_opt, x_pad, y_pad)
			add_child (child)
		end

	attach_defaults(child: GTK_WIDGET; left,right,top,bottom: INTEGER) is
			-- Attach a child widget to the table, using cells
			-- from left,top (top left corner) to 
			-- right-1,bottom-1 (bottom right corner);
			-- the top left cell is numbered 0,0;
			-- horizontal and vertical padding default to 0;
			-- resizing policy defaults to (GTK_FILL | GTK_EXPAND)
		require
			child_not_void: child /= Void
			sane_horizontal: left < right
			sane_vertical: top < bottom
			in_bounds: left >= 0 and top >= 0 
			-- how can we check the upper bounds?
		local
			xy_opt: INTEGER
		do
			xy_opt := GTK_EXPAND + GTK_FILL
			attach (child, left, right, top, bottom, xy_opt, xy_opt,0,0)
		end

feature {NONE} -- creation

	make (rows, columns: INTEGER; homogenous: BOOLEAN) is
			-- create a table with the specified number of
			-- rows and columns; if homogenous is true, each
			-- cell is created the same size.
		require
			rows > 0
			columns > 0
		do
			widget := gtk_table_new (rows, columns, homogenous)
			create children.make (1, 0)
			register_widget
		end

end
