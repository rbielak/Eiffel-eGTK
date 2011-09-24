-- Copyright 1999 Daniel Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_PACKER"
	author: "Daniel Elphick"

class GTK_PACKER

inherit

	GTK_COMPOSED_BIN

	GTK_PACKER_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make

feature

	add_defaults(child: GTK_WIDGET; side, anchor, options: INTEGER) is
		do
			gtk_packer_add_defaults(widget, child.widget, side, anchor, options)
			children.add_last(child)
		end

	add(child: GTK_WIDGET; size, anchor, options, border_width,
			pad_x, pad_y, i_pad_x, i_pad_y: INTEGER) is
		do
			gtk_packer_add(widget, child.widget, size, anchor, options,
				border_width, pad_x, pad_y, i_pad_x, i_pad_y)
			children.add_last(child)
		end

	set_child_packing(child: GTK_WIDGET; size, anchor, options, border_width,
			pad_x, pad_y, i_pad_x, i_pad_y: INTEGER) is
		do
			gtk_packer_set_child_packing(widget, child.widget, size, anchor,
				 options, border_width, pad_x, pad_y, i_pad_x, i_pad_y)
		end

	reorder_child(child: GTK_WIDGET; position: INTEGER) is
		do
			gtk_packer_reorder_child(widget, child.widget, position)
		end

	set_spacing(spacing: INTEGER) is
		do
			gtk_packer_set_spacing(widget, spacing)
		end

	set_default_border_width(border: INTEGER) is
		do
			gtk_packer_set_default_border_width(widget, border)
		end

	set_default_pad(pad_x, pad_y: INTEGER) is
		do
			gtk_packer_set_default_pad(widget, pad_x, pad_y)
		end

	set_default_ipad(i_pad_x, i_pad_y: INTEGER) is
		do
			gtk_packer_set_default_ipad(widget, i_pad_x, i_pad_y)
		end

feature {NONE}

	make is
		do
			widget := gtk_packer_new
			register_widget
			create children.make(1,0)
		end

end
