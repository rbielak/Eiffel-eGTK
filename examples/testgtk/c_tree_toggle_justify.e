class C_TREE_TOGGLE_JUSTIFY

inherit

	C_TREE_BASE_CMD
		redefine
			parent
		end

	MENU_ITEM_CMD
		redefine
			parent
		end

	GTK_JUSTIFICATION_ENUM

creation

	make

feature

	parent: GTK_WIDGET

	execute is
		local
			tree_column: INTEGER
		do
			if parent.mapped then
				print (item_index)
				print ("   left/right justify %N")
				tree_column := c_tree_cmd.ctree.tree_column
				if item_index = 1 then -- left
					c_tree_cmd.ctree.set_column_justification (tree_column,
															   Gtk_justify_left)
				else -- right
					c_tree_cmd.ctree.set_column_justification (tree_column,
															   Gtk_justify_right)
				end
			end
		end

end
