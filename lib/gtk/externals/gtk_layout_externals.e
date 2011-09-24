-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_LAYOUT"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_layout_externals.e,v 1.3 2000/07/10 02:01:28 richieb Exp $"

class GTK_LAYOUT_EXTERNALS

feature {NONE}  -- GTK+ calls

	gtk_layout_new (hadjustment, vadjustment: POINTER): POINTER is
		-- hadjustment, vadjustment are GtkAdjustment*
		external "C"
		end

	gtk_layout_put (layout, widget: POINTER; x, y: INTEGER) is
		external "C"
		end
  
	gtk_layout_move (layout, widget: POINTER; x, y: INTEGER) is
		external "C"
		end
  
	gtk_layout_set_size (layout: POINTER; width, height: INTEGER) is
		-- width, height are guint
		external "C"
		end

	gtk_layout_get_hadjustment (layout: POINTER): POINTER is
		-- returns a GtkAdjustment* 
		external "C"
		end

	gtk_layout_get_vadjustment (layout: POINTER): POINTER is
		-- returns a GtkAdjustment* 
		external "C"
		end

	gtk_layout_set_hadjustment (layout, adjustment: POINTER) is
		-- adjustment is a GtkAdjustment*
		external "C"
		end

	gtk_layout_set_vadjustment (layout, adjustment: POINTER) is
		-- adjustment is a GtkAdjustment*
		external "C"
		end


	-- These disable and enable moving and repainting the scrolling
	-- window of the GtkLayout, respectively.  If you want to update
	-- the layout's offsets but do not want it to repaint itself, you
	-- should use these functions.
	--
	-- I don't understand these are supposed to work, so I suspect
	-- they don't now.                    OWT 1/20/98
	gtk_layout_freeze (layout: POINTER) is
		external "C"
		end

	gtk_layout_thaw (layout: POINTER) is
		external "C"
		end

end  -- GTK_LAYOUT_EXTERNALS
