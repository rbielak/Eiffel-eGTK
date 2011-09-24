class C_TREE_CHANGE_INDENTATION

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
			i: INTEGER
		do
			i := parent.value.floor
			c_tree_cmd.ctree.set_indent (i)
		end

end
