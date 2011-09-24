indexing

	description: "GDK_RECTANGLE - structure representing a rectangle"
	author: "Object Tools - adapted to eGTK by richieb"
	version: "v 0.3.5 GTK+ 1.2.x"


class GDK_RECTANGLE

inherit

   GDK_RECTANGLE_EXTERNALS

   

creation
	
	make_from_pointer, 
	make
	
feature -- Creation
	
	make (lx, ly, lwidth, lheight : INTEGER) is
		require
			valid_position: (lx >= 0) and (ly >= 0)
		do
			-- TODO: If the rectangle is allocated here, we need to 
			-- dispose it when this object is collected.
			rectanglep :=  c_gdk_rectangle_new (lx, ly, lwidth, lheight)
		end
	
	make_from_pointer (p: POINTER) is
		require
			valid_p: p /= default_pointer
		do
			rectanglep := p
		end

feature -- Operations

	set_x(arg_x : INTEGER) is
		do
			c_gdk_rectangle_x_set (rectanglep, arg_x)
		end
	
	set_y(arg_y : INTEGER) is
		do
			c_gdk_rectangle_y_set (rectanglep, arg_y)
		end
	
   set_width(arg_width : INTEGER) is
		do
			c_gdk_rectangle_width_set (rectanglep, arg_width)
		end
	
	set_height(arg_height : INTEGER) is
		do
			c_gdk_rectangle_height_set (rectanglep, arg_height)
      end
	  
feature -- Queries
	
	x : INTEGER is
		do
			Result := c_gdk_rectangle_x (rectanglep)
		end
	
	y : INTEGER is
		do
			Result := c_gdk_rectangle_y (rectanglep)
		end
	
	width : INTEGER is
		do
			Result := c_gdk_rectangle_width (rectanglep)
		end
	
	height : INTEGER is
		do
			Result := c_gdk_rectangle_height (rectanglep)
		end
	
feature -- pointer to C structure

	rectanglep: POINTER

end -- class GDK_RECTANGLE
