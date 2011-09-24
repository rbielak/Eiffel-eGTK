-- Copyright 2000 Luc Taesch and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Gnome Canvas item representing a line"
	author: "Luc Taesch"
	date: "June 2000"

class GNOME_CANVAS_LINE

inherit

	GNOME_CANVAS_NPC
		undefine 
			copy, is_equal 
		end
   GNOME_CANVAS_ITEM
		redefine 
			set_position
		end

creation 

	make_with_points

feature

	make_with_points(canvas: GNOME_CANVAS_GROUP;points :ARRAY[DOUBLE]) is 
		require
			canvas_g_not_void: canvas /= Void
			points_not_void: points /= Void
		local
			p:POINTER
			number_of_point: INTEGER
		do  
			number_of_point:= points.count
			p:=canvas_npc.npc_gnome_canvas_line_new(canvas.gtk_object,number_of_point,points)
			make_from_pointer(p)
			register_widget;
		end -- make
	
	set_position(xa, ya: INTEGER) is 
		local 
			xd, yd: DOUBLE;
		do  
			xd := xa;
			yd := ya;
			canvas_npc.set_property_double(gtk_object,"x",xd);
		   canvas_npc.set_property_double(gtk_object,"y",yd);
		end

	set_width_units(w: DOUBLE) is
		do 
			canvas_npc.set_property_double(gtk_object,"width_units", w)
	    end
	
	set_arrowhead_length(w: DOUBLE) is
		do 
			canvas_npc.set_property_double(gtk_object,"arrow_shape_a", w)
	    end

	set_arrowhead_width(w: DOUBLE) is
		do 
			canvas_npc.set_property_double(gtk_object,"arrow_shape_c", w)
	    end

	set_arrowhead_edges(w: DOUBLE) is
		do 
			canvas_npc.set_property_double(gtk_object,"arrow_shape_b", w)
	    end

	set_arrowhead_first(a: boolean) is
		do
			canvas_npc.set_property_boolean(gtk_object,"first_arrowhead", a)
		end
	
	set_arrowhead_last(a: boolean) is
		do
			canvas_npc.set_property_boolean(gtk_object,"last_arrowhead", a)
		end

	set_smooth(a: boolean) is
		do
			canvas_npc.set_property_boolean(gtk_object,"smooth", a)
		end 

	set_spline_steps(s: INTEGER) is
		do 
			canvas_npc.set_property_integer(gtk_object, "spline_steps", s)
	    end

end
