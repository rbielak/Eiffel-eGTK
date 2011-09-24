class C_TREE_TOGGLE_REORDERABLE

inherit
	
	C_TREE_BASE_CMD
		redefine
			parent
		end

creation

	make

feature

	parent: GTK_CHECK_BUTTON

	execute is
		do
			c_tree_cmd.ctree.set_reorderable (parent.button_is_down)
		end

end
