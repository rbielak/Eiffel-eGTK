-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class RADIO_BUTTONS

inherit

	GTK_COMMAND

feature

	window: WINDOW_WITH_CLOSE_BUTTON

	execute is
		local
			box2: GTK_BOX
			button1, button2, button3: GTK_RADIO_BUTTON
		do
			!!window.make ("Radio Buttons")
			!!box2.make_vertical (False, 10)
			box2.set_border_width (1)
			window.box.pack (box2, True, True, 0)
			!!button1.make_with_label ("Button 1")
			box2.pack (button1, True, True, 0)
			!!button2.make_in_group_with_label(button1, "Button 2")
			button2.set_state_up
			box2.pack (button2, True, True, 0)			
			!!button3.make_in_group_with_label (button2, "Button 3")
			box2.pack (button3, True, True, 0) 
			window.show_all
		end

end
