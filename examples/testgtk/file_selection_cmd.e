-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class FILE_SELECTION_CMD

inherit

	GTK_COMMAND

feature

	selector: GTK_FILE_SELECTION

	execute is
		local
			ok, cancel: FILE_CMD
		do
			!!selector.make_with_title ("Test Selector")
			selector.hide_file_ops_buttons
			!!ok.make_as_ok (selector)
			-- ok.connect ("clicked", selector.ok)
			selector.ok.add_action ("clicked", ok)
			!!cancel.make_as_cancel (selector)
			-- cancel.connect ("clicked", selector.cancel)
			selector.cancel.add_action ("clicked", cancel)
			selector.show
		end

end
