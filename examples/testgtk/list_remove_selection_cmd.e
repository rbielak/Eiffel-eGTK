-- Copyright 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class LIST_REMOVE_SELECTION_CMD

inherit

	GTK_COMMAND

creation

	make

feature

	list: GTK_LIST

	make (llist: like list) is
		do
			list := llist
		end

	execute is
		local
			selection, clear_list: G_LIST
		do
			-- TODO: extended selection must be done differently 
			-- maybe. Something seems to be needed with focus_child 
			-- but I don't understand the code in the C example
			selection := list.selection
			if selection /= Void then
				clear_list := clone (selection)
				list.remove_items (clear_list)
			end
		end

end
