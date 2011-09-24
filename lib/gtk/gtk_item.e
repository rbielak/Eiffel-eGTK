-- Copyright (C) 1998 Francois Pennaneach and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Gtk item"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Francois Pennaneach"
	changes: "Adapted for ISE - Richie Bielak"
	cvs: "$Id: gtk_item.e,v 1.6 2000/07/10 02:01:27 richieb Exp $"

class GTK_ITEM

-- Signals (from gtkitem.c)
--    "deselect"
--    "select"
--    "toggle"


inherit

	GTK_BIN

	GTK_ITEM_EXTERNALS
		undefine
			copy, is_equal
		end

feature

	selection is
			-- oops ! select is an Eiffel keyword
		do
			gtk_item_select(widget)
		end -- selection
	
	deselection is
		do
			gtk_item_deselect(widget)
		end -- deselection
	
	toggle is
		do
			gtk_item_toggle (widget)
		end -- toggle
	
end -- GTK_ITEM
