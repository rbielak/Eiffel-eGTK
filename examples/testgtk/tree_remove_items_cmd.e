-- Copyright 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class TREE_REMOVE_ITEMS_CMD

inherit

	GTK_COMMAND

creation

	make

feature

	root_tree: GTK_TREE

	make (t: like root_tree) is
		do
			root_tree := t
		end

	execute is
		local
			clear_list, selected_list: G_LIST
		do
			selected_list := root_tree.selection
			-- copy items from selected list to clear list
			clear_list := clone (selected_list)
			-- remove items from the tree
			root_tree.remove_items (clear_list)
			clear_list.destroy_object
		end

end

