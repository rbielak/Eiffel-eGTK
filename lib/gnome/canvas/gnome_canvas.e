-- Copyright 2000 Luc Taesch and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Gnome Canvas Widget"
	author: "Luc Taesch"
	date: "June 2000"

class GNOME_CANVAS

inherit 

   GTK_WIDGET;
	
   GNOME_CANVAS_EXTERNAL
		undefine
			copy, is_equal 
		end
	GNOME_CANVAS_NPC
		undefine 
			copy, is_equal 
		end

creation {ANY} 

	make, make_as_aa

feature {ANY} 
   
	make is
		do  
			make_from_pointer(c_gnome_canvas_new)
		end 

	make_as_aa is
		do  
			make_from_pointer(c_gnome_canvas_new_aa)
		end 

	set_outline_color(s_color:STRING) is
		require
			s_color /= void
		do 
			canvas_npc.set_property(widget,"outline_color", s_color)
	    end

	set_fill_color(s_color:STRING) is
		require
			s_color /= void
		do 
			canvas_npc.set_property(widget,"fill_color", s_color)
	    end

	set_outline_width_units(w: DOUBLE) is
		do 
			canvas_npc.set_property_double(widget,"width_units", w)
	    end
	
	set_scroll_region(x1, y1, x2, y2 :INTEGER) is
		do
			c_gnome_canvas_set_scroll_region(widget, x1, y1, x2, y2);
		end

	set_pixels_per_units( ppu: DOUBLE) is
		do
			gnome_canvas_set_pixels_per_unit(widget, ppu)
		end

end -- class GNOME_CANVAS
