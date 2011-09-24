-- Copyright 2000 Luc Taesch and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Gnome Canvas item that's a widget"
	author: "Luc Taesch"
	date: "June 2000"

class GNOME_CANVAS_WIDGET

inherit

   GNOME_CANVAS_NPC 
		undefine 
			copy, is_equal 
		end

   GNOME_CANVAS_ITEM
		redefine
			make, set_position
		end

creation
	
	make

feature

	make(canvas: GNOME_CANVAS_GROUP) is 
		do  
			make_from_pointer(c_gnome_canvas_widget_new(canvas.gtk_object));
			register_widget;
		end -- make
	
	add_widget(w: GTK_WIDGET) is
		require
			widget_not_void: w /= void 
		do
			canvas_npc.set_property_pointer(gtk_object,"widget",w.widget);
			-- bug turnaroud
			---- need a hide/show, if not the widget doesnt display	
			--  HIDE
			-- W.HIDE
			--W.show
			hide
			show
		end
	
	
	set_position(xa, ya: INTEGER) is 
		local 
			xd, yd: DOUBLE;
		do  
			xd := xa;
			yd := ya;
			canvas_npc.set_property_double(gtk_object,"x",xd);
			canvas_npc.set_property_double(gtk_object,"y",yd);
		end -- set_position
	
end
