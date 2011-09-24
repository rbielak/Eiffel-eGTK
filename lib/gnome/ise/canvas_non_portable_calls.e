-- Copyright 2000 Luc Taesch and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class

	CANVAS_non_portable_calls

inherit

   GNOME_CANVAS_EXTERNAL

feature  -- accessor

	set_property(w:POINTER; s,v : STRING) is
		do
			c_gtk_object_set_string(w, $(s.to_c), $(v.to_c))
		end
	
	set_property_double(w:POINTER; s: STRING; d: DOUBLE) is
		do
			c_gtk_object_set_double(w, $(s.to_c), d)
		end
	
	set_property_pointer(w:POINTER;s:STRING; p:POINTER) is
		do
			c_gtk_object_set_string(w,$(s.to_c),p)
		end
	
	set_property_integer(w:POINTER; s: STRING; d: INTEGER) is
		do
			c_gtk_object_set_integer(w, $(s.to_c), d)
		end

	set_property_boolean(w:POINTER; s: STRING; d:BOOLEAN) is
		do
			c_gtk_object_set_boolean(w, $(s.to_c), d)
		end

	--getters
	get_property_as_double(w:POINTER; s : STRING):DOUBLE is
		local
			d: DOUBLE;
		do
			
			d :=c_gtk_object_get_double(w, $(s.to_c))
			Result := d
			
		end
	
	npc_gnome_canvas_line_new(g: POINTER;n:INTEGER; p: ARRAY[DOUBLE]):POINTER is
		do 
			
			Result := c_gnome_canvas_line_new(g,n,$(p.to_c))
		end





end -- class GNOME_CANVAS_EXTERNAL
