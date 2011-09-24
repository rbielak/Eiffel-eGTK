-- Copyright 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--

class CREATE_TREE_CMD

inherit

	GTK_COMMAND

	GTK_SELECTIONMODE_ENUM

	GTK_CONSTANTS

creation

	make

feature

	tree_parameters: TREE_CMD
			-- this object contains references to all the widgets 
			-- that specify tree creation parameters

	make (tree_parms: TREE_CMD) is
		require
			not_void: tree_parms /= Void
		do
			tree_parameters := tree_parms
		end

	execute is
		local
			selection_mode,
			nb_item,
			recursion_level: INTEGER
			view_line, draw_line, no_root_item: BOOLEAN
		do
			-- get selection mode
			if tree_parameters.single_button.button_is_down then
				selection_mode := Gtk_selection_single
			elseif tree_parameters.browse_button.button_is_down then
				selection_mode := Gtk_selection_browse
			else
				selection_mode := Gtk_selection_multiple
			end
			-- get options choice
			draw_line := tree_parameters.draw_line_button.button_is_down
			view_line := tree_parameters.view_line_button.button_is_down
			no_root_item := tree_parameters.no_root_item_button.button_is_down
			-- get levels
			nb_item := tree_parameters.nb_of_item_spinner.value_as_integer
			recursion_level := tree_parameters.recursion_spinner.value_as_integer
			if recursion_level > 100 then
				print ("Recursion level too large, try something less. %N")
			else
				create_tree (selection_mode, draw_line, view_line, no_root_item,
							 nb_item, recursion_level)
			end
		end

feature -- tree window widgets

	window: GTK_WINDOW

	root_tree: GTK_TREE

	add_button,
	remove_button,
	subtree_button: GTK_BUTTON

feature -- callbacks

	tree_changed: TREE_CHANGED_CMD
	
	add_cmd: TREE_ADD_ITEM_CMD

	remove_cmd: TREE_REMOVE_ITEMS_CMD

	remove_subtree_cmd: TREE_REMOVE_SUBTREE_CMD

feature -- creation of tree


	create_tree (selection_mode: INTEGER;
				 draw_line, view_line, no_root_item: BOOLEAN;
				 nb_item_max, recursion_level_max: INTEGER) is
		local
			box1, box2: GTK_BOX
			scrolled_win: GTK_SCROLLED_WINDOW
			button: GTK_BUTTON
			close_cmd: CLOSE_WINDOW_COMMAND
			separator: GTK_SEPARATOR
			root_item: GTK_TREE_ITEM
		do
			-- create a top level window
			!!window.make_top_level
			window.set_title ("Tree Sample")
			!!box1.make_vertical (False, 0)
			window.add_widget (box1)
			
			-- create a tree box
			!!box2.make_vertical (False, 0)
			box1.pack (box2, True, True, 0)
			box2.set_border_width (5)

			-- create a scrolled window
			!!scrolled_win.make
			scrolled_win.set_policy (Gtk_policy_automatic, Gtk_policy_automatic)
			box2.pack (scrolled_win, True, True, 0)
			scrolled_win.set_size (200, 200)

			-- create a tree widget
			!!root_tree.make
			!!tree_changed.make (Current)
			root_tree.add_action ("selection_changed", tree_changed)
			scrolled_win.add_widget_with_viewport (root_tree)
			root_tree.set_selection_mode (selection_mode)
			if draw_line then
				root_tree.set_view_lines (1)
			else
				root_tree.set_view_lines (1)
			end
			if view_line then
				root_tree.set_view_mode (Gtk_tree_view_line)
			else
				root_tree.set_view_mode (Gtk_tree_view_item)
			end
			if no_root_item then
				create_subtree (root_tree, -1, nb_item_max, recursion_level_max)
			else
				-- create a root item
				!!root_item.make_with_label ("root item")
				-- ?? root_tree.append_item (root_item)
				root_tree.add_widget (root_item)
				create_subtree (root_item, 1, nb_item_max, recursion_level_max)
			end
			-- create buttons
			!!box2.make_vertical (False, 0)
			box1.pack (box2, False, False, 0)
			box2.set_border_width (5)
			!!add_button.make_with_label ("Add Item")
			!!add_cmd.make (root_tree)
			add_button.add_action ("clicked", add_cmd)
			add_button.set_sensitive (False)
			box2.pack (add_button, True, True, 0)

			!!remove_button.make_with_label ("Remove Item(s)")
			!!remove_cmd.make (root_tree)
			remove_button.add_action ("clicked", remove_cmd)
			remove_button.set_sensitive (False)
			box2.pack (remove_button, True, True, 0)

			!!subtree_button.make_with_label ("Remove (Subtree)")
			!!remove_subtree_cmd.make (root_tree)
			subtree_button.add_action ("clicked", remove_subtree_cmd)
			subtree_button.set_sensitive (False)
			box2.pack (subtree_button, True, True, 0)

			-- separator and close window button
			!!separator.make_horizontal
			box1.pack (separator, False, False, 0)
			!!box2.make_vertical (False, 0)
			box1.pack (box2, False, False, 0)
			box2.set_border_width (5)
			!!button.make_with_label ("Close")
			!!close_cmd.make (window)
			button.add_action ("clicked", close_cmd)
			box2.pack (button, True, True, 0)

			window.show_all
		end

	create_subtree (item: GTK_WIDGET; level, nb_item_max, recursion_level_max: INTEGER) is
		local
			item_subtree: GTK_TREE
			an_item: GTK_TREE_ITEM
			item_new: GTK_TREE_ITEM
			no_root_item: BOOLEAN
			l_level, nb_item: INTEGER
			label: STRING
		do
			if level < recursion_level_max then
				if level = -1 then
					l_level := 0
					item_subtree ?= item
					no_root_item := True
				else
					l_level := level
					an_item ?= item
					!!item_subtree.make 
				end

				from nb_item := 0 until nb_item > nb_item_max loop
					label := clone ("item ")
					label.append (level.out)
					label.append ("-")
					label.append (nb_item.out)
					!!item_new.make_with_label (label)
					-- ?? item_subtree.append_item (item_new)
					item_subtree.add_widget (item_new)
					create_subtree (item_new, l_level+1, nb_item_max, recursion_level_max)
					item_new.show
					nb_item := nb_item + 1
				end
				if not no_root_item then
					an_item.set_subtree (item_subtree)
				end
			end

		end

end
