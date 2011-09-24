class LIST_TOGGLE_SELECT_MODE_CMD

inherit

	MENU_ITEM_CMD
		redefine
			parent
		end
			
	GTK_SELECTIONMODE_ENUM

creation

	make

feature

	list: GTK_LIST
			-- a gtk_list

	clist: GTK_CLIST
			-- a gtk_clist

	make (a_list: GTK_CONTAINER) is
			-- this command will work on a GTK_LIST or a GTK_CLIST
		do
			-- It actually would be better if GTK_LIST and GTK_CLIST
			-- had a common ancestor that had the set_selection_mode 
			-- deferred routine. The this code would avoid the "?="
			list ?= a_list
			if list = Void then
				clist ?= a_list
			end
		ensure
			valid_list: (clist /= Void) or (list /= Void)
		end

	parent: GTK_RADIO_MENU_ITEM

	execute is
		local
			selection_mode: INTEGER
		do
			if parent.mapped then
				inspect item_index
				when 1 then
					selection_mode := Gtk_selection_single
				when 2 then
					selection_mode := Gtk_selection_browse
				when 3 then
					selection_mode := Gtk_selection_multiple
				when 4 then
					selection_mode := Gtk_selection_extended
				end
				-- set selection mode on the list or clist. One of 
				-- these must not be void
				if list /= Void then
					list.set_selection_mode (selection_mode)
				else
					clist.set_selection_mode (selection_mode)
				end
			end
		end
			
end
