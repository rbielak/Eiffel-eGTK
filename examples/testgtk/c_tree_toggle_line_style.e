class C_TREE_TOGGLE_LINE_STYLE

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
					tree.set_line_style (Gtk_ctree_lines_none)
				when 2 then
					tree.set_line_style (Gtk_ctree_lines_solid)
				when 3 then
					tree.set_line_style (Gtk_ctree_lines_dotted)
				when 4 then
					tree.set_line_style (Gtk_ctree_lines_tabbed)
				end
			end
		end

end
