class C_LIST_CMD

inherit

	GTK_COMMAND

	GTK_CONSTANTS

	GTK_SELECTIONMODE_ENUM

	GTK_JUSTIFICATION_ENUM

	GTK_STATETYPE_ENUM

	OPTIONS_MENU

feature

	window: GTK_WINDOW

	clist: GTK_CLIST

	titles: ARRAY [STRING] is
		once
			Result := <<"auto resize", "not resizeable", "max width 100", "min width 50",
						"hide column", "Title 5", "Title 6", "Title 7",
						"Title 8",  "Title 9",  "Title 10", "Title 11">>
		end

	execute is
		local
			clist_rows: INTEGER
			vbox, hbox: GTK_BOX
			scrolled_win: GTK_SCROLLED_WINDOW
			button: GTK_BUTTON
			check_button: GTK_CHECK_BUTTON
			label: GTK_LABEL
			separator: GTK_SEPARATOR
			close_cmd: CLOSE_WINDOW_COMMAND
			i: INTEGER
			texts: ARRAY [STRING]
			str: STRING
			col2, col1: GDK_COLOR
			style: GTK_STYLE
			cmd: GTK_COMMAND
		do
			clist_rows := 0
			!!window.make_top_level
			window.set_title ("clist")
			window.set_border_width (0)

			!!vbox.make_vertical (False, 0)
			window.add_widget (vbox)

			!!scrolled_win.make
			scrolled_win.set_border_width (5)
			scrolled_win.set_policy (Gtk_policy_automatic, Gtk_policy_automatic)

			-- create a GTK_CLIST
			!!clist.make_with_titles (titles)
			scrolled_win.add_widget (clist)
			!C_LIST_CLICK_COLUMN_CMD!cmd.make (clist)
			clist.add_action ("click_column", cmd)

			-- control buttons
			!!hbox.make_horizontal (False, 5)
			hbox.set_border_width (5)
			vbox.pack (hbox, False, False, 0)

			!!button.make_with_label ("Insert Row")
			hbox.pack (button, True, True, 0)
			!C_LIST_INSERT_ROW_CMD!cmd.make (clist)
			button.add_action ("clicked", cmd)

			!!button.make_with_label ("Add 1,000 Rows with Pixmaps")
			hbox.pack (button, True, True, 0)
			!C_LIST_ADD1000_CMD!cmd.make (clist)
			button.add_action ("clicked", cmd)

			!!button.make_with_label ("Add 10,000 Rows")
			hbox.pack (button, True, True, 0)
			!C_LIST_ADD10000_CMD!cmd.make (clist)
			button.add_action ("clicked", cmd)

			-- second layer of buttons
			!!hbox.make_horizontal (False, 5)
			hbox.set_border_width (5)
			vbox.pack (hbox, False, False, 0)

			!!button.make_with_label ("Clear List")
			hbox.pack (button, True, True, 0)
			!C_LIST_CLEAR_CMD!cmd.make (clist)
			button.add_action ("clicked", cmd)

			!!button.make_with_label ("Remove Selection")
			hbox.pack (button, True, True, 0)
			!C_LIST_REMOVE_SELECTION_CMD!cmd.make (clist)
			button.add_action ("clicked", cmd)			

			!!button.make_with_label ("Undo Selection")
			hbox.pack (button, True, True, 0)
			!C_LIST_UNDO_SELECTION_CMD!cmd.make (clist)
			button.add_action ("clicked", cmd) 

			!!button.make_with_label ("Warning Test")
			hbox.pack (button, True, True, 0)
			!C_LIST_WARNING_TEST_CMD!cmd.make (clist)
			button.add_action ("clicked", cmd)


			-- third layer of buttons
			!!hbox.make_horizontal (False, 5)
			hbox.set_border_width (5)
			vbox.pack (hbox, False, False, 0)
			
			!!check_button.make_with_label ("Show Title Buttons")
			hbox.pack (check_button, False, False, 0)
			check_button.set_state_down
			!C_LIST_SHOW_TITLE_BUTTONS!cmd.make (clist)
			check_button.add_action ("clicked", cmd)

			!!check_button.make_with_label ("Reorderable")
			hbox.pack (check_button, False, True, 0)
			check_button.set_state_down
			!C_LIST_TOGGLE_REORDERABLE_CMD!cmd.make (clist)
			check_button.add_action ("clicked", cmd)

			!!label.make ("Selection Mode")
			hbox.pack (label, False, True, 0)
			hbox.pack (option_menu (clist), False, True, 0)

			-- rest of CLIST configuration
			vbox.pack (scrolled_win, True, True, 0)
			
			clist.set_row_height (18)
			clist.set_size (-1, 300)

			-- set stuff for each column
			from i := 0 until i >= titles.count loop
				clist.set_column_width (i, 80)
				i := i + 1
			end
			
			clist.set_column_auto_resizeable (0, True)
			clist.set_column_resizeable (1, False)
			clist.set_column_maximum_width (2, 100)
			clist.set_column_minimum_width (3, 50)
			clist.set_selection_mode (Gtk_selection_extended)
			clist.set_column_justification (1, Gtk_justify_right)
			clist.set_column_justification (2, Gtk_justify_center)

			-- style and fonts
			-- *** TODO: debug this - setting style doesn't work right on 
			-- a row. I just get black background with black foreground
			!!col1.make_rgb (5600, 0, 0)
			!!col2.make_rgb (0, 5600, 3200)
			!!style.make
			style.set_fg (col1, Gtk_state_normal)
			style.set_base (col2, Gtk_state_normal)
			-- TODO style font

			!!texts.make (1, titles.count)
			from i := 1 until i > titles.count loop
				str := clone ("Column ")
				str.append (i.out)
				texts.put (str, i)
				i := i + 1
			end
			texts.put ("Right", 1)
			texts.put ("Center", 2)

			-- set data in the list
			from i := 0 until i >= 10 loop
				clist.append_row (texts)
				-- **** TODO: debug this
--				clist.set_row_style (i, style)
--				else
--					clist.set_cell_style (i, i \\ 4, style)
--				end
				i := i + 1
			end

			-- close button
			!!separator.make_horizontal
			vbox.pack (separator, False, True, 0)
			!!hbox.make_horizontal (False, 0)
			vbox.pack (hbox, False, True, 0)
			!!button.make_with_label ("Close")
			hbox.pack (button, True, True, 0)
			!!close_cmd.make (window)
			button.add_action ("clicked", close_cmd)
			button.set_flags (button.Gtk_can_default)
			button.grab_default

			window.show_all
		end

end
