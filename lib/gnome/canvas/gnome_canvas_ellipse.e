indexing
   description: "Gnome Canvas Ellipse"
   author: "Didier CLERC"
   date: "$Date: 2002/08/26 04:11:42 $"
   revision: "$Revision: 1.1 $"

class
	GNOME_CANVAS_ELLIPSE

inherit
   GNOME_CANVAS_RE
		redefine
			make
		end

creation
   make
 
feature -- Initialization
	make (canvas: GNOME_CANVAS_GROUP ) is
			-- Initialize
		do
			make_from_pointer(c_gnome_canvas_ellipse_new(canvas.gtk_object))
			register_widget
		end	
 
end -- class GNOME_CANVAS_ELLIPSE
