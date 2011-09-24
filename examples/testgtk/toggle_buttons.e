-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class TOGGLE_BUTTONS

inherit

	GTK_COMMAND

feature

	window: WINDOW_WITH_CLOSE_BUTTON

	execute is
		local
			box2: GTK_BOX
			toggle_button: GTK_TOGGLE_BUTTON
		do
			!!window.make ("Toggle Buttons")
			!!box2.make_vertical (False, 10)
			box2.set_border_width (10)
			window.box.pack (box2, True, True, 0)
			!!toggle_button.make_with_label ("Button1")
			box2.pack (toggle_button, True, True, 0)
			!!toggle_button.make_with_label ("Button2")
			box2.pack (toggle_button, True, True, 0)
			!!toggle_button.make_with_label ("Button2")
			box2.pack (toggle_button, True, True, 0)
			window.show_all
		end


end
