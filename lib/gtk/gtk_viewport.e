-- Copyright 1999 Pirmin Kalberer and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_VIEWPORT - a viewport widget"
	cvs: "$Id: gtk_viewport.e,v 1.2 1999/08/30 20:09:32 pi Exp $"

class GTK_VIEWPORT

-- A viewport widget
--
-- Signals (from gtkviewport.c):
--    "set_scroll_adjustments"

inherit
	
	GTK_BIN
	
	GTK_VIEWPORT_EXTERNALS
		undefine
			copy, is_equal
		end

creation
	
	make,
	make_from_pointer
	
feature
	
	make ( hadjustment, vadjustment : POINTER ) is 
		do
			widget := gtk_viewport_new ( hadjustment, vadjustment )
			register_widget
		end
	
feature -- native GTK calls (UNTESTED) - TODO: replace POINTER types

   get_hadjustment : POINTER is
      do
         Result := gtk_viewport_get_hadjustment ( widget )
      end

   get_vadjustment : POINTER is
      do
         Result := gtk_viewport_get_vadjustment ( widget )
      end

   set_hadjustment ( adjustment : POINTER ) is
      do
         gtk_viewport_set_hadjustment ( widget, adjustment )
      end

   set_vadjustment ( adjustment : POINTER ) is
      do
         gtk_viewport_set_vadjustment ( widget, adjustment )
      end

   set_shadow_type ( type : INTEGER ) is
      do
         gtk_viewport_set_shadow_type ( widget, type )
      end
   
end -- GTK_VIEWPORT
