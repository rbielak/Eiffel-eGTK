-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class HELLO_COMMAND

inherit

	GTK_COMMAND

feature


	execute is
		do
			print ("Hello button pressed%N")
		end

end
