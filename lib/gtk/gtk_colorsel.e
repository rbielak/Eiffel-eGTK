-- Copyright 1999 Pirmin Kalberer and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_COLORSEL - a colour selection dialog"
	cvs: "$Id: gtk_colorsel.e,v 1.8 2003/01/11 19:32:51 elphick Exp $"

class GTK_COLORSEL

-- A colour selection widget
--
-- Usually, a colour-selection widget is contained in a 
-- colour-selection dialog, and so this class is a joint parent of 
-- GTK_COLOR_SELECTION_DIALOG, which is the class that will normally 
-- be used.  If this class is used directly, it must be attached to 
-- some parent container widget.
--
-- Signals (from gtkcolorsel.c):
--    "color_changed"               -  A new colour has been chosen

inherit
	
	GTK_BOX
	
	GTK_COLORSEL_EXTERNALS
		undefine
			copy, is_equal
		end

creation
	
	make,
	make_from_pointer
	
feature
	
	make is 
		do
			widget := gtk_color_selection_new
			create children.make (1, 0)
			register_widget
		end
	
feature -- native GTK calls (UNTESTED) - TODO: replace POINTER types
	
	selection_set_update_policy ( policy : INTEGER ) is
			-- The update policy controls how the colour-selection
			-- widget behaves when the user handles the mouse; the
			-- default is for it to respond immediately
			-- (Gtk_update_continuous), but if this causes
			-- performance problems, the policy can be changed to
			-- Gtk_update_discontinuous or Gtk_update_delayed
		require
			in_range: policy >= Gtk_update_continuous and policy <= Gtk_update_delayed
		do
			gtk_color_selection_set_update_policy ( widget, policy )
		end
	
	selection_set_opacity ( use_opacity : BOOLEAN ) is
			-- opacity is also known as the alpha channel; this is 
			-- disabled by default, but is enabled if this function
			-- is called with use_opacity set true
		local
			flag: INTEGER
		do
			if use_opacity then
				flag := 1
			end
			gtk_color_selection_set_opacity ( widget, flag )
		end
	
	selection_set_color ( color : POINTER ) is
		do
			gtk_color_selection_set_color ( widget, color )
		end
	
	selection_get_color: ARRAY [DOUBLE] is
		do
			-- TODO - see notes in GTK_COLORSEL_EXTERNALS about required type
			-- of color
			-- cheat by allocating four doubles
			create Result.make (0, 3)
			npc.np_gtk_color_selection_get_color ( widget, Result )
		end
	

-- This stuff is in GTK_COLOR_SELECTION_DIALOG (richieb)
--
--	selection_dialog_get_type : INTEGER is
--		do
--			Result := gtk_color_selection_dialog_get_type
--		end
	

--	selection_dialog_new : POINTER is
--		do
--			Result := gtk_color_selection_dialog_new ( widget )
--		end
   
end -- GTK_COLORSEL
