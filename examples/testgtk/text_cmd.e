-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class TEXT_CMD

inherit

	TOOLBAR_CMD

	GTK_CONSTANTS

creation

	make

feature

	execute is
		do
			toolbar.set_style (GTK_TOOLBAR_TEXT)
		end
			
end
