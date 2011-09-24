class C_TREE_REBUILD_CMD

inherit

	C_TREE_BASE_CMD

creation

	make

feature

	execute is
		do
			c_tree_cmd.rebuild_tree
		end

end

