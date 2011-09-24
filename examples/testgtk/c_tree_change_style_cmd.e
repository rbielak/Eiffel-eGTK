class C_TREE_CHANGE_STYLE_CMD

inherit

	C_TREE_BASE_CMD

	GTK_STATETYPE_ENUM

creation

	make

feature

	style1, style2: GTK_STYLE

	execute is
		local
			tree: GTK_CTREE
			node: GTK_CTREE_NODE
			row: GTK_CTREE_ROW
			nodep: POINTER
			row_list: G_LIST
			col1, col2: GDK_COLOR
			font: GDK_FONT
		do
			tree := c_tree_cmd.ctree

			row_list := tree.row_list
			if row_list /= Void then
				if tree.focus_row >= 0 then
					nodep := row_list.nth (tree.focus_row + 1)
				else
					nodep := row_list.g_list
				end
			end
			if nodep /= default_pointer then
				!!node.make_from_pointer (nodep)

				if style1 = Void then
					!!col1.make_rgb (0, 56000, 0)
					!!col2.make_rgb (32000, 0, 56000)
					!!style1.make
					style1.set_base (col1, Gtk_state_normal);
					style1.set_fg (col2, Gtk_state_selected);
					!!style2.make
					style2.set_base (col2, Gtk_state_selected);
					style2.set_fg (col1, Gtk_state_normal)
					style2.set_base (col2, Gtk_state_normal)
					!!font.make_from_description ("-*-courier-medium-*-*-*-*-300-*-*-*-*-*-*")
					style2.set_font (font)
				end
				tree.node_set_cell_style (node, 1, style1)
				tree.node_set_cell_style (node, 0, style2)
				row := node.data_as_ctree_row
				if row.child /= Void then
					tree.node_set_row_style (row.child, style2)
				end
			end
		end

end
