class C_TREE_UNSELECT_ALL_CMD

inherit

	C_TREE_BASE_CMD

creation

	make

feature

	execute is
		do
			c_tree_cmd.ctree.unselect_recursive (Void)
			c_tree_cmd.after_press
		end

end
