class C_TREE_CHANGE_SPACING

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
			sp: INTEGER
		do
			sp := parent.value.floor
			c_tree_cmd.ctree.set_spacing (sp)
		end

end
