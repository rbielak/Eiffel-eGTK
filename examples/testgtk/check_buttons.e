-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class CHECK_BUTTONS

inherit

	GTK_COMMAND

feature

	window: WINDOW_WITH_CLOSE_BUTTON

	execute is
		local
			box2: GTK_BOX
			button: GTK_CHECK_BUTTON
		do
			!!window.make ("Check Buttons")
			!!box2.make_vertical (False, 10)
			box2.set_border_width (10)
			!!button.make_with_label ("Button 1")
			box2.pack (button, True, True, 0)
			!!button.make_with_label ("Button 2")
			box2.pack (button, True, True, 0)
			!!button.make_with_label ("Button 2")
			box2.pack (button, True, True, 0)
			window.box.pack (box2, True, True, 0)
			window.show_all
		end

end

