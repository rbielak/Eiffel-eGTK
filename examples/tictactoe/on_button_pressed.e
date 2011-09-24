indexing

	description: "ON_BUTTON1_PRESSED"
	generated_by: "eglade 0.3.0"
	project_file: "/home/nrichieb/Projects/tictactoe/tictactoe.glade"
	date: "Sun Nov  7 21:14:18 1999"

class ON_BUTTON_PRESSED

inherit

	GTK_COMMAND
		redefine
			parent
		end
	
	SHARED_TTT_GAME

	TOP_LEVEL_WINDOWS

creation

	make

feature

	parent: GTK_BUTTON

	window: GTK_OBJECT

	my_button_number: INTEGER

	all_buttons: ARRAY [GTK_BUTTON]

	game_status: GTK_STATUS_BAR

	status_context_id: INTEGER

	execute is
		do
			if not ttt_game.game_over and then 
				ttt_game.cell_empty (my_button_number) 
			 then
				ttt_game.place_mark (my_button_number, 'X')
				add_pixmap (parent, 'X')
				if ttt_game.game_over then
					status_context_id := game_status.push (1, " OK. 'X' won!")
				elseif ttt_game.cells_filled < 9 then
					ttt_game.play_mark ('O')
					add_pixmap (all_buttons @ ttt_game.last_played, 'O')
					if ttt_game.game_over then
						status_context_id := game_status.push (1, " Hey, 'O' won!")
					end
				else
					-- filled 9 cells, no winner
					status_context_id := game_status.push (1, " Tie!!!") 
				end
			end
		end

	make (par: GTK_OBJECT; number: INTEGER) is
		do
			window := par
			my_button_number := number
			all_buttons := main_window.buttons
			game_status := main_window.status
		end


	add_pixmap (button: GTK_BUTTON; mark: CHARACTER) is
		local
			pix: GTK_PIXMAP
		do
			if mark = 'X' then
				!!pix.make (main_window.cross, default_pointer)
			else
				!!pix.make (main_window.nought, default_pointer)
			end
			pix.show
			button.set_pixmap (pix)
		end


end -- ON_BUTTON_PRESSED
