class EVENTS_TESTER

inherit

	GTK_APPLICATION

creation

	make

feature

	main_window: GTK_WINDOW

	make is
		do
			initialize_tool_kit
			!!main_window.make_top_level
			build_widgets
			main_window.show_all
			main_loop
		end

	build_widgets is
		local
			vbox: GTK_BOX
			button: GTK_BUTTON
			text_entry: GTK_ENTRY
			cmd: GDK_EVENT_COMMAND
			text: GTK_TEXT
		do
			-- add some widgets to the window
			!!vbox.make_vertical (False, 2)
			main_window.add_widget (vbox)
			-- add a button
			!!button.make_with_label ("Events Button")
			vbox.pack (button, False, False, 1)
			-- add text entry
			!!text_entry.make
			vbox.pack (text_entry, False, False, 1)
			-- add text area
			!!text.make 
			vbox.pack (text, False, False, 2)
			text.append_text ("This widget just listens%N for keypresses")

			-- add callbacks
			!EGTK_QUIT_COMMAND!cmd
			main_window.add_action ("delete_event", cmd)

			-- Testing events on text widget
			!ON_EVENT_ACTIVATE!cmd.make ("key_press_event")
			text.add_action ("key_press_event", cmd)

			!ON_EVENT_ACTIVATE!cmd.make ("key_release_event")
			text.add_action ("key_release_event", cmd)

			!ON_EVENT_ACTIVATE!cmd.make ("selection_notify_event")
			text.add_action ("selection_notify_event", cmd)

			!ON_EVENT_ACTIVATE!cmd.make ("selection_clear_event")
			text.add_action ("selection_clear_event", cmd)

			!ON_EVENT_ACTIVATE!cmd.make ("selection_request_event")
			text.add_action ("selection_request_event", cmd)

			-- testing events on text_entry widget
			!ON_EVENT_ACTIVATE!cmd.make ("key_press_event")
			text_entry.add_action ("key_press_event", cmd)

			-- testing events on button widget
			!ON_EVENT_ACTIVATE!cmd.make ("focus_in_event")
			button.add_action ("focus_in_event", cmd)

			!ON_EVENT_ACTIVATE!cmd.make ("focus_out_event")
			button.add_action ("focus_out_event", cmd)

			!ON_EVENT_ACTIVATE!cmd.make ("enter_notify_event")
			button.add_action ("enter_notify_event", cmd)

			!ON_EVENT_ACTIVATE!cmd.make ("leave_notify_event")
			button.add_action ("leave_notify_event", cmd)

			!ON_EVENT_ACTIVATE!cmd.make ("button_press_event")
			button.add_action ("button_press_event", cmd)

			!ON_EVENT_ACTIVATE!cmd.make ("button_release_event")
			button.add_action ("button_release_event", cmd)

		end

end
