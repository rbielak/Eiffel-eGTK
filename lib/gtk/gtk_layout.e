-- Copyright 1999 Pirmin Kalberer and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_LAYOUT"
	cvs: "$Id: gtk_layout.e,v 1.6 2003/01/11 19:32:51 elphick Exp $"

class GTK_LAYOUT

-- Widget for scrolling of arbitrary-sized areas
--
-- Signals (from gtklayoutc):
--    "set_scroll_adjustments"

inherit
	
	GTK_COMPOSED_BIN
		rename
			set_size as set_widget_size
		end
	
	GTK_LAYOUT_EXTERNALS
		undefine
			copy, is_equal
		end

creation
	
	make,
	make_from_pointer
	
feature
	
	make (hadjustment, vadjustment: GTK_ADJUSTMENT) is 
		local
			hadj, vadj: POINTER
		do
			if hadjustment = Void then
				hadj := default_pointer
			else
				hadj := hadjustment.adjustment
			end
			if vadjustment = Void then
				vadj := default_pointer
			else
				vadj := hadjustment.adjustment
			end
			widget := gtk_layout_new (hadj, vadj)
			register_widget
			create children.make(1,0)
		end
	
feature -- native GTK calls (UNTESTED) - TODO: replace POINTER types

   put ( the_widget: GTK_WIDGET; x : INTEGER; y : INTEGER ) is
      do
         gtk_layout_put (widget, the_widget.widget, x, y)
		 add_child(the_widget)
      end

   move (the_widget : GTK_WIDGET; x : INTEGER; y : INTEGER ) is
      do
         gtk_layout_move ( widget, the_widget.widget, x, y )
      end

   set_size ( new_width : INTEGER; new_height : INTEGER ) is
      do
         gtk_layout_set_size ( widget, new_width, new_height )
      end

   get_hadjustment : GTK_ADJUSTMENT is
      do
         create Result.make_from_pointer(gtk_layout_get_hadjustment ( widget ))
      end

   get_vadjustment : GTK_ADJUSTMENT is
      do
         create Result.make_from_pointer(gtk_layout_get_vadjustment ( widget ))
      end

   set_hadjustment ( adjustment : GTK_ADJUSTMENT ) is
      do
         gtk_layout_set_hadjustment ( widget, adjustment.adjustment )
      end

   set_vadjustment ( adjustment : GTK_ADJUSTMENT ) is
      do
         gtk_layout_set_vadjustment ( widget, adjustment.adjustment )
      end

   freeze is
      do
         gtk_layout_freeze ( widget )
      end

   thaw is
      do
         gtk_layout_thaw ( widget )
      end
   
end -- GTK_LAYOUT
