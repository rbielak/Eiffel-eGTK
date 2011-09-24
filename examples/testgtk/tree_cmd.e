-- Copyright 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--

class TREE_CMD

inherit

	GTK_COMMAND

feature -- widgets

	window: GTK_WINDOW

	single_button, 
	browse_button, 
	multiple_button: GTK_RADIO_BUTTON

	view_line_button,
	draw_line_button,
	no_root_item_button: GTK_CHECK_BUTTON

	nb_of_item_spinner,
	recursion_spinner: GTK_SPIN_BUTTON

	create_tree,
	close: GTK_BUTTON


feature -- callbacks

	close_cmd: CLOSE_WINDOW_COMMAND

	create_cmd: CREATE_TREE_CMD

feature -- main code of this command

	execute is
		local
			frame: GTK_FRAME
			box1, box2, box3, box4, box5: GTK_BOX
			label: GTK_LABEL
			adj: GTK_ADJUSTMENT
			separator: GTK_SEPARATOR
		do
			-- Top level window
			!!window.make_top_level
			window.set_title ("Set Tree Parameters")
			!!box1.make_vertical (False, 0)
			window.add_widget (box1)
			
			-- create upper box - selection box
			!!box2.make_vertical (False, 5)
			box1.pack (box2, True, True, 0)
			box2.set_border_width (5)
			!!box3.make_horizontal (False, 5)
			box2.pack (box3, True, True, 0)
			
			-- create selection frame
			!!frame.make ("Selection Mode")
			box3.pack (frame, True, True, 0)
			!!box4.make_vertical (False, 0)
			frame.add_widget (box4)
			box4.set_border_width (4)

			-- create a radio button
			!!single_button.make_with_label ("SINGLE")
			box4.pack (single_button, True, True, 0)
			!!browse_button.make_in_group_with_label (single_button, "BROWSE")
			box4.pack (browse_button, True, True, 0)
			!!multiple_button.make_in_group_with_label (browse_button, "MULTIPLE")
			box4.pack (multiple_button, True, True, 0)

			-- create option mode frame
			!!frame.make ("Options")
			box3.pack (frame, True, True, 0)
			!!box4.make_vertical (False, 0)
			frame.add_widget (box4)
			box4.set_border_width (5)

			-- create a check button
			!!draw_line_button.make_with_label ("Draw Line")
			box4.pack (draw_line_button, True, True, 0)
			!!view_line_button.make_with_label ("View Line mode")
			view_line_button.set_state_down
			box4.pack (view_line_button, True, True, 0)
			!!no_root_item_button.make_with_label ("Without Root item")
			box4.pack (no_root_item_button, True, True, 0)			

			-- create recursion parameters
			!!frame.make ("Size Parameters")
			box2.pack (frame, True, True, 0)
			!!box4.make_horizontal (False, 5)
			frame.add_widget (box4)
			box4.set_border_width (5)

			-- create number of item spin button
			!!box5.make_horizontal (False, 5)
			box4.pack (box5, False, False, 0)
			!!label.make ("Number of items : ")
			label.set_alignment (0, 0.5)
			box5.pack (label, False, True, 0)

			!!adj.make (3.0, 1.0, 255.0, 1.0, 5.0, 0.0)
			!!nb_of_item_spinner.make (adj, 0, 0)
			box5.pack (nb_of_item_spinner, False, True, 0)

			--  create recursion level spin button 
			!!box5.make_horizontal (False, 5)
			box4.pack (box5, False, False, 0)
			!!label.make ("Depth : ")
			label.set_alignment (0, 0.5)
			box5.pack (label, False, True, 0)

			!!adj.make (3.0, 0.0, 255.0, 1.0, 5.0, 0.0)
			!!recursion_spinner.make (adj, 0, 0)
			box5.pack (recursion_spinner, False, True, 0)

			-- create a horizontal separator
			!!separator.make_horizontal
			box1.pack (separator, False, False, 0)

			-- create bottom button box
			!!box2.make_horizontal (True, 10)
			box1.pack (box2, False, False, 0)
			box2.set_border_width (5)

			!!create_tree.make_with_label ("Create Tree")
			box2.pack (create_tree, True, True, 0)
			!!create_cmd.make (Current)
			create_tree.add_action ("clicked", create_cmd)

			!!close.make_with_label ("Close")
			box2.pack (close, True, True, 0)
			!!close_cmd.make (window)
			close.add_action ("clicked", close_cmd)


			window.show_all
		end

end
