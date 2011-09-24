-- Copyright 2000 Luc Taesch and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class GNOME_APP_NON_PORTABLE_CALLS

inherit

	GNOME_APPLICATION_EXTERNALS

feature

	np_gnome_init_tool_kit (aid, av: STRING) is
		do
			c_gnome_init_tool_kit ($(aid.to_c), $(av.to_c))
		end

end
