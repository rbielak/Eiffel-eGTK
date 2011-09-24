-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class TEST_GTK

inherit

	GTK_APPLICATION

	GTK_CONSTANTS

creation

	make

feature

	make is
		do
			print ("*** Starting test_gtk %N")
			initialize_tool_kit
			set_locale 
--			parse_rc_file ("/home/nrichieb/Eiffel/gtk/examples/testgtk/testgtkrc")
			create_main_window
--			wait_for_events
			main_loop
		end

feature -- tests for all the widgets

	window: GTK_WINDOW
	quit: QUIT_COMMAND
	exit_command: EXIT_COMMAND

	box1, box2: GTK_BOX
	scrolled_window: GTK_SCROLLED_WINDOW
	separator: GTK_SEPARATOR
	-- buttons
	close_button: GTK_BUTTON


	create_main_window is
		do
			-- Create the window and set the quit command
			!!window.make_top_level
			window.set_title ("Main Window")
			window.set_size (200, 400)
			window.set_position (20, 20)
			!!quit.make (window)
			-- make a box for widgets
			!!box1.make_vertical (False, 0)
			window.add_widget (box1)
			-- make a scrolled region
			!!scrolled_window.make
			scrolled_window.set_border_width (10)
			scrolled_window.set_policy (GTK_POLICY_AUTOMATIC, GTK_POLICY_AUTOMATIC)
			box1.pack (scrolled_window, True, True, 0)
			-- make another box for buttons
			!!box2.make_vertical (False, 0)
			box2.set_border_width (10)
			scrolled_window.add_widget_with_viewport (box2)
			-- now make buttons in the new box
			make_buttons (box2)
			-- Make a button for closing the window
			!!separator.make_horizontal
			box1.pack (separator, False, False, 0)
			-- Make another box
			!!box2.make_vertical (False, 10)
			box1.pack (box2, False, True, 0)
			box2.set_border_width (10)
			!!close_button.make_with_label ("close")
			!!exit_command
			-- exit_command.connect ("clicked", close_button)
			close_button.add_action ("clicked", exit_command)
			box2.pack (close_button, True, True, 0)
			close_button.set_flags (close_button.Gtk_can_default)
			close_button.grab_default
			-- show all widgets
			window.show_all
		end
	
feature -- buttons

	labels: ARRAY [STRING] is
		once
			Result := <<
						"buttons",   -- 1
						"button box", -- 2
						"check buttons", -- 3
						"clist", -- 4
						"color selection", -- 5
						"ctree", -- 6
						"cursors", -- 7
						"dialog", -- 8
						"dnd", -- 9
						"entry", -- 10
						"file selection", -- 11
						"gamma curve", -- 12
						"handle box", -- 13
						"labels", -- 14
						"list", -- 15
						"menus", -- 16
						"note book", -- 17
						"panes", -- 18
						"pixmap", -- 19
						"preview color", -- 20
						"preview gray", -- 21
						"progress bar", -- 22
						"radio buttons", -- 23
						"range controls", -- 24
						"reparent", -- 25
						"rulers", -- 26
						"scrolled windows", -- 27
						"shapes", -- 28
						"test idle", -- 29
						"test scrolling", -- 30
						"test selection", -- 31
						"test timeout", -- 32
						"text", --33
						"toggle buttons", -- 34
						"toolbar", -- 35
						"tooltips", -- 36
						"tree" -- 37
						>>
		end

	buttons: ARRAY [GTK_BUTTON]

	command: ARRAY [GTK_COMMAND] is
		local
			cmd: GTK_COMMAND
		once
			!!Result.make (1, buttons.upper)
			!TOOLBARS!cmd
			Result.put (cmd, 35)

			!BUTTONS!cmd
			Result.put (cmd, 1)
			!BUTTON_BOXES!cmd
			Result.put (cmd, 2)

			!C_TREE_CMD!cmd
			Result.put (cmd, 6)

			!TOGGLE_BUTTONS!cmd
			Result.put (cmd, 34)
			!CHECK_BUTTONS!cmd
			Result.put (cmd, 3)
			!RADIO_BUTTONS!cmd
			Result.put (cmd, 23)
			-- TODO: Handle Box
			!REPARENT!cmd
			Result.put (cmd, 25)
			-- TODO: pixmap
			!TOOLTIPS!cmd
			Result.put (cmd, 36)
			-- TODO: menus
			-- TODO: scrolled windows
			-- TODO: drawing areas
			!TEXT_ENTRY!cmd
			Result.put (cmd, 10)
			!LIST_CMD!cmd
			Result.put (cmd, 15)

			!C_LIST_CMD!cmd
			Result.put  (cmd, 4)

			!COLOR_SELECTION_CMD!cmd
			Result.put (cmd, 5)

			!FILE_SELECTION_CMD!cmd
			Result.put (cmd, 11)

			!DIALOG_CMD!cmd
			Result.put (cmd, 8)

			!NOTEBOOK_CMD!cmd
			Result.put (cmd, 17)

			!GAMMA_CURVE_CMD!cmd
			Result.put (cmd, 12)

			!TREE_CMD!cmd
			Result.put (cmd, 37)

		end

	make_buttons (box: GTK_BOX) is
		local
			button: GTK_BUTTON
			i: INTEGER
		do
			!!buttons.make (1, labels.count)
			from i := 1
			until i > buttons.upper
			loop
				!!button.make_with_label (labels @ i)
				if command @ i = Void then
					button.set_sensitive (False)
				else
					-- command.item(i).connect ("clicked", button)
					button.add_action ("clicked", command @ i)
				end
				buttons.put (button, i)
				box.pack (button, True, True, 0)
				i := i + 1
			end
		end

end
