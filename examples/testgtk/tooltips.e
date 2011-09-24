-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class TOOLTIPS

inherit
	
	GTK_COMMAND

	EGTK_SHARED_TOOLTIPS

feature

	window: WINDOW_WITH_CLOSE_BUTTON

	execute is
		local
			box2: GTK_BOX
			button: GTK_TOGGLE_BUTTON
		do
			-- make a window with three buttons
			!!window.make ("Tooltips")
			-- add three buttons
			!!box2.make_vertical (False, 10)
			box2.set_border_width (10)
			window.box.pack (box2, True, True, 0)
			-- make the buttons
			!!button.make_with_label ("button1")
			box2.pack (button, True, True, 0)
			tool_tips_controller.set_tool_tip ("This is button 1", button)

			!!button.make_with_label ("button2")
			box2.pack (button, True, True, 0)
			tool_tips_controller.set_tool_tip ("This is button 2", button)

			!!button.make_with_label ("button3")
			box2.pack (button, True, True, 0)
			tool_tips_controller.set_tool_tip ("This is button 3. This is also a really long tooltip which probably won't fit on a single line and will therefore need to be wrapped. Hopefully the wrapping will work correctly.", button)


			window.show_all
		end

end
