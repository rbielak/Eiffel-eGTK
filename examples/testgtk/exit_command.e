-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class EXIT_COMMAND

inherit

	GTK_COMMAND

	GTK_APPLICATION

feature

	execute is
		do
			exit (0)
		end

end
