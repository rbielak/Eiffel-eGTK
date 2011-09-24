-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class REPARENT

inherit

	GTK_COMMAND

feature

	window: WINDOW_WITH_CLOSE_BUTTON

	execute is
		local
			box2, box3: GTK_BOX
			label: GTK_LABEL
			frame: GTK_FRAME
			button: GTK_BUTTON
			cmd: REPARENT_CMD
		do
			!!window.make ("Reparent")
			!!box2.make_horizontal (False, 5)
			box2.set_border_width (10)
			window.box.pack (box2, True, True, 0)
			
			!!label.make ("Hello World")
			!!frame.make ("Frame 1")
			box2.pack (frame, True, True, 0)
			!!box3.make_vertical (False, 5)
			box3.set_border_width (5)
			frame.add_widget (box3)

			!!button.make_with_label ("switch")
			!!cmd.make (label, box3)
			-- cmd.connect ("clicked", button)
			button.add_action ("clicked", cmd)
			box3.pack (button, False, True, 0)
			box3.pack (label, False, True, 0)

			!!frame.make ("Frame 2")
			box2.pack (frame, True, True, 0)
			!!box3.make_vertical (False, 5)
			box3.set_border_width (5)
			frame.add_widget (box3)
			!!button.make_with_label ("switch")
			!!cmd.make (label, box3)
			-- cmd.connect ("clicked", button)
			button.add_action ("clicked", cmd)
			box3.pack (button, False, True, 0)

			window.show_all
		end

end

	
