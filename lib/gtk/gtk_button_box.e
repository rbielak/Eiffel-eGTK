-- Copyright 1999 Daniel Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_BUTTON_BOX"
	author: "Daniel Elphick"

class GTK_BUTTON_BOX

inherit

	GTK_COMPOSED_BIN
	
	GTK_BUTTON_BOX_EXTERNALS
		undefine
			copy, is_equal
		end

	GTK_VBBOX_EXTERNALS
		undefine
			copy, is_equal
		end

	GTK_HBBOX_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make_horizontal,
	make_vertical,
	make_from_pointer
	
feature

	get_child_size_min_width_default: INTEGER is
		do
			Result := c_gtk_button_box_get_child_size_min_width_default
		end

	get_child_size_min_height_default: INTEGER is
		do
			Result := c_gtk_button_box_get_child_size_min_height_default
		end

	get_child_ipadding_x_default: INTEGER is
		do
			Result := c_gtk_button_box_get_child_ipadding_x_default
		end

	get_child_ipadding_y_default: INTEGER is
		do
			Result := c_gtk_button_box_get_child_ipadding_y_default
		end

	get_child_size_min_width: INTEGER is
		do
			Result := c_gtk_button_box_get_child_size_min_width(widget)
		end

	get_child_size_min_height: INTEGER is
		do
			Result := c_gtk_button_box_get_child_size_min_height(widget)
		end

	get_child_ipadding_x: INTEGER is
		do
			Result := c_gtk_button_box_get_child_ipadding_x(widget)
		end

	get_child_ipadding_y: INTEGER is
		do
			Result := c_gtk_button_box_get_child_ipadding_y(widget)
		end

	get_spacing: INTEGER is
		do
			Result := gtk_button_box_get_spacing(widget)
		end

	get_layout: INTEGER is
		do
			Result := gtk_button_box_get_layout(widget)
		end

	set_spacing(spacing: INTEGER) is
		do
			gtk_button_box_set_spacing(widget, spacing)
		end

	set_layout(layout: INTEGER) is
		do
			gtk_button_box_set_layout(widget, layout)
		end

	set_child_size(min_width, min_height: INTEGER) is
		do
			gtk_button_box_set_child_size(widget, min_width, min_height)
		end

	set_child_ipadding(ipad_x, ipad_y: INTEGER) is
		do
			gtk_button_box_set_child_ipadding(widget, ipad_x, ipad_y)
		end

feature -- Creation

	make_horizontal  is
		do
			create children.make(1,0)
			widget := gtk_hbutton_box_new
			register_widget
		end

	make_vertical is
		do
			create children.make(1,0)
			widget := gtk_vbutton_box_new
			register_widget
		end

end
