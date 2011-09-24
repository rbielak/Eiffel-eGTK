indexing
   description: "Gnome Canvas PolyGon."
   author: "Didier CLERC"
   date: "$Date: 2003/01/11 19:04:23 $"
   revision: "$Revision: 1.2 $"
   comment: "Have some problem of color"
class
	GNOME_CANVAS_POLYGON

inherit
   GNOME_CANVAS_ITEM
		undefine
			make
		end

creation
   make_with_points

feature -- Initialization

    make_with_points (canvas: GNOME_CANVAS_GROUP; points: ARRAY[DOUBLE] ) is
 	         -- Initialize 
 			do
 				make_from_pointer(c_gnome_canvas_polygon_new(canvas.gtk_object,points.count,points.to_external))
				register_widget
 			end

feature -- from (GNOME_CANVAS_ITEM)

--  "fill-color"           gchar*               : Write
--  "fill-color-gdk"       GdkColor             : Read / Write
--  "fill-color-rgba"      guint                : Read / Write
--  "outline-color"        gchar*               : Write
--  "outline-color-gdk"    GdkColor             : Read / Write
--  "outline-color-rgba"   guint                : Read / Write

feature --  "fill-stipple"         GdkWindow            : Read / Write

	make (canvas:GNOME_CANVAS_GROUP)is
		do
		
		end

	fill_stipple : GDK_WINDOW
			-- "fill-stipple" (GdkWindow : Read)

	set_fill_stipple (v:GDK_WINDOW) is
			-- "fill-stipple" (GdkWindow : Write)
		do
			fill_stipple := v
			 canvas_npc.set_property_pointer(gtk_object,"fill-stipple",v.window);
		end

feature --  "outline-stipple"      GdkWindow            : Read / Write
	outline_stipple : GDK_WINDOW 
			-- "outline-stipple"(GdkWindow : Read)

	set_outline_stipple (v:GDK_WINDOW) is
			--"outline-stipple" (GdkWindow : Write)
		do
			outline_stipple:= v
			canvas_npc.set_property_pointer(gtk_object,"outline-stipple",v.window)
		end

feature -- width
	set_width_pixels(v : INTEGER) is
			-- "width-pixels" (guint : Write)
		do
			canvas_npc.set_property_integer(gtk_object,"width_pixels", v)
		end

	set_width_units (v : DOUBLE) is
			-- "width-units" (gdouble : Write) 
		do
			canvas_npc.set_property_double(gtk_object,"width_units", v)
		end
 
end -- class GNOME_CANVAS_POLYGON
