-- Copyright 1999 Daniel Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_OPTION_MENU"
	author: "Daniel Elphick"

class GTK_OPTION_MENU

	-- an option menu is a button which when pressed displays a menu of 
	-- options.  Selecting one changes the button's label to that 
	-- option.

inherit

	GTK_BUTTON
		redefine
			make
		end

	GTK_OPTION_MENU_EXTERNALS
		undefine
			is_equal, copy
		end

	EGTK_NON_PORTABLE
		undefine
			is_equal, copy
		end

creation

	make

feature

	menu: GTK_MENU is
			-- The menu associated with the option button
		do
			if cache_menu /= Void then
				Result := cache_menu
			else
				create Result.make_from_pointer(gtk_option_menu_get_menu(widget))
				cache_menu := Result
			end
		end
	
	set_menu (new_menu: GTK_MENU) is
			-- Set the menu associated with the option button.  This 
			-- menu should not contain tearoff menu items, submenus, or  
			-- accelerators.
		require
			valid_menu: new_menu /= Void
		do
			cache_menu := new_menu
			gtk_option_menu_set_menu(widget, menu.widget)
		end
	
	remove_menu is
			-- Removes the menu from the option menu.
		do
			gtk_option_menu_remove_menu(widget)
			cache_menu := Void
		end
	
	set_history (index: INTEGER) is
			-- Selects the menu item specified by index making it the 
			-- newly selected value for the option menu.
		do
			gtk_option_menu_set_history(widget, index)
		end
	
	set_menu_strings (strings: ARRAY[STRING]) is
			-- Load the array of strings into a menu, and associate that 
			-- menu with the option button.
		require
			strings_not_void: strings /= Void
		local
			i: INTEGER
			new_menu: GTK_MENU
			menu_item: GTK_MENU_ITEM
		do
			create new_menu.make
			from
				i := strings.lower
			until
				i > strings.upper
			loop
				create menu_item.make_with_label(strings @ i)
				new_menu.append(menu_item)
				menu_item.show
				i := i + 1
			end
			set_menu(new_menu)
		end

feature {NONE}

	cache_menu: GTK_MENU

	make is
			-- Create a new option menu widget
		do
			widget := gtk_option_menu_new
			register_widget
			--create menu.make_from_pointer(gtk_option_menu_get_menu(widget))
		end

end -- GTK_OPTION_MENU
