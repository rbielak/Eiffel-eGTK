-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "EGTK_SHARED_TOOLTIPS - shared tooltip controller"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"

class EGTK_SHARED_TOOLTIPS

feature

	tool_tips_controller: GTK_TOOLTIPS is
		once
			create Result
		end

end
