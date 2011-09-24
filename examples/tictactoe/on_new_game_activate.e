indexing

	description: "ON_NEW_GAME1_ACTIVATE"
	generated_by: "eglade 0.3.0"
	project_file: "/home/nrichieb/Projects/tictactoe/tictactoe.glade"
	date: "Mon Nov  8 21:28:52 1999"

class ON_NEW_GAME_ACTIVATE

inherit

	GTK_COMMAND

	TOP_LEVEL_WINDOWS

	SHARED_TTT_GAME

creation

	make

feature

	window: GTK_OBJECT

	execute is
		local
			b: GTK_BUTTON
			i: INTEGER
		do
			-- window is set to be the window in which the widget
			-- is located
			debug
				io.put_string("signal handler: on_new_game1_activate%N")
			end
			-- reset the game
			ttt_game.reset
			-- update the UI
			-- remove the pixmaps from all the buttons
			from i := 1
			until i > 9
			loop
				b := main_window.buttons.item (i)
				-- little stupid, since there is only one child
				if b.child /= Void then
					b.remove_widget (b.child)
				end
				i := i + 1
			end
			-- update status bar
			main_window.status.pop (1)
		end

	make(par: GTK_OBJECT) is
		do
			window := par
		end

end -- ON_NEW_GAME_ACTIVATE
