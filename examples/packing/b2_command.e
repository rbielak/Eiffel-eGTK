-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class B2_COMMAND

inherit
	
	GTK_COMMAND

feature

	execute is
		do
			print ("Button 2 was pressed %N")
		end

end
