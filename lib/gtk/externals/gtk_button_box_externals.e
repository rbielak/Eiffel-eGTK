-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1 is
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_BUTTON_BOX"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_button_box_externals.e,v 1.5 2000/07/10 02:01:27 richieb Exp $"

class GTK_BUTTON_BOX_EXTERNALS

inherit
	
	GTK_BUTTON_BOX_STYLE_ENUM

feature {NONE}  -- GTK+ calls

	gtk_button_box_get_child_size_default (min_width,
			 min_height: POINTER) is
			-- pointers to INTEGER
		external "C"
		end

	gtk_button_box_get_child_ipadding_default (ipad_x, ipad_y: POINTER) is
			-- pointers to INTEGER
		external "C"
		end


	gtk_button_box_set_child_size_default (min_width,
			min_height: INTEGER) is
		external "C"
		end

	gtk_button_box_set_child_ipadding_default (ipad_x, ipad_y: INTEGER) is
		external "C"
		end


	gtk_button_box_get_spacing (widget: POINTER): INTEGER is
		external "C"
		end

	gtk_button_box_get_layout (widget: POINTER): INTEGER is
		external "C"
		end

	gtk_button_box_get_child_size (widget: POINTER;
				    min_width, min_height: POINTER) is
			-- pointers to INTEGER
		external "C"
		end

	gtk_button_box_get_child_ipadding (widget: POINTER;
			ipad_x, ipad_y: POINTER) is
			-- pointers to INTEGER
		external "C"
		end

	gtk_button_box_set_spacing (widget: POINTER; spacing: INTEGER) is
		external "C"
		end

	gtk_button_box_set_layout (widget: POINTER; 
				layout_style: INTEGER) is
		-- layout_style is a GtkButtonBoxStyle constant
		external "C"
		end

	gtk_button_box_set_child_size (widget: POINTER;
				    min_width, min_height: INTEGER) is
		external "C"
		end

	gtk_button_box_set_child_ipadding (widget: POINTER;
			ipad_x, ipad_y: INTEGER) is
		external "C"
		end

	c_gtk_button_box_get_child_size_min_width_default: INTEGER is
		external "C"
		end

	c_gtk_button_box_get_child_size_min_height_default: INTEGER is
		external "C"
		end

	c_gtk_button_box_get_child_ipadding_x_default: INTEGER is
		external "C"
		end

	c_gtk_button_box_get_child_ipadding_y_default: INTEGER is
		external "C"
		end

	c_gtk_button_box_get_child_size_min_width(widget: POINTER): INTEGER is
		external "C"
		end

	c_gtk_button_box_get_child_size_min_height(widget: POINTER): INTEGER is
		external "C"
		end

	c_gtk_button_box_get_child_ipadding_x(widget: POINTER): INTEGER is
		external "C"
		end

	c_gtk_button_box_get_child_ipadding_y(widget: POINTER): INTEGER is
		external "C"
		end

end  -- GTK_BUTTON_BOX_EXTERNALS
