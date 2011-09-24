-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class TEXT_ENTRY

inherit

	GTK_COMMAND

feature

	entry: GTK_ENTRY

	read_entry: READ_ENTRY_CMD

	window: WINDOW_WITH_CLOSE_BUTTON

	execute is
		do
			!!window.make ("Text Entry")
			window.box.set_border_width (10)
			!!entry.make
			entry.set_text ("Hello there!!")
			!!read_entry
			-- read_entry.connect ("activate", entry)
			entry.add_action ("activate", read_entry)
			window.box.pack (entry, True, True, 0)
			window.show_all
		end

end
