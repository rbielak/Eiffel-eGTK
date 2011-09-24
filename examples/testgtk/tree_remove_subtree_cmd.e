-- Copyright 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class TREE_REMOVE_SUBTREE_CMD

inherit

	GTK_COMMAND

	EGTK_SHARED_WIDGET_FACTORY

creation 

	make

feature

	tree: GTK_TREE

	make (ltree: like tree) is 
		require
			ltree_not_void: ltree /= Void
		do
			tree := ltree
		end

	execute is
		local
			selected: G_LIST
			item: GTK_TREE_ITEM
		do
			selected := tree.selection
			if selected /= Void then
				item ?= widget_factory.item_from_pointer (selected.nth_data (1))
				if item /= Void and then item.has_subtree then
					item.remove_subtree
				end
			end
		end

end
