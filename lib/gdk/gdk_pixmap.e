-- Copyright (C) 1999 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

   description: "GDK_PIXMAP"
   author: "Richie Bielak"
   version: "v 0.3.5 GTK+ 1.2.x"

class GDK_PIXMAP

inherit

   GDK_DRAWABLE
      rename
	 drawable as pixmap
      redefine
	 dispose
      end

   GDK_PIXMAP_EXTERNALS
      undefine
	 is_equal, copy
      end

   EGTK_NON_PORTABLE
      undefine
	 is_equal, copy
      end

creation

   make,
   make_from_pointer,
   make_from_data,
   make_from_xpm,
   make_from_xpm_d,
   make_from_pointers

feature

   make (window: GDK_WINDOW; 
	 width, height, depth: INTEGER) is
      require
	 window_not_void: window  /= Void
	 valid_dimensions: (width >= 0) and (height >= 0) and (depth >= 0)
      do
	 pixmap := gdk_pixmap_new(window.window, width, height, depth);
	 ref
      end

   make_from_data (window: GDK_WINDOW; 
		   data: STRING; 
		   width, height, depth: INTEGER;
		   fg, bg: GDK_COLOR) is
      require
	 window_not_void: window  /= Void
	 valid_dimensions: (width >= 0) and (height >= 0) and (depth >= 0)
	 data_not_void: data /= Void
	 colors_not_void: (fg /= Void) and (bg /= Void)
      do
	 pixmap := gdk_npc.np_gdk_pixmap_create_from_data (window.window,
							   data,
							   width, height, depth,
							   fg.color, bg.color)
	 ref
      end

   make_from_xpm (window: GDK_WINDOW; 
		  transparent_color: GDK_COLOR;
		  fname: STRING) is
      require
	 window_not_void: window  /= Void
	 fname_not_void: fname /= Void
      local
	 color: POINTER
      do
	 if transparent_color /= Void then
	    color := transparent_color.color
	 end
	 pixmap := gdk_npc.np_gdk_pixmap_create_from_xpm (window.window,
							  $a_mask,
							  color,
							  fname)
	 ref
	 create mask.make_from_pointer (a_mask)
      end

   make_from_xpm_d (window: GDK_WINDOW; 
		    transparent_color: GDK_COLOR;
		    data: STRING) is
      require
	 window_not_void: window  /= Void
	 data_not_void: data /= Void
      local
	 color: POINTER
      do
	 if transparent_color /= Void then
	    color := transparent_color.color
	 end
	 pixmap := gdk_npc.np_gdk_pixmap_create_from_xpm_d (window.window,
							    $a_mask,
							    color,
							    data)
	 ref
	 create mask.make_from_pointer (a_mask)
      end

   make_from_pointers(p, b: POINTER) is
      do
	 make_from_pointer(p)
	 ref
	 create mask.make_from_pointer(b)
      end
	
   make_from_pointer (p: POINTER) is
      require
	 p_not_void: p /= Void
      do
	 pixmap := p
	 ref
      end

feature -- corresponding mask

   mask: GDK_BITMAP

feature {NONE}

   a_mask: POINTER

feature -- needed for external memory management

   ref is
      do
	 -- returns the value of its argument
	 pixmap := gdk_pixmap_ref (pixmap)
      end

   unref is
      do
	 gdk_pixmap_unref (pixmap)
      end

feature {NONE}

   dispose is
      do
	 precursor
	 unref
      end

end
