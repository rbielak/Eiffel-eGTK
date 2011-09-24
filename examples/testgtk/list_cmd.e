-- Copyright 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class LIST_CMD

inherit

	GTK_COMMAND

	GTK_CONSTANTS

	GTK_SELECTIONMODE_ENUM

	OPTIONS_MENU

feature

	window: WINDOW_WITH_CLOSE_BUTTON

	list: GTK_LIST

	make_item (label: STRING): GTK_LIST_ITEM is
		do
			!!Result.make_with_label (label)
		end

	execute is
		local
			cbox, vbox, hbox: GTK_BOX
			scrolled_win: GTK_SCROLLED_WINDOW
			button: GTK_BUTTON
			label: GTK_LABEL
			omenu: GTK_OPTION_MENU
			cmd: GTK_COMMAND
		do
			!!window.make ("List")
			vbox := window.box
			!!scrolled_win.make 
			scrolled_win.set_border_width (5)
			scrolled_win.set_size (-1, 300)
			vbox.pack (scrolled_win, True, True, 0)
			scrolled_win.set_policy (Gtk_policy_automatic, Gtk_policy_automatic)

			!!list.make
			list.set_selection_mode (Gtk_selection_extended)
			scrolled_win.add_widget_with_viewport (list)

			list.set_focus_vadjustment (scrolled_win.vadjustment)
			list.set_focus_hadjustment (scrolled_win.hadjustment)
			
			add_items_to_list (list)

			-- buttons for fiddling with the list
			!!hbox.make_horizontal (True, 5)
			hbox.set_border_width (5)
			vbox.pack (hbox, False, True, 0)

			!!button.make_with_label ("Insert Row")
			!LIST_ADD_CMD!cmd.make (list)
			button.add_action ("clicked", cmd)
			hbox.pack (button, True, True, 0)

			!!button.make_with_label ("Clear List")
			!LIST_CLEAR_CMD!cmd.make (list)
			button.add_action ("clicked", cmd)
			hbox.pack (button, True, True, 0)

			!!button.make_with_label ("Remove Selection")
			!LIST_REMOVE_SELECTION_CMD!cmd.make (list)
			button.add_action ("clicked", cmd)
			hbox.pack (button, True, True, 0)

			!!cbox.make_horizontal (False, 0)
			vbox.pack (cbox, False, True, 0)
			
			!!hbox.make_horizontal (False, 5)
			hbox.set_border_width (5)
			cbox.pack (hbox, True, False, 0)
			
			!!label.make ("Selection Mode:")
			hbox.pack (label, False, True, 0)

			omenu := option_menu (list)
			hbox.pack (omenu, False, True, 0)

			window.show_all
		end


	add_items_to_list (llist: GTK_LIST) is
		local
			i: INTEGER
			item: GTK_LIST_ITEM
		do
			from i := 0
			until i > 20
			loop
				item := make_item (clone ("The quick brown fox jumped %
                                          %over the lazy dog."))
				llist.add_widget (item)
				i := i + 1
			end
		end

end
