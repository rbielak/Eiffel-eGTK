indexing
   description: "Gnome Canvas Rectangle."
   author: "Didier CLERC"
   date: "$Date: 2002/08/26 04:11:42 $"
   revision: "$Revision: 1.1 $"

class
	GNOME_CANVAS_RECTANGLE

inherit
   GNOME_CANVAS_RE
		redefine
			make
		end

creation
   make
 
feature -- Initialization
   make (canvas: GNOME_CANVAS_GROUP ) is
			-- Initializion
		do
			make_from_pointer(c_gnome_canvas_rect_new(canvas.gtk_object))
			register_widget
		end
 
end -- class GNOME_CANVAS_RECTANGLE
