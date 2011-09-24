indexing

	description: "Simple example of GTK menus"

class MENU_EXAMPLE

inherit

	GTK_APPLICATION

creation

	make

feature

	main_window: GTK_WINDOW

	root_menu: GTK_MENU_ITEM

	menu: GTK_MENU

	menu_bar: GTK_MENU_BAR

	item_cmds: ARRAY [MENU_SELECT_COMMAND]
			-- here to make sure the GC doesn't get them

	button: GTK_BUTTON

	make is
		local
			quit: QUIT_COMMAND
			item_name: STRING
			i: INTEGER
			item: GTK_MENU_ITEM
			vbox: GTK_BOX
			msc: MENU_SELECT_COMMAND
			button_cmd: BUTTON_PRESS_COMMAND
		do
			initialize_tool_kit
			-- create a main window and attach a quit command to it
			!!main_window.make_top_level
			main_window.set_title ("GTK Menu Test")
			main_window.set_size (200, 100)
			!!quit
			main_window.add_action ("delete_event", quit)
			
			-- Create the menu widget. This menu holds the items that 
			-- pop up when click on the "Root Menu"
			!!menu.make
			
			!!item_cmds.make (1, 3)
			from i := 1
			until i > 3
			loop
				item_name := clone ("Test-undermenu - ")
				item_name.append (i.out)
				!!item.make_with_label (item_name)
				menu.append (item)
				!!msc.make (item, item_name)
				item_cmds.put (msc, i)
				i := i + 1
			end

			-- set up the root menu
			!!root_menu.make_with_label ("Root Menu")
			root_menu.set_submenu (menu)

			-- create a box and put a button in it
			!!vbox.make_vertical (False, 0)
			main_window.add_widget (vbox)

			!!menu_bar.make
			vbox.pack (menu_bar, False, False, 2)
			menu_bar.append (root_menu)

			-- add a button that will pop up the menu
			!!button.make_with_label ("PressMe")
			vbox.pack_end (button, True, True, 2)
			!!button_cmd.make (button, menu)

			main_window.show_all
			main_loop
		end



end
