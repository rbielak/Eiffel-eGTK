class C_TREE_CLOSE_CMD

inherit

	C_TREE_BASE_CMD

creation

	make

feature

	execute is
		do
			c_tree_cmd.destroy
		end

end
