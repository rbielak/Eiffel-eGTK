-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class READ_ENTRY_CMD

inherit

	GTK_COMMAND
		redefine
			parent
		end

feature

	parent: GTK_ENTRY

	execute is
		do
			print ("The text entered was: ")
			print (parent.text)
			print ("%N")
		end

end
