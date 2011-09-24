class C_TREE_REMOVE_SELECTION_CMD

inherit

	C_TREE_BASE_CMD

creation

	make

feature

	execute is
		local
			tree: GTK_CTREE
			node: GTK_CTREE_NODE
		do
			print ("Remove selection%N")
			tree := c_tree_cmd.ctree

			if tree.selection /= Void then
				tree.freeze
				from
				until tree.selection = Void
				loop
					!!node.make_from_pointer (tree.selection.data_as_pointer)
					-- TODO: update counts of pages 
					tree.remove_node (node)
				end
				tree.thaw
			end
			c_tree_cmd.after_press
		end

end
