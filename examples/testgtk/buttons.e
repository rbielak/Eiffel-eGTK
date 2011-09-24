-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class BUTTONS

inherit

	GTK_COMMAND

	GTK_CONSTANTS

feature

	window: WINDOW_WITH_CLOSE_BUTTON

	execute is
		local
			button: GTK_BUTTON
			flags: INTEGER
			button_cmd: BUTTON_CMD
			i: INTEGER
			table: GTK_TABLE
			buttons: ARRAY [GTK_BUTTON]
		do
			!!buttons.make (1, 9)
			!!window.make ("Buttons")
			!!table.make (3, 3, False)
			table.set_row_spacings (5)
			table.set_column_spacings (5)
			table.set_border_width (10)

			flags := GTK_EXPAND + GTK_FILL
			
			!!button.make_with_label ("button1")
			table.attach (button, 0, 1, 0, 1, flags, flags, 0, 0)
			buttons.put (button, 1)

			!!button.make_with_label ("button2")
			table.attach (button, 1, 2, 1, 2, flags, flags, 0, 0)
			buttons.put (button, 2)

			!!button.make_with_label ("button3")
			table.attach (button, 2, 3, 2, 3, flags, flags, 0, 0)
			buttons.put (button, 3)

			!!button.make_with_label ("button4")
			table.attach (button, 0, 1, 2, 3, flags, flags, 0, 0)
			buttons.put (button, 4)

			!!button.make_with_label ("button5")
			table.attach (button, 2, 3, 0, 1, flags, flags, 0, 0)
			buttons.put (button, 5)

			!!button.make_with_label ("button6")
			table.attach (button, 1, 2, 2, 3, flags, flags, 0, 0)
			buttons.put (button, 6)

			!!button.make_with_label ("button7")
			table.attach (button, 1, 2, 0, 1, flags, flags, 0, 0)
			buttons.put (button, 7)

			!!button.make_with_label ("button8")
			table.attach (button, 2, 3, 1, 2, flags, flags, 0, 0)
			buttons.put (button, 8)

			!!button.make_with_label ("button9")
			table.attach (button, 0, 1, 1, 2, flags, flags, 0, 0)
			buttons.put (button, 9)
			
			from i := 1
			until i > 9 
			loop
				if i < 9 then
					!!button_cmd.make (buttons @ i, 
									   buttons @ (i+1))
				else
					!!button_cmd.make (buttons @ 9, 
									   buttons @ 1)
				end
				i := i + 1
			end

			window.box.pack (table, True, True, 0)
			window.show_all
		end

end
