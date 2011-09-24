-- Copyright 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class TREE_ADD_ITEM_CMD

inherit

	GTK_COMMAND

	EGTK_SHARED_WIDGET_FACTORY

creation

	make

feature

	root_tree: GTK_TREE

	make (t: like root_tree) is
		do
			root_tree := t
		end

	add_count: INTEGER

	execute is
		local
			sub_tree: GTK_TREE
			new_item, ti: GTK_TREE_ITEM
			selected_list: G_LIST
			label: STRING
		do
			print ("add item%N")
			selected_list := root_tree.selection
			if selected_list = Void then
				sub_tree := root_tree
			else
				-- first item in the list is the subtree
				ti ?= widget_factory.item_from_pointer (selected_list.nth_data (1))
				sub_tree := ti.subtree
				if sub_tree = Void then
					!!sub_tree.make
					ti.set_subtree (sub_tree)
				end
				-- here we have a subtree to add an item too
				label := clone ("item add ")
				label.append (add_count.out)
				add_count := add_count + 1
				!!new_item.make_with_label (label)
				sub_tree.add_widget (new_item)
				new_item.show
			end

		end

end
