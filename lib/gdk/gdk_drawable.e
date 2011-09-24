-- Copyright (C) 1999 Dave E Martin XXIII and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

   description: "access to GdkDrawable functions, and base for GDK_WINDOW"
   author: "Dave E Martin XXIII"
   genesis: "199904270329 utc"
   version: "v 0.3.5 GTK+ 1.2.x"
   gtk_version: "1.2"
   cvs: "$Id: gdk_drawable.e,v 1.8 2002/04/18 07:22:25 elphick Exp $"

class GDK_DRAWABLE

inherit

   GDK_OBJECT
      rename
	 object as drawable
      end

feature -- command

   draw_point (graphics_context: GDK_GC; x, y: INTEGER) is
      require
	 graphics_context_exists: graphics_context /= Void
	 --HERE what happens when x or y out of range?
      do
	 gdk_draw_point (drawable, graphics_context.gc, x, y)
      end

   draw_line (graphics_context: GDK_GC; x1, y1, x2, y2: INTEGER) is
      require
	 graphics_context_exists: graphics_context /= Void
      do
	 gdk_draw_line (drawable, graphics_context.gc, x1, y1, x2, y2)
      end

   draw_rectangle (graphics_context: GDK_GC; filled: BOOLEAN;
		   x, y, width, height: INTEGER) is
	 -- width or height of -1 means to draw to the edge of the drawable
	 -- in that dimension, otherwise width and height must be non-negative
      require
	 graphics_context_exists: graphics_context /= Void
	 normalized: width >= -1 and height >= -1
      do
	 gdk_draw_rectangle (drawable, graphics_context.gc,
			     filled.to_integer, x, y, width, height)
      end

   draw_arc (graphics_context: GDK_GC; filled: BOOLEAN;
	     x, y, width, height, angle1, angle2: INTEGER) is
      require
	 graphics_context_exists: graphics_context /= Void
      local
	 b: INTEGER
      do
	 if filled then
	    b := 1
	 end
	 gdk_draw_arc (drawable, graphics_context.gc, b,
		       x, y, width, height, angle1, angle2)
	 -- HERE yes, angle* is integer, and no, i don't know what the units
	 -- are, yet
      end
	
   ---HERE need GDK_FONT
   ---	draw_string (font: GDK_FONT; graphics_context: GDK_GC;
   ---		x, y: INTEGER; text: STRING) is
   ---		require
   ---			font_exists: font /= Void
   ---			graphics_context_exists: graphics_context /= Void
   ---			text_exists: text /= Void
   ---		do
   ---			draw_text (font.font, graphics_context.gc, x, y, text, text.count)
   ---			-- decent compiler should inline
   ---		end
	
   ---	draw_text (font: GDK_FONT; graphics_context: GDK_GC;
   ---		x, y: INTEGER; text: STRING; text_length: INTEGER) is
   ---		require
   ---			font_exists: font /= Void
   ---			graphics_context_exists: graphics_context /= Void
   ---			text_exists: text /= Void
   ---			text_length_in_range: 0 <= text_length and text_length <= text.count
   ---		do
   ---			gdk_draw_text (drawable, font.font, graphics_context.gc, x, y,
   ---				string_to_c_pointer (text), text_length)
   ---		end
	
   -- HERE draw_text_wc, eiffel and unicode?
	
   draw_pixmap (graphics_context: GDK_GC; source: GDK_DRAWABLE;
		x_source, y_source, x_dest, y_dest, width, height: INTEGER) is
	 --Hmmm, HERE C Gdk wants a drawable here, look into this, will it
	 -- really accept any drawable?
      require
	 graphics_context_exists: graphics_context /= Void
	 source_exists: source /= Void
      do
	 gdk_draw_pixmap (drawable, graphics_context.gc, source.drawable,
			  x_source, y_source, x_dest, y_dest, width, height)
      end
	
   ---	the underlying gdk_draw_bitmap function appears to not actually exist
   ---	in the gdk library, even though its declared in the gdk.h header
   ---	HERE
   ---	draw_bitmap (graphics_context: GDK_GC; source: GDK_DRAWABLE;
   ---		x_source, y_source, x_dest, y_dest, width, height: INTEGER) is
   ---			--Hmmm, HERE C Gdk wants a drawable here, look into this, will it
   ---			-- really accept any drawable?
   ---		require
   ---			graphics_context_exists: graphics_context /= Void
   ---			source_exists: source /= Void
   ---		do
   ---			gdk_draw_bitmap (drawable, graphics_context.gc, source.drawable,
   ---				x_source, y_source, x_dest, y_dest, width, height)
   ---		end
	
   draw_image (graphics_context: GDK_GC; image: GDK_IMAGE;
	       x_src, y_src, x_dest, y_dest, width, height: INTEGER) is
	 -- draw the specified subet of image into this drawable at the
	 -- specified offsets (xdest, ydest)
      do
	 gdk_draw_image (drawable, graphics_context.gc, image.image,
			 x_src, y_src, x_dest, y_dest, width, height)
      end
	
	
feature -- emulated commands
	
   ---HERE work on the below mess later
   ---may want to write eiffel-aware intermediate C glue code
	
   --HERE these will have to be simulated by calling draw_point or draw_line
   --as generating a C compatible array would take just as long or longer than
   --doing this anyway (we can't just to_pointer our array as the eiffel objects
   --(even if they are just encapsulating C objects via a POINTER) may have hidden
   --data (like rtti or a polymorphic resolve table), or possibly different
   --alignment
   -- NOTE that as a result, gdk_point, gdk_segment, and gdk_line are NOT
   -- encapsulations of the underlying C structs, since they are not used
   -- anywhere else in gtk/gdk and they are not actual gtk/gdk "types".
   -- If this changes in a future version of gdk/gtk, these may have to be
   -- changed/updated.
	
   -- HERE HEREHERE cannot emulate draw_polygon, it may be filled,
   -- which means a C array will have to be generated from a GDK_POINT

   ---	gdk_draw_polygon (graphics_context: GDK_GC; filled: BOOLEAN;
   ---		 points: ARRAY [GDK_POINT]) is
   ---		do
   ---		end
	
   ---	gdk_draw_points
   ---	gdk_draw_segments
   ---	gdk_draw_lines
	
	end -- GDK_DRAWABLE
