-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Window with two boxes, where the bottom box has a %
                 %close button"

class WINDOW_WITH_CLOSE_BUTTON 

inherit

	GTK_WINDOW

creation

	make

feature

	make (label: STRING) is
		require
			label /= Void
		local
			close_cmd: CLOSE_WINDOW_COMMAND
			close_button: GTK_BUTTON
			separator: GTK_SEPARATOR
		do
			make_top_level
			set_title (label)
			!!close_cmd.make (Current)
			close_cmd.connect ("delete_event", Current)
			-- make the boxes
			!!enclosing_box.make_vertical (False, 0)
			add_widget (enclosing_box)
			!!box.make_vertical (False, 0)
			enclosing_box.pack (box, True, True, 0)
			!!separator.make_horizontal
			enclosing_box.pack (separator, False, False, 0)
			-- make the close button
			!!button_box.make_horizontal (False, 10)
			button_box.set_border_width (10)
			enclosing_box.pack (button_box, False, True, 0)
			!!close_button.make_with_label ("close")
			!!close_cmd.make (Current)
			close_cmd.connect ("clicked", close_button)
			button_box.pack (close_button, True, True, 0)
			close_button.set_flags (Gtk_can_default)
			close_button.grab_default
		end

feature -- windows is composed of one box containg two others

	box: GTK_BOX

	enclosing_box: GTK_BOX

	button_box: GTK_BOX

end	
