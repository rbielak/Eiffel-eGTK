-- Copyright (C) 1998 Francois Pennaneach and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "gtk menubar"
	author: "Francois Pennaneach"
	version: "v 0.3.5 GTK+ 1.2.x"
	changes: "adapted for ISE - Richie Bielak"
	cvs: "$Id: gtk_menu_bar.e,v 1.7 2003/01/11 19:32:51 elphick Exp $"

class GTK_MENU_BAR

-- The traditional menubar, usually placed across the top of its parent
-- window.

inherit

	GTK_MENU_SHELL 
		redefine
			append,
			insert,
			prepend
		end

	GTK_MENU_BAR_EXTERNALS
		undefine
			copy, is_equal
		end

creation

   make,
   make_from_pointer

feature 
	
	make is
			-- Creation and initialization
		do
			create children.make (1, 0)
			widget := gtk_menu_bar_new
			register_widget
		end -- make

	append (child: GTK_WIDGET) is
			-- add a menu item at the end of the list of items
		do
			gtk_menu_bar_append (widget, child.widget)
			-- keep a reference for the GC
			add_child (child)
		end -- append

	insert(child: GTK_WIDGET; position: INTEGER) is
			-- insert a menu item at the stated position in the list
		do
			gtk_menu_bar_insert (widget, child.widget, position)
			-- keep a reference for the GC
			add_child (child)
		end -- insert

	prepend(child: GTK_WIDGET) is
			-- insert a menu item at the beginning of the list
		do
			gtk_menu_bar_prepend (widget, child.widget)
			-- keep a reference for the GC
			add_child (child)			
		end -- prepend

end -- GTK_MENU_BAR

