-- Copyright (C) 1998 Francois Pennaneach and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "gtk menu_shell wrapper"
	author: "Francois Pennaneach"
	version: "v 0.3.5 GTK+ 1.2.x"
	changes: "adapted for ISE by Richie Bielak"
	cvs: "$Id: gtk_menu_shell.e,v 1.6 2000/07/10 02:01:27 richieb Exp $"

class GTK_MENU_SHELL

-- A generic menu shell, inherited by GTK_MENU_BAR and GTK_MENU
-- which provides the features for adding menu items to the
-- menu.
--
-- Signals (from gtkmenushell.e):
--    "activate_current"
--    "cancel"
--    "deactivate"
--    "move_current"
--    "selection-done"

inherit

	GTK_COMPOSED_BIN

	GTK_MENU_SHELL_EXTERNALS
		undefine
			copy, is_equal
		end
	
feature

	append (child: GTK_WIDGET) is
			-- Add the child to the end of the menu
		require
			child_valid: child /= Void
		do
			gtk_menu_shell_append (widget, child.widget)
			-- keep a reference to the child, so that the GC won't 
			-- delete it 
			add_child (child)
		end -- append

	prepend(child : GTK_WIDGET) is
			-- Insert the child at the beginning of the menu
		require
			child_valid: child /= Void			
		do
			gtk_menu_shell_prepend (widget, child.widget)
			add_child (child)
		end -- prepend

	insert(child : GTK_WIDGET; position : INTEGER) is
			-- insert the child at the specified position in the menu;
			-- !! is this right? !!
			-- the item becomes the positionth item, counting from 0.
		require
			child_valid: child /= Void 
		do
			gtk_menu_shell_insert (widget, child.widget, position)
		end -- insert

	deactivate is
			-- deactivate the specified item
			-- !! should we have a precondition that the menu contains widget? !!
		do
			gtk_menu_shell_deactivate (widget)
		end -- deactivate

end -- GTK_MENU_SHELL	
