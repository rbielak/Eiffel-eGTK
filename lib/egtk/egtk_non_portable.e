-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Once function that gives reference to all non-%
                 %portable calls"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"

class EGTK_NON_PORTABLE

feature {NONE}

	npc: GTK_NON_PORTABLE_CALLS is
		once
			create Result
		end

	gdk_npc: GDK_NON_PORTABLE_CALLS is
		once
			create Result
		end

	egtk_npc: EGTK_NON_PORTABLE_CALLS is
		once
			create Result
		end

end -- EGTK_NON_PORTABLE
