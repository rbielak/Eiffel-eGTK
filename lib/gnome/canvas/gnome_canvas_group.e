-- Copyright 2000 Luc Taesch and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Gnome Canvas Group - group of items on a canvas"
	author: "Luc Taesch"
	date: "June 2000"

class GNOME_CANVAS_GROUP

inherit
	
	GNOME_CANVAS_ITEM
		redefine 
			make,
			set_position
		end
	
creation 
	
	make, make_as_root
	
feature
	
	make(canvas: GNOME_CANVAS_GROUP) is 
		do  
			make_from_pointer(c_gnome_canvas_group_new(canvas.gtk_object));
			register_widget;
		end -- make
	
	make_as_root(canvas: GNOME_CANVAS) is 
		require
			canvas_group_not_void: canvas /= Void
		do  
			make_from_pointer(c_gnome_canvas_as_root_group(canvas.widget));
			register_widget;
		end -- make
feature
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
			canvas_npc.set_property_double(gtk_object,"x",xd);
			canvas_npc.set_property_double(gtk_object,"y",yd);
		end -- set_position

end
