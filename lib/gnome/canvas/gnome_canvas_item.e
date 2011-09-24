-- Copyright 2000 Luc Taesch and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Gnome Canvas item"
	author: "Luc Taesch"
	date: "June 2000"

class GNOME_CANVAS_ITEM

inherit 

	GTK_OBJECT; 

	GNOME_CANVAS_EXTERNAL
		undefine 
			copy, is_equal 
		end

	GNOME_CANVAS_NPC 
		undefine 
			copy, is_equal 
		end
   
creation {ANY} 

   make

feature {ANY} 
   
   make(canvas: GNOME_CANVAS_GROUP) is 
		require
			canvas_g_must_exist: canvas /= void
			canvas_g_valid: canvas.gtk_object /= default_pointer
		do  
			make_from_pointer(c_gnome_canvas_item_new(canvas.gtk_object));
			register_widget;
		end -- make
	
	set_position(xa, ya: INTEGER) is 
			-- change position of the widget in its parent; the
			-- x and y co-ordinates are in pixels relative to the
			-- top left corner (0,0)
		require 
			positive_position: xa >= - 2 and ya >= - 2; 
		local 
			xd, yd: DOUBLE;
		do  
			xd := xa;
			yd := ya;
			canvas_npc.set_property_double(gtk_object,"x1",xd);
			canvas_npc.set_property_double(gtk_object,"y1",yd);
		end -- set_position
	
	set_size(new_width, new_height: INTEGER) is 
			-- Change the size of the widget in pixels
		require 
			positive_size: new_width >= - 2;
		local 
			xd, yd: DOUBLE;
		do  
			xd := x+new_width;
			yd := y+new_height;
			canvas_npc.set_property_double(gtk_object,"x2",xd);
			canvas_npc.set_property_double(gtk_object,"y2",yd);
            --		ensure
            --			size_set: width = new_width and height = new_height
            -- NOTE: This postcondition becomes true only if the widget is 
            -- visible, until then the size is not changed..
			
		end -- set_size
	
	x : INTEGER is
		do
			Result :=c_gnome_canvas_item_x_as_item(gtk_object).rounded
		end
	
	y : INTEGER is
		do
			Result :=c_gnome_canvas_item_y_as_item(gtk_object).rounded
		end
	
	set_outline_color(s_color:STRING) is
		require
			s_color_must_exist: s_color /= void
		do 
			canvas_npc.set_property(gtk_object,"outline_color", s_color)
	    end

	set_fill_color(s_color:STRING) is
		require
			s_color_must_exist: s_color /= void
		do 
			canvas_npc.set_property(gtk_object,"fill_color", s_color)
	    end

	set_fill_color_rgba(s_color:INTEGER) is
		do 
			canvas_npc.set_property_integer(gtk_object,"fill_color_rgba", s_color)
	    end
	
	set_outline_width_units(w: DOUBLE) is
		require
			w_must_exist: w /= void
		do 
			canvas_npc.set_property_double(gtk_object,"width_units", w)
	    end
	
	show is
		do
			gnome_canvas_item_show(gtk_object)
		end
	
	hide is
		do
			gnome_canvas_item_hide(gtk_object)
		end
	
	
	grab_mouse is
		do
			--grab the mouse events (only), no kb, or others
			c_gnome_canvas_item_grab(gtk_object)
		end
      
	ungrab_mouse is
		do
			c_gnome_canvas_item_ungrab(gtk_object)
		end

end -- class GNOME_CANVAS_ITEM
