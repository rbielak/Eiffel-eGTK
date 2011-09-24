indexing

	description: "MAIN_WINDOW"
	generated_by: "eglade 0.3.0"
	project_file: "/home/nrichieb/Projects/tictactoe/tictactoe.glade"
	date: "Mon Nov  8 21:35:13 1999"

class MAIN_WINDOW

inherit

	GTK_WINDOW
	
creation
	
	make

feature -- attributes that must be visible to other classes
	
	buttons: ARRAY [GTK_BUTTON]
			-- access to buttons by their position

	status: GTK_STATUS_BAR
			-- status of the game

	table: GTK_TABLE
			-- table for buttons

feature	-- pixmaps for the buttons

	cross: GDK_PIXMAP is
		once
			-- the path for the pixmaps is relative to the examples directory
			!!Result.make_from_xpm (gdk_window, style.bg (gtk_state_normal),
									"../../pixmaps/cross.xpm")
		end

	nought: GDK_PIXMAP is
		once
			!!Result.make_from_xpm (gdk_window, style.bg (gtk_state_normal),
								  "../../pixmaps/not.xpm")
		end


feature {NONE} -- creation and implementation

	make is
		local
			junk: INTEGER
			widget_destroy: GTK_WIDGET_DESTROY
			quit_cmd: EGTK_QUIT_COMMAND
			-- box to contain all window widgets
			vbox1: GTK_BOX
			-- menu widgets and call backs
			menubar1: GTK_MENU_BAR
			-- file menu
			file1: GTK_MENU_ITEM
			file1_menu: GTK_MENU
			new_game: GTK_MENU_ITEM
			on_new_game_activate1: ON_NEW_GAME_ACTIVATE
			-- quit
			quit1: GTK_MENU_ITEM
			on_quit1_activate1: ON_QUIT1_ACTIVATE
			-- about
			about1: GTK_MENU_ITEM
			about1_menu: GTK_MENU
			about2: GTK_MENU_ITEM
			on_about_activate: ON_ABOUT_ACTIVATE
		do
			make_top_level
			set_title("TicTacToe")
			set_policy(True, False, False)
			set_size (160, 200)
			!!widget_destroy.make (Current)
			Current.add_action("destroy", widget_destroy)
			!!quit_cmd
			Current.add_action ("delete_event", quit_cmd)
			!!vbox1.make_vertical(False, 0)
			vbox1.show
			!!menubar1.make
			menubar1.show
			!!file1.make_with_label("File")
			file1.show
			!!file1_menu.make
			file1_menu.show
			!!new_game.make_with_label("New Game")
			new_game.show
			!!on_new_game_activate1.make(Current)
			new_game.add_action("activate", on_new_game_activate1)
			file1_menu.append(new_game)
			!!quit1.make_with_label("Quit")
			quit1.show
			!!on_quit1_activate1.make(Current)
			quit1.add_action("activate", on_quit1_activate1)
			file1_menu.append(quit1)
			file1.set_submenu(file1_menu)
			menubar1.append(file1)
			!!about1.make_with_label("Help")
			about1.show
--			!!on_about1_activate1.make(Current)
--			about1.add_action("activate", on_about1_activate1)
			!!about1_menu.make
			about1_menu.show
			!!about2.make_with_label("About")
			about2.show
			!!on_about_activate.make(Current)
			about2.add_action("activate", on_about_activate
)
			about1_menu.append(about2)
			about1.set_submenu(about1_menu)
			menubar1.append(about1)
			vbox1.pack(menubar1, False, False, 0)
			!!table.make(3, 3, False)
			table.set_row_spacings(0)
			table.set_column_spacings(0)
			table.show

			!!status.make
			junk := status.push (1, "Ready to play.")
			status.show

			make_buttons
			
			vbox1.pack(table, True, True, 0)
			vbox1.pack (status, False, False, 0)
			add_widget(vbox1)
		end



	make_buttons is
		local
			button: GTK_BUTTON
			on_button_pressed: ON_BUTTON_PRESSED
			i, j: INTEGER
		do
			!!buttons.make (1, 9)
			from i := 1 until i > 3
			loop
				from j := 1 until j > 3
				loop
					-- create a button and put in the array
					!!button.make
					buttons.put (button, 3*(i-1) + j)
					-- set up border and button flags
					button.set_border_width(1)
					button.set_flags(Gtk_can_focus)
					button.show
					-- add a callback
					!!on_button_pressed.make(Current, 3*(i-1) + j)
					button.add_action("pressed", on_button_pressed)
					table.attach(button, j-1, j, i-1, i,
								 GTK_EXPAND + GTK_FILL, GTK_EXPAND + GTK_FILL, 0, 0)
					j := j + 1
				end
				i := i + 1
			end
		end

	

end -- MAIN_WINDOW
