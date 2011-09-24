indexing
   description: "Objects that ..."
   french_description:  "Objets qui ..."
   author: "Didier CLERC"
   date: "$Date: 2002/08/26 04:11:42 $"
   revision: "$Revision: 1.1 $"

class
	GNOME_CANVAS_IMAGE

inherit
   GNOME_CANVAS_ITEM
		redefine
			set_position
		end

creation
   make_from_file
 
feature -- Initialization

    make_from_file (canvas: GNOME_CANVAS_GROUP;image_file:STRING) is
 	         -- Initialize 				
 			do
 				make_from_pointer(c_gnome_canvas_image_new(canvas.gtk_object,image_file.to_external))
				register_widget
 			end
 
feature -- Controle
	set_image( image_file:STRING) is
			--GKD_IM_LIB_IMAGE) is 
		do 
		
		end
	
--	image :GdkImlibImage is
--			-- Both
--			-- GdkImlibImage to display            
--		do
			
--		end
	set_x(ax:DOUBLE) is
			-- set x
		do
			canvas_npc.set_property_double(gtk_object,"x",ax);

		end
	set_y(ay:DOUBLE) is
			-- set y
		do
			canvas_npc.set_property_double(gtk_object,"y",ay);

		end
	dx : DOUBLE is
			--Both
			--X coordinate of the anchor point
		do
			Result:= canvas_npc.get_property_as_double(gtk_object, "x")
		end
	dy : DOUBLE is
			-- Both
			-- Y coordinate of the anchor point
		do
			Result:= canvas_npc.get_property_as_double(gtk_object, "y")

		end
--	anchor : GTK_ANCHOR_TYPE is
			-- Both	            
			-- Location of anchor point
--		do
			
--		end
--	set_anchor(g:	GTK_ANCHOR_TYPE) is
--			-- Set location of anchor point
--		do
--		
--		end
	width : DOUBLE is
		do
			 Result:= canvas_npc.get_property_as_double(gtk_object, "width")
		end

	set_width(v:	DOUBLE)	is
			-- Both;
			-- Width in canvas units 
			-- (image will be scaled)
		do
			canvas_npc.set_property_double(gtk_object,"width",v);
		end

	height: DOUBLE is
		do
			Result:= canvas_npc.get_property_as_double(gtk_object, "height")
		end

	set_height(v:DOUBLE) is
			--	Both; 
			-- Height in canvas units 
			-- (image will be scaled)
		do
			canvas_npc.set_property_double(gtk_object,"height",v);
		end
              
feature -- Facility
	set_position(ax,ay:INTEGER) is
		do
			set_x(ax)
			set_y(ay)
		end
	set_position_in_double(ax,ay:DOUBLE) is
		do
			set_x(ax)
			set_y(ay)
		end
	set_dimension(w,h:DOUBLE) is
		do
			set_width(w)
			set_height(h)
		end
end -- class GNOME_CANVAS_IMAGE
