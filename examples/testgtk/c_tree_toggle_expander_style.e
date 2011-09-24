class C_TREE_TOGGLE_EXPANDER_STYLE

inherit

	MENU_ITEM_CMD
		redefine
			parent
		end

	C_TREE_BASE_CMD
		redefine
			parent
		end

	GTK_CTREE_ENUM

creation

	make

feature

	parent: GTK_WIDGET

	execute is
		local
			tree: GTK_CTREE
		do
			if parent.mapped then
				tree := c_tree_cmd.ctree
				inspect item_index
				when 1 then
					tree.set_expander_style (Gtk_ctree_expander_none)
				when 2 then
					tree.set_expander_style (Gtk_ctree_expander_square)
				when 3 then
					tree.set_expander_style (Gtk_ctree_expander_triangle)
				when 4 then
					tree.set_expander_style (Gtk_ctree_expander_circular)
				end
			end
		end

end
