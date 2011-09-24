-- Copyright (C) 1998 Francois Pennaneach and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "gtk menu"
	author: "Francois Pennaneach"
	changes: "Adapted to ISE by Richie Bielak"
	cvs: "$Id: gtk_menu.e,v 1.7 2003/01/11 19:32:51 elphick Exp $"

class GTK_MENU

-- A menu, such as can be attached to a menu bar or to an item in another menu

inherit

	GTK_MENU_SHELL

	GTK_MENU_EXTERNALS
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
			widget := gtk_menu_new
			register_widget
		end -- make
	
	detach  is
			-- detach the menu from its widget
		do
			gtk_menu_detach (widget)
		end
	
	get_active : GTK_WIDGET is
			-- return the last menu item selected
		local
			active_widget: POINTER
			i: INTEGER
		do
			-- returns active widget
			active_widget := gtk_menu_get_active (widget) 
			if active_widget /= default_pointer then
				from i := 1
				until (i > children.count) or (Result /= Void)
				loop
					if (children @ i).widget = active_widget then
						Result := children @ i
					end
					i := i + 1
				end
			end
		end
	
	set_active (index: INTEGER ) is
		require
			valid_index: index >= 0 and index < count
		do
			gtk_menu_set_active (widget, index)
		end
	
	get_attach_widget  : GTK_WIDGET is
			-- TODO: verify that creation of a new object is really 
			-- required here
			--
			-- return the widget to which this menu is attached
		do
			create Result.make_from_pointer (gtk_menu_get_attach_widget (widget))
		end
	
	popdown  is
			-- remove the menu from the display
		do
			gtk_menu_popdown (widget)
		end
	
	popup (parent_menu_shell: GTK_MENU_SHELL;
		   parent_menu_item: GTK_MENU_ITEM;
		   button: INTEGER; activate_time: INTEGER) is
			-- show the menu on the display
		local
			pmsp, pmip: POINTER
		do
			if parent_menu_shell /= Void then
				pmsp := parent_menu_shell.widget
			end
			if parent_menu_item /= Void then
				pmip := parent_menu_item.widget
			end
			gtk_menu_popup (widget, pmsp, pmip, default_pointer, default_pointer,
							button, activate_time)
		end

	set_tearoff_state (torn_off: BOOLEAN) is
			-- If torn_off is true, make the menu a tear-off menu (that is, it
			-- remains visible until explicitly sent away)
		do
			gtk_menu_set_tearoff_state (widget, torn_off) 
		end
	
	set_accel_group (accel_group: GTK_ACCEL_GROUP) is
			-- Set an acceleration group to associate with this menu; this
			-- enables certain keys or key-combinations to activate menu
			-- selections
		do
			gtk_menu_set_accel_group (widget, accel_group.gtk_object) 
		end

end  -- GTK_MENU
