-- Copyright 2000 Luc Taesch and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Gnome Canvas item representing text"
	author: "Luc Taesch"
	date: "June 2000"

class GNOME_CANVAS_TEXT

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
			make_from_pointer(c_gnome_canvas_text_new(canvas.gtk_object));
			--some font set per default, can be overwritten
			set_fontset(
						"-adobe-helvetica-medium-r-*-*-14-*-*-*-p-*-*-*,-cronyx-helvetica-medium-r-normal-*-17-*-*-*-p-*-koi8-r,-*-*-medium-r-*-*-14-*-*-*-*-*-ksc5601.1987-0,*"
						);
			register_widget;
		end -- make
	
	set_text(s:STRING) is
		do
			canvas_npc.set_property(gtk_object,"text",s);
		end
	
	set_fontset(s:STRING) is
		do
			canvas_npc.set_property(gtk_object, "fontset",s)
		end

	set_position(xa, ya: INTEGER) is
			-- middle of the text
		local 
			xd, yd: DOUBLE;
		do  
			xd := xa;
			yd := ya;
			canvas_npc.set_property_double(gtk_object,"x",xd);
			canvas_npc.set_property_double(gtk_object,"y",yd);
		end
feature -- text width and height <=> read only
	text_width: INTEGER is
		do
			Result:= canvas_npc.get_property_as_double(gtk_object, "text_width").truncated_to_integer
		end
	text_height:INTEGER is 
		do
			Result :=canvas_npc.get_property_as_double(gtk_object, "text_height").truncated_to_integer
		end
feature -- clip_width <=> Both
	clip_width : DOUBLE is             
			-- Get width of clip rectangle in canvas units
		do
			Result:= canvas_npc.get_property_as_double(gtk_object, "clip_width")
		end
	set_clip_width(d:DOUBLE) is
			-- Set width of clip rectangle in canvas units
		do
			canvas_npc.set_property_double(gtk_object,"clip_width",d)
		end

feature -- clip_heigth <=> Both

	clip_height :DOUBLE is          
			--Get Height of clip rectangle in canvas units
		do
			Result:= canvas_npc.get_property_as_double(gtk_object, "clip_height")
		end

	set_clip_height(d:DOUBLE) is
			--Set height of clip rectangle in canvas units
		do
			canvas_npc.set_property_double(gtk_object,"clip_height",d)
		end
feature -- clip <=> Both

	set_clip(b:BOOLEAN) is
			-- Enables or disables clipping
		do
			canvas_npc.set_property_boolean(gtk_object,"clip",b)
		end

	clip: BOOLEAN is
		do
			Result := canvas_npc.get_property_as_boolean(gtk_object,"clip") 
		end

feature -- x_offset <=> Both

	x_offset: DOUBLE is
 			-- get horizontal offset to add to X position
 		do
			Result:= canvas_npc.get_property_as_double(gtk_object,"y_offset")
		end
             
  set_x_offset(d: DOUBLE) is     
			-- set horizontal offset to add to X position
		do
			canvas_npc.set_property_double(gtk_object,"x_offset",d)
		end
		
feature  -- y_offset <=> Both

	set_y_offset(d: DOUBLE) is
			-- set Vertical offset to add to Y position
		do
			canvas_npc.set_property_double(gtk_object,"y_offset",d)
		end

	y_offset: DOUBLE is           
			-- get vertical offset to add to Y position
		do
			Result:= canvas_npc.get_property_as_double(gtk_object,"y_offset")
		end

end
