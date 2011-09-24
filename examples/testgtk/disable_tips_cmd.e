-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class DISABLE_TIPS_CMD

inherit

	TOOLBAR_CMD

	GTK_CONSTANTS

creation

	make

feature

	execute is
		do
			toolbar.disable_tooltips
		end
			
end
