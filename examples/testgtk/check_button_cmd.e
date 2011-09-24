-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class CHECK_BUTTON_CMD

inherit

	GTK_COMMAND
		redefine
			parent
		end
		

feature

	execute is
		do
			if parent.button_is_up then
				io.putstring ("Button is up%N")
			else
				io.putstring ("Button is down%N")
			end
		end


	parent: GTK_TOGGLE_BUTTON

end
