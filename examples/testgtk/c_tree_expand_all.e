class C_TREE_EXPAND_ALL

inherit

	C_TREE_BASE_CMD

creation

	make

feature

	execute is
		do
			c_tree_cmd.ctree.expand_recursive (Void)
			c_tree_cmd.after_press
		end

end
