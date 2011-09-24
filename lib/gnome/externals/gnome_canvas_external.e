-- Copyright 2000 Luc Taesch and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Gnome Canvas externals"
	author: "Luc Taesch"
	date: "$Date: 2002/08/26 04:09:39 $"
	revision: "$Revision: 1.3 $"

class

	GNOME_CANVAS_EXTERNAL


feature --gnome canvas

	c_gnome_canvas_new : POINTER is
		external "C"
		end

	c_gnome_canvas_new_aa : POINTER is
		external "C"
		end


	c_gnome_canvas_as_root_group(c : POINTER) : POINTER is
		external "C"
		end

	gnome_canvas_set_pixels_per_unit(widget:POINTER;u:DOUBLE) is 
		external "C"
		end

feature -- canvas item

	c_gnome_canvas_item_new(group: POINTER): POINTER is 
		external "C"
		end -- c_gnome_canvas_item_new

feature -- canvas group

	c_gnome_canvas_group_new(group: POINTER): POINTER is 
		external "C"
		end -- c_gnome_canvas_item_new 

	gnome_canvas_item_hide(w:POINTER) is
		external "C"
		end

	gnome_canvas_item_show(w:POINTER) is
		external "C"
		end

	gnome_canvas_item_move(w :POINTER; item_x, item_y : DOUBLE) is
		external "C"
		end


feature -- canvas widget

	c_gnome_canvas_widget_new(group: POINTER): POINTER is 
		external "C"
		end

	c_gnome_canvas_text_new(group: POINTER): POINTER is 
		external "C"
		end

-- add by Didier CLERC
	c_gnome_canvas_ellipse_new(group: POINTER) : POINTER is
		external "C"
		end

	c_gnome_canvas_re_new(group:POINTER):POINTER is
		external "C"
		end

	c_gnome_canvas_rect_new(group:POINTER):POINTER is
		external "C"
		end

	c_gnome_canvas_polygon_new(group:POINTER;n:INTEGER; p:POINTER):POINTER is
		external "C"
		end

	c_gnome_canvas_image_new(group:POINTER;filename:POINTER):POINTER is
		external "C"
		end
-- stop add

feature  -- accessor

	c_gtk_object_set_string(w, name, value:POINTER) is
		external "C"
		end
	
	
	c_gtk_object_set_double(w, name:POINTER; value: DOUBLE) is
		external "C"
		end

	c_gtk_object_set_integer(w, name:POINTER; value: INTEGER) is
		external "C"
		end
	
	c_gtk_object_set_boolean(w, name:POINTER; value:BOOLEAN) is
		external "C"
		end

	--getters
	c_gtk_object_get_double(w, name:POINTER):DOUBLE is
		external "C"
		end
	c_gtk_object_get_boolean(w,name:POINTER):INTEGER is
		external "C"
		end
	--c_gtk_object_set_pointer(w, name,p:POINTER) is
	--external "c"
	--end


feature --coordinate

	c_gnome_canvas_item_w2i(w, x, y :POINTER) is
		external "C"
		end
	
	c_gnome_canvas_set_scroll_region(w: POINTER; x1, y1, x2, y2 : INTEGER) is
		external "C"
		end
	
	c_gnome_canvas_item_x_as_item(w: POINTER) : DOUBLE is
		external "C"
		end

	c_gnome_canvas_item_y_as_item(w: POINTER) : DOUBLE is
		external "C"
		end

	c_gnome_canvas_item_grab(w:POINTER) is 
		external "C" 
		end
	
	c_gnome_canvas_item_ungrab(w:POINTER) is 
		external "C" 
		end
	
feature ---line

	c_gnome_canvas_line_new(w:POINTER;n:INTEGER; p:POINTER):POINTER is
		external "C" 
		end
	

end -- class GNOME_CANVAS_EXTERNAL
