deferred class C_TREE_BASE_CMD

inherit

	GTK_COMMAND

feature


	c_tree_cmd: C_TREE_CMD

	make (cmd: like c_tree_cmd) is
		require
			cmd /= Void
		do
			c_tree_cmd := cmd
		end


end
