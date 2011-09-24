-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class BUTTON_CMD

inherit

	GTK_COMMAND

creation

	make

feature

	make (this_button, other_button: GTK_BUTTON) is
		require
			other_button /= Void
		do
			connect ("clicked", this_button)
			button := other_button
		end


	execute is
		do
			if button.visible then
				button.hide
			else
				button.show
			end
		end

	button: GTK_BUTTON

end
