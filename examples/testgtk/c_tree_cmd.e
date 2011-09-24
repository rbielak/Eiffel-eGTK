class C_TREE_CMD

inherit

	GTK_COMMAND
		
	GTK_CONSTANTS

	GTK_SELECTIONMODE_ENUM
	
	GTK_CTREE_ENUM
	
	GTK_SHADOWTYPE_ENUM

	GTK_STATETYPE_ENUM

	EGTK_SHARED_TOOLTIPS

	OPTIONS_MENU

feature

	ctree: GTK_CTREE

	window: GTK_WINDOW

feature -- parameters that determine how the tree is built

	spin1, spin2, spin3: GTK_SPIN_BUTTON

	books: INTEGER 

	pages: INTEGER

feature

	pixmap1, pixmap2, pixmap3: GDK_PIXMAP

	book_label, page_label, sel_label, vis_label: GTK_LABEL

	execute is
		local
			vbox, hbox, bbox, mbox: GTK_BOX
			label: GTK_LABEL
			adj: GTK_ADJUSTMENT
			button: GTK_BUTTON
			scrolled_win: GTK_SCROLLED_WINDOW
			line_style: INTEGER
			spinner: GTK_SPIN_BUTTON
			check_button: GTK_CHECK_BUTTON
			omenu1, omenu2, omenu3, omenu4: GTK_OPTION_MENU
			frame: GTK_FRAME
			visible, selected: INTEGER
			transparent: GDK_COLOR
			cmd: GTK_COMMAND
			event_cmd: GDK_EVENT_COMMAND
			m_cmd: MENU_ITEM_CMD
			pair: ARRAY [GTK_WIDGET]
		do
			tool_tips_controller.enable
			!!window.make_top_level
			window.set_title ("GtkCTree")
			window.set_border_width (0)
			
			!!vbox.make_vertical (False, 0)
			window.add_widget (vbox)
			
			!!hbox.make_horizontal (False, 5)
			hbox.set_border_width (5)
			vbox.pack (hbox, False, True, 0)
			
			!!label.make ("Depth:")
			hbox.pack (label, False, True, 0)
			!!adj.make (4, 1, 10, 1, 5, 0)
			!!spin1.make (adj, 0, 0)
			hbox.pack (spin1, False, True, 5)
			
			!!label.make ("Books:")
			hbox.pack (label, False, True, 0)
			!!adj.make (3, 1, 20, 1, 5, 0)
			!!spin2.make (adj, 0, 0)
			hbox.pack (spin2, False, True, 5)
			
			!!label.make ("Pages:")
			hbox.pack (label, False, True, 0)
			!!adj.make (5, 1, 20, 1, 5, 0)
			!!spin3.make (adj, 0, 0)
			hbox.pack (spin3, False, True, 5)
			
			!!button.make_with_label ("Rebuild Tree")
			hbox.pack (button, True, True, 0)
			!C_TREE_REBUILD_CMD!cmd.make (Current)
			button.add_action ("clicked", cmd)
			
			!!button.make_with_label ("Close")
			hbox.pack (button, True, True, 0)
			!C_TREE_CLOSE_CMD!cmd.make (Current)
			button.add_action ("clicked", cmd)
			
			!!scrolled_win.make
			scrolled_win.set_border_width (5)
			scrolled_win.set_policy (Gtk_policy_automatic, Gtk_policy_automatic)
			vbox.pack (scrolled_win, True, True, 0)
			
			!!ctree.make_with_titles (2, 0, <<"Tree", "Info">>)
			scrolled_win.add_widget (ctree)
			ctree.set_column_auto_resizeable (0, True)
			ctree.set_column_width (1, 200)
			ctree.set_selection_mode (Gtk_selection_extended)
			ctree.set_line_style (Gtk_ctree_lines_dotted)
			line_style := Gtk_ctree_lines_dotted
			!C_TREE_CLICK_COLUMN_CMD!cmd.make (Current)
			ctree.add_action ("click_column", cmd)

			!C_TREE_AFTER_PRESS_CMD!event_cmd.make (Current)
			ctree.add_action ("button_press_event", event_cmd)
			!C_TREE_AFTER_PRESS_CMD!event_cmd.make (Current)
			ctree.add_action ("button_release_event", event_cmd)
			!C_TREE_AFTER_PRESS_CMD!event_cmd.make (Current)
			ctree.add_action ("tree_move", event_cmd)
			!C_TREE_AFTER_PRESS_CMD!event_cmd.make (Current)
			ctree.add_action ("end_selection", event_cmd)
			!C_TREE_AFTER_PRESS_CMD!event_cmd.make (Current)
			ctree.add_action ("toggle_focus_row", event_cmd)
			!C_TREE_AFTER_PRESS_CMD!event_cmd.make (Current)
			ctree.add_action ("select_all", event_cmd)
			!C_TREE_AFTER_PRESS_CMD!event_cmd.make (Current)
			ctree.add_action ("unselect_all", event_cmd)
			!C_TREE_AFTER_PRESS_CMD!event_cmd.make (Current)
			ctree.add_action ("scroll_vertical", event_cmd)
			
			!!bbox.make_horizontal (False, 5)
			bbox.set_border_width (5)
			vbox.pack (bbox, False, True, 0)
			
			!!mbox.make_vertical (True, 5)
			bbox.pack (mbox, False, True, 0)
			
			!!label.make ("Row Height :")
			mbox.pack (label, False, False, 0)
			!!label.make ("Indent :")
			mbox.pack (label, False, False, 0)
			!!label.make ("Spacing :")
			mbox.pack (label, False, False, 0)
			
			!!mbox.make_vertical (True, 5)
			bbox.pack (mbox, False, True, 0)
			
			!!adj.make (20, 12, 100, 1, 10, 0)
			!!spinner.make (adj, 0, 0)
			mbox.pack (spinner, False, False, 5)
			tool_tips_controller.set_tool_tip ("Row height of list items", spinner)
			!C_TREE_CHANGE_ROW_HEIGHT!cmd.make (Current)
			adj.add_action ("value_changed", cmd)

			!!adj.make (20, 0, 60, 1, 10, 0)
			!!spinner.make (adj, 0, 0)
			mbox.pack (spinner, False, False, 5)
			tool_tips_controller.set_tool_tip ("Tree Indentation", spinner)
			!C_TREE_CHANGE_INDENTATION!cmd.make (Current)
			adj.add_action ("value_changed", cmd)

			!!adj.make (5, 0, 60, 1, 10, 0)
			!!spinner.make (adj, 0, 0)
			mbox.pack (spinner, False, False, 5)
			tool_tips_controller.set_tool_tip ("Tree Spacing", spinner)
			!C_TREE_CHANGE_SPACING!cmd.make (Current)
			adj.add_action ("value_changed", cmd)
			
			!!mbox.make_vertical (True, 5)
			bbox.pack (mbox, False, False, 0)
			
			!!hbox.make_horizontal (False, 5)
			mbox.pack (hbox, False, False, 0)
			!!button.make_with_label ("Expand All")
			hbox.pack (button, True, True, 0)
			!C_TREE_EXPAND_ALL!cmd.make (Current)
			button.add_action ("clicked", cmd)

			!!button.make_with_label ("Collapse All")
			hbox.pack (button, True, True, 0)
			!C_TREE_COLLAPSE_ALL!cmd.make (Current)
			button.add_action ("clicked", cmd)

			!!button.make_with_label ("Change Style")
			hbox.pack (button, True, True, 0)
			!C_TREE_CHANGE_STYLE_CMD!cmd.make (Current)
			button.add_action ("clicked", cmd)

			!!button.make_with_label ("Export Tree")
			hbox.pack (button, True, True, 0)
			-- TODO: call back
			
			!!hbox.make_horizontal (False, 5)
			mbox.pack (hbox, False, False, 0)
			
			!!button.make_with_label ("Select All")
			hbox.pack (button, True, True, 0)
			!C_TREE_SELECT_ALL_CMD!cmd.make (Current)
			button.add_action ("clicked", cmd)

			!!button.make_with_label ("Unselect All")
			hbox.pack (button, True, True, 0)
			!C_TREE_UNSELECT_ALL_CMD!cmd.make (Current)
			button.add_action ("clicked", cmd)

			!!button.make_with_label ("Remove Selection")
			hbox.pack (button, True, True, 0)
			!C_TREE_REMOVE_SELECTION_CMD!cmd.make (Current)
			button.add_action ("clicked", cmd)

			!!check_button.make_with_label ("Reorderable")
			hbox.pack (check_button, False, True, 0)
			tool_tips_controller.set_tool_tip ("Tree items can be reordered by dragging.",
											   check_button)
			check_button.set_state_down
			!C_TREE_TOGGLE_REORDERABLE!cmd.make (Current)
			check_button.add_action ("clicked", cmd)
			
			!!hbox.make_horizontal (True, 5)
			mbox.pack (hbox, False, False, 0)
			
			!C_TREE_TOGGLE_LINE_STYLE!m_cmd.make (Current)
			omenu1 := build_option_menu (<<"No lines", "Solid", "Dotted", "Tabbed">>, 3,
										   <<m_cmd, clone (m_cmd),
											 clone (m_cmd), clone (m_cmd)>>)
			hbox.pack (omenu1, False, True, 0)
			tool_tips_controller.set_tool_tip ("The tree's line style", omenu1)
			
			!C_TREE_TOGGLE_EXPANDER_STYLE!m_cmd.make (Current)
			omenu2 := build_option_menu (<<"None", "Square", "Triangle", "Circular">>, 2,
										   <<m_cmd, clone (m_cmd),
											 clone (m_cmd), clone (m_cmd)>>)
			hbox.pack (omenu2, False, True, 0) 
			tool_tips_controller.set_tool_tip ("The tree's expander style", omenu2)
			
			!C_TREE_TOGGLE_JUSTIFY!m_cmd.make (Current)
			omenu3 := build_option_menu (<<"Left", "Right">>, 1,
										   <<m_cmd, clone(m_cmd)>>)
			hbox.pack (omenu3, False, True, 0)				
			tool_tips_controller.set_tool_tip ("The tree's justification", omenu3)

			omenu4 := option_menu (ctree)
			hbox.pack (omenu4, False, True, 0)				
			tool_tips_controller.set_tool_tip ("The list's selection mode", omenu4)
			window.realize
			
			-- create needed pixmaps
			!!transparent.make
			transparent.set_pixel (0)
			!!pixmap1.make_from_xpm (window.gdk_window, transparent,
									 "book_closed.xpm")
			!!pixmap2.make_from_xpm (window.gdk_window, transparent,
									 "book_open.xpm")
			!!pixmap3.make_from_xpm (window.gdk_window, transparent,
									 "mini_page.xpm")
			
			ctree.set_size (0, 300)
			
			!!frame.make_no_label
			frame.set_border_width (0)
			frame.set_shadow_type (Gtk_shadow_out)
			vbox.pack (frame, False, True, 0)
			
			!!hbox.make_horizontal (True, 2)
			hbox.set_border_width (2)
			frame.add_widget (hbox)
			
			books := 1
			pair := build_frame ("Books :", books)
			hbox.pack (pair @ 1, False, True, 0)
			book_label ?= pair @ 2
			
			pair := build_frame ("Pages :", pages)
			hbox.pack (pair @ 1, False, True, 0)
			page_label ?= pair @ 2

			if ctree.selection /= Void then
				selected := ctree.selection.length
			end
			pair := build_frame ("Selected :", selected)
			hbox.pack (pair @ 1, False, True, 0)
			sel_label ?= pair @ 2

			if ctree.row_list /= Void then
				visible := ctree.row_list.length
			end
			pair := build_frame ("Visible :", visible)
			hbox.pack (pair @ 1, False, True, 0)
			vis_label ?= pair @ 2

			rebuild_tree
			
			window.show_all
		end

feature {NONE}

	build_frame (label_str: STRING; value: INTEGER): ARRAY [GTK_WIDGET] is
			-- to reduce the amount of repeated code in execute above
			-- return two items a frame and a label. Could really use 
			-- a TUPLE here.
		require
			label_str /= Void
		local
			hbox: GTK_BOX
			label, val_label: GTK_LABEL
			frame: GTK_FRAME
		do
			!!frame.make_no_label
			frame.set_shadow_type (Gtk_shadow_in)
			!!hbox.make_horizontal (False, 0)
			hbox.set_border_width (2)
			frame.add_widget (hbox)
			!!label.make (label_str)
			hbox.pack (label, False, True, 0)
			!!val_label.make (value.out)
			hbox.pack_end (val_label, False, True, 5)
-- Small Eiffel doesn't like this line. Bug in SE.
--			Result := <<frame, val_label>>
			!!Result.make (1,2)
			Result.put (frame, 1)
			Result.put (val_label, 2)
		end

feature  -- these routines can be called from the callbacks

	rebuild_tree is
		local
			label1, label2: STRING
			n, d, b, p: INTEGER
			parent_node: GTK_CTREE_NODE
			style: GTK_STYLE
			color: GDK_COLOR
		do
			label1 := "Root"
			label2 := ""
			
			d := spin1.value_as_integer
			b := spin2.value_as_integer
			p := spin3.value_as_integer

			n := (((pow (b, d) - 1.0) / (b - 1)) * (p + 1)).floor

			if n > 100000 then
				print (n)
				print (" total items? Try less. %N")
			else
				ctree.freeze
				ctree.clear_tree
				books := 1
				pages := 0
				parent_node := ctree.insert_node (Void, Void, <<label1, label2>>, 5, 
												  pixmap1, pixmap1.mask,
												  pixmap2, pixmap2.mask,
												  False, True)
				!!style.make
				!!color.make_rgb (0, 45000, 55000)
				style.set_base (color, Gtk_state_normal)

				ctree.node_set_row_style (parent_node, style)
				if ctree.line_style = Gtk_ctree_lines_tabbed then
					ctree.node_set_row_style (parent_node, style)
				end
				
				build_recursive (1, d, b, p, parent_node)
				
				ctree.thaw
				after_press
			end
		end

	build_recursive (cur_depth, depth, num_books, num_pages: INTEGER; 
					 parent_node: GTK_CTREE_NODE) is
		local
			i: INTEGER
			sibling: GTK_CTREE_NODE
			row: GTK_CTREE_ROW
			buf1, buf2: STRING
		do
			from i := num_pages + num_books
			until i <= num_books
			loop
				pages := pages + 1
				buf1 := clone ("Page ")
				buf1.append (pages.out)
				buf2 := clone ("Item: ")
				buf2.append (cur_depth.out)
				buf2.append ("-")
				buf2.append (i.out)
				sibling := ctree.insert_node (parent_node, sibling, <<buf1, buf2>>, 5,
											  pixmap3, pixmap3.mask,
											  Void, Void,
											  True, False)
				if parent_node /= Void then
					if ctree.line_style = Gtk_ctree_lines_tabbed then
						row := parent_node.data_as_ctree_row
						ctree.node_set_row_style (sibling, row.style)
					end
				end
					
				i := i - 1
			end
			if cur_depth < depth then
				-- recursion here
				from i := num_books until i = 0 loop
					books := books + 1
					buf1 := clone ("Book ")
					buf1.append (books.out)
					buf2 := clone ("Item ")
					buf2.append (cur_depth.out)
					buf2.append ("-")
					buf2.append (i.out)
					sibling := ctree.insert_node (parent_node, sibling, <<buf1, buf2>>, 5,
												  pixmap1, pixmap1.mask,
												  pixmap2, pixmap2.mask,
												  False, False)
					-- TODO: styles stuff here
					build_recursive (cur_depth + 1, depth, num_books, num_pages, sibling)
					i := i - 1
				end
				
			end
		end


	destroy is
		do
			window.destroy
			window := Void
			ctree := Void
		end


	after_press is
		local
			count: INTEGER
		do
			-- change the labels on the bottom of the main window to 
			-- show the state of the tree
			print ("After press...%N")
			if ctree.selection /= Void then
				count := ctree.selection.length
				print ("not void. count =")
			else
				print ("void. count =")
			end
			print (count) print ("%N")
			-- TODO: this number comes out wrong for some reason
			sel_label.set_text (count.out)
			if ctree.row_list /= Void then
				count := ctree.row_list.count
			else
				count := 0
			end
			vis_label.set_text (count.out)
			book_label.set_text (books.out)
			page_label.set_text (pages.out)
		end

feature {NONE}

	pow (x, y: DOUBLE): DOUBLE is
		external "C"
		end

end
