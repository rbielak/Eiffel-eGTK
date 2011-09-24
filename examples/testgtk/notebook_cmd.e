-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class NOTEBOOK_CMD

inherit

	GTK_COMMAND

	GTK_CONSTANTS

feature

	notebook: GTK_NOTEBOOK

	window: WINDOW_WITH_CLOSE_BUTTON

	rotate_command: ROTATE_COMMAND

	tab_pos_command: TAB_POS_COMMAND

	tab_vis_command: TAB_VIS_COMMAND

	execute is
		local
			a_button: GTK_BUTTON
		do
			!!window.make ("Notebook")
			!!notebook.make
			notebook.set_tab_pos (GTK_POS_TOP)
			notebook.set_border_width (10)
			window.box.pack (notebook, True, True, 0)
			create_pages (1, 4)
			-- create a button for rotating pages
			!!a_button.make_with_label (" Rotate ")
			!!rotate_command
			rotate_command.set_direction(1)
			rotate_command.connect_to_notebook (notebook, a_button)
			window.button_box.pack (a_button, True, True, 0)
			-- create a button for moving tabs around
			!!a_button.make_with_label (" Tabs ")
			!!tab_pos_command
			tab_pos_command.connect_to_notebook (notebook, a_button)
			window.button_box.pack (a_button, True, True, 0)
			-- button to hide or show tabs
			!!a_button.make_with_label ("Hide/Show")
			!!tab_vis_command
			tab_vis_command.connect_to_notebook (notebook, a_button)
			window.button_box.pack (a_button, True, True, 0)
			window.show_all
		end

	create_pages (start, finish: INTEGER) is
		local
			child: GTK_FRAME
			label: GTK_LABEL
			i: INTEGER
			s: STRING
		do
			from i := start
			until i > finish
			loop
				s := clone ("Page ")
				s.append (i.out)
				!!child.make (s)
				child.set_border_width (10)
				child.set_size (100, 75)
				!!label.make (s)
				child.add_widget (label)
				!!label.make (s)
				notebook.append_page (child, label)
				i := i + 1
			end
				
		end

end
