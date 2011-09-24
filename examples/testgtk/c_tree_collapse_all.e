class C_TREE_COLLAPSE_ALL

inherit

	C_TREE_BASE_CMD

creation

	make

feature

	execute is
		do
			c_tree_cmd.ctree.collapse_recursive (Void)
			c_tree_cmd.after_press
		end

end
