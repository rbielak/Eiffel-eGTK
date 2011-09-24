-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
deferred class TOOLBAR_CMD

inherit

	GTK_COMMAND

	GTK_CONSTANTS


feature

	make (t: like toolbar) is
		require
			t_not_void: t /= Void
		do
			toolbar := t
		end

	toolbar: GTK_TOOLBAR
			
end
