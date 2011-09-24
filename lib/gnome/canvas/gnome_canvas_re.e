indexing
   description: "Gnome Canvas RectangleEllipse."
   author: "Didier CLERC"
   date: "$Date: 2003/01/11 19:04:23 $"
   revision: "$Revision: 1.2 $"
   comment: "IMHO Sould be deferred, so put it as deferred class"
deferred class
	GNOME_CANVAS_RE

inherit
   GNOME_CANVAS_ITEM
		redefine
			make
		end

feature -- Initialization

    make (canvas: GNOME_CANVAS_GROUP ) is
 	         -- Initialize
				-- use for creation in descendant class.
 			do
 				make_from_pointer(c_gnome_canvas_re_new(canvas.gtk_object))
				register_widget
 			end
feature
	x1 : DOUBLE is
			--"x1" (gdouble : Read)
		do
		   Result:= canvas_npc.get_property_as_double(gtk_object, "x1")
		end
	x2 : DOUBLE is
			-- "x2" (gdouble : Read )
		do
		   Result:= canvas_npc.get_property_as_double(gtk_object, "x2")
		end
	y1 : DOUBLE is
			-- "y1" (gdouble : Read )
		do
			Result:= canvas_npc.get_property_as_double(gtk_object, "y1")
		end

	y2 : DOUBLE is
			--"y2" (gdouble : Read ) 
		do
			Result:= canvas_npc.get_property_as_double(gtk_object, "y2")
		end

	set_x1(v:DOUBLE) is
			--"x1" (gdouble :  Write )
		do
			canvas_npc.set_property_double(gtk_object,"x1",v);
		end

	set_x2(v:DOUBLE) is
			--"x2" (gdouble : Write )
		do
			canvas_npc.set_property_double(gtk_object,"x2",v);
		end

	set_y1(v:DOUBLE) is
			--"y1" (gdouble :  Write)
		do
			 canvas_npc.set_property_double(gtk_object,"y1",v);
		end

	set_y2(v:DOUBLE)is
			-- "y2" (gdouble : Write)
		do
			 canvas_npc.set_property_double(gtk_object,"y2",v);
		end
feature -- from (GNOME_CANVAS_ITEM)
--	fill_color: CHARACTER
--	set_fill_color (c: CHARACTER)
--	set_fill_color_gdk(c: GDK_COLOR)
	--"fill-color-gdk" (GdkColor : Read / Write)
--	fill_color_gdk : GDK_COLOR
--	fill_color_rgba(i: UNSIGNED_INTEGER)
	--"fill-color-rgba" (guint : Read / Write)
--	ouline_color: CHARACTER
--	set_outline_color( c : CHARACTER)
	--"outline-color" (gchar* : Write)	
--	outline_color : INTEGER
--	set_outline_color_rgba(c:CHARACTER)
	-- "outline-color-rgba" (guint : Read / Write)
feature
	fill_stipple : GDK_WINDOW
			-- "fill-stipple" (GdkWindow : Read)

	set_fill_stipple (v:GDK_WINDOW) is
			-- "fill-stipple" (GdkWindow : Write)
		do
			fill_stipple := v
			 canvas_npc.set_property_pointer(gtk_object,"fill-stipple",v.window);
		end

	outline_stipple : GDK_WINDOW 
			-- "outline-stipple"(GdkWindow : Read)

	set_outline_stipple (v:GDK_WINDOW) is
			--"outline-stipple" (GdkWindow : Write)
		do
			outline_stipple:= v
			canvas_npc.set_property_pointer(gtk_object,"outline-stipple",v.window)
		end

	set_width_pixel(v : INTEGER) is
			-- "width-pixels" (guint : Write)
		do
			canvas_npc.set_property_integer(gtk_object,"width-pixel", v)
		end

	set_width_units (v : DOUBLE) is
			-- "width-units" (gdouble : Write) 
		do
			canvas_npc.set_property_double(gtk_object,"width-units", v)
		end
feature -- facilities

	set_point1(ax,ay:DOUBLE)is
		do
			set_x1(ax)
			set_y1(ay)
		end

	set_point2(ax,ay:DOUBLE)is
		do
			set_x2(ax)
			set_y2(ay)
		end

	set_total(ax,ay:DOUBLE;width,height: DOUBLE) is
		require
			positive_width: width>= 0
			positive_height: height>=0
		do
			set_point1(ax,ay)
			set_point2(ax+width,ay+height)
		end

	set_width(width:DOUBLE) is
		require
			positive_width: width >= 0
		do
			set_x2(x1+width)
		end

	set_height(height:DOUBLE) is
		require	
			positive_height: height > 0
		do
			set_x2(y1+height)
		end
		
end -- class GNOME_CANVAS_RE
