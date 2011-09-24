-- Copyright (C) 1999 Oliver Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

   description: "GDK_GEOMETRY - wraps the GdkGeometry structure"
   author: "Oliver Elphick"
   version: "v 0.3.6 GTK+ 1.2.x"

class GDK_GEOMETRY

inherit

   MEMORY
      redefine
	 dispose
      end

creation

   make

feature

   make (min_width, min_height, max_width, max_height, base_width, base_height, width_inc, height_inc: INTEGER; min_aspect, max_aspect: DOUBLE) is
      require
	 valid_min_width: min_width >= 0
	 valid_min_height: min_height >= 0
	 valid_max_width: max_width >= 0
	 valid_max_height: max_height >= 0
	 valid_base_width: base_width >= 0
	 valid_base_height: base_height >= 0
	 valid_width_inc: width_inc >= 0
	 valid_height_inc: height_inc >= 0
	 valid_min_aspect: min_aspect >= 0.
	 valid_max_aspect: max_aspect >= 0.
      do
	 gdk_object := c_gdk_geometry_object(min_width, min_height, max_width, max_height, base_width, base_height, width_inc, height_inc, min_aspect, max_aspect)
      end

   gdk_object: POINTER
	 -- The pointer to the GdkGeometry struct

feature -- changes

   set_min_width(i: INTEGER) is
      require
	 i >= 0
      do
	 c_gdk_object_set_min_width(gdk_object, i)
      end
   
   set_min_height(i: INTEGER) is
      require
	 i >= 0
      do
	 c_gdk_object_set_min_height(gdk_object, i)
      end
   
   set_max_width(i: INTEGER) is
      require
	 i >= 0
      do
	 c_gdk_object_set_min_width(gdk_object, i)
      end
   
   set_max_height(i: INTEGER) is
      require
	 i >= 0
      do
	 c_gdk_object_set_min_height(gdk_object, i)
      end
   
   set_base_width(i: INTEGER) is
      require
	 i >= 0
      do
	 c_gdk_object_set_min_width(gdk_object, i)
      end
   
   set_base_height(i: INTEGER) is
      require
	 i >= 0
      do
	 c_gdk_object_set_min_height(gdk_object, i)
      end
   
   set_width_inc(i: INTEGER) is
      require
	 i >= 0
      do
	 c_gdk_object_set_min_width(gdk_object, i)
      end
   
   set_height_inc(i: INTEGER) is
      require
	 i >= 0
      do
	 c_gdk_object_set_min_height(gdk_object, i)
      end
   
   set_min_aspect(i: DOUBLE) is
      require
	 i >= 0
      do
	 c_gdk_object_set_min_aspect(gdk_object, i)
      end
   
   set_max_aspect(i: DOUBLE) is
      require
	 i >= 0
      do
	 c_gdk_object_set_max_aspect(gdk_object, i)
      end
   
feature {NONE}

   dispose is
      do
	 c_gdk_geometry_free(gdk_object)
      end

   c_gdk_geometry_object(min_width, min_height, max_width, max_height, base_width, base_height, width_inc, height_inc: INTEGER; min_aspect, max_aspect: DOUBLE): POINTER is
      external "C"
      end

   c_gdk_object_set_min_width(p: POINTER; i: INTEGER) is
      external "C"
      end

   c_gdk_object_set_min_height(p: POINTER; i: INTEGER) is
      external "C"
      end

   c_gdk_object_set_max_width(p: POINTER; i: INTEGER) is
      external "C"
      end

   c_gdk_object_set_max_height(p: POINTER; i: INTEGER) is
      external "C"
      end

   c_gdk_object_set_base_width(p: POINTER; i: INTEGER) is
      external "C"
      end

   c_gdk_object_set_base_height(p: POINTER; i: INTEGER) is
      external "C"
      end

   c_gdk_object_set_width_inc(p: POINTER; i: INTEGER) is
      external "C"
      end

   c_gdk_object_set_height_inc(p: POINTER; i: INTEGER) is
      external "C"
      end

   c_gdk_object_set_min_aspect(p: POINTER; i: DOUBLE) is
      external "C"
      end

   c_gdk_object_set_max_aspect(p: POINTER; i: DOUBLE) is
      external "C"
      end

   c_gdk_geometry_free(p: POINTER) is
      external "C"
      end

end
