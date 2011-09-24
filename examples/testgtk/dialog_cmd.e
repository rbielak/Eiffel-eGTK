-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class DIALOG_CMD

inherit

	GTK_COMMAND

	GTK_CONSTANTS

feature

	simple_dialog: GTK_DIALOG

	
	execute is
		local
			button: GTK_BUTTON
			toggle: TOGGLE_CMD
		do
			!!simple_dialog.make
			simple_dialog.set_title ("Dialog")
			simple_dialog.set_border_width (0)
			-- add some buttons
			!!button.make_with_label ("OK")
			simple_dialog.action_area.set_border_width (10)
			simple_dialog.action_area.pack (button, True, True, 0)
			-- set as default
			button.set_flags (button.Gtk_can_default)
			button.grab_default
			!!button.make_with_label ("Toggle")
			simple_dialog.action_area.pack (button, True, True, 0)			
			-- define callback for button
			!!toggle.make (simple_dialog)
			-- toggle.connect ("clicked", button)
			button.add_action ("clicked", toggle)
			-- simple_dialog.set_modal (True)
			simple_dialog.show_all
		end

end
