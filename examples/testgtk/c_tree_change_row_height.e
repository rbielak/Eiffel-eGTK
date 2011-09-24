class C_TREE_CHANGE_ROW_HEIGHT

inherit

	C_TREE_BASE_CMD
		redefine
			parent
		end

creation

	make

feature

	parent: GTK_ADJUSTMENT
	
	execute is
		local
			rh: INTEGER
		do
			rh := parent.value.floor
			c_tree_cmd.ctree.set_row_height (rh)
		end

end
