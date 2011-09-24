indexing

	description: "Play TicTacToc game"

class TTT_GAME

creation

	make

feature

	cross: CHARACTER is 'X'

	nought: CHARACTER is 'O'

	make is
		local
			i: INTEGER
		do
			!!board.make (1, 9)
			from i := 1
			until i > 9 
			loop
				board.put (' ', i)
				i := i + 1
			end
		end

	place_mark (i: INTEGER; mark: CHARACTER) is
			-- put an X on the board
		require
			i_valid: (i > 0) and (i < 10)
			cell_empty: cell_empty (i)
			valid_mark: (mark = cross) or (mark = nought)
			space_available: cells_filled < 9
		do
			board.put (mark, i)
			cells_filled := cells_filled + 1
			game_over := have_winner (mark)
		ensure
			placed: board @ i = mark	
			space_taken: cells_filled = old cells_filled + 1
		end

	have_winner (mark: CHARACTER): BOOLEAN is
			-- check for winner
		local
			i, j: INTEGER
		do
			-- if there are less than 5 cells filled, there cannot be 
			-- a winner
			if cells_filled >= 5 then
				-- check horizontal rows first
				from i := 1 until (i > 3) or Result
				loop
					j := (i - 1) * 3
					Result := ((board @ (j + 1)) = mark) 
						and then ((board @ (j + 2)) = mark) 
						and then ((board @ (j + 3)) = mark)
					i := i + 1
				end
				-- check vertical lines
				from i := 1 until (i > 3) or Result
				loop
					Result := ((board @ (i)) = mark) 
						and then ((board @ (i + 3)) = mark)	
						and then ((board @ (i + 6)) = mark)
			        i := i + 1
				end
				-- check the diagonals
				if not Result then
					Result := (board @ 1 = mark) 
						and then (board @ 5 = mark)
						and then (board @ 9 = mark)
				end
				if not Result then
					Result := (board @ 3 = mark) 
						and then (board @ 5 = mark)
						and then (board @ 7 = mark)
				end
			end
		end
	

	game_over: BOOLEAN

	play_mark (mark: CHARACTER) is
			-- play a move for 'mark'
		require
			valid_mark: (mark = cross) or (mark = nought)			
		local
			played: BOOLEAN
			i: INTEGER
			other_mark: CHARACTER
		do
			last_played := 0
			-- if middle spot wasn't yet take, take it
			if cell_empty (5) then
				place_mark (5, mark)
				last_played := 5
				played := True
			elseif cells_filled >= 2 then
				-- see if we have a winning position
				i := find_a_winning_move (mark)
				if i > 0 then
					-- found it
					place_mark (i, mark)
					last_played := i
					played := True
				else
					-- if no winning position, check if we have to block
					other_mark := 'X'
					if mark = 'X' then 
						other_mark := 'O'
					end
					i := find_a_winning_move (other_mark)
					if i > 0 then
						-- other has a good move, must block it
						place_mark (i, mark)
						last_played := i
						played := True
					end
				end
			end
			if not played then
				-- just pick first empty slot
				from i := 1
				until (i > 9) or played
				loop
					if cell_empty (i) then
						place_mark (i, mark)
						last_played := i
						played := True
					end
					i := i + 1
				end
			end
		ensure
			made_a_move: last_played > 0
			where_the_move_is: board @ last_played = mark
		end

	last_played: INTEGER

	cells_filled: INTEGER

	cell_empty (i: INTEGER): BOOLEAN is
		require
			i_valid: (i > 0) and (i < 10)
		do
			Result := board @ i = ' '
		end


	reset is
			-- start new game
		local
			i: INTEGER
		do
			last_played := 0
			game_over := false
			cells_filled := 0
			from i := 1
			until i > 9
			loop
				board.put (' ', i)
				i := i + 1
			end
		end

feature {NONE}

	find_a_winning_move (mark: CHARACTER): INTEGER is
		local
			i: INTEGER
		do
			from i := 1
			until (i > 9) or Result > 0
			loop
				if cell_empty (i) then
					board.put (mark, i)
					if have_winner (mark) then
						Result := i
					end
					board.put (' ', i)
				end
				i := i + 1
			end
		ensure
			board_unchanged: board.is_equal (old board)
		end
	

	board: ARRAY [CHARACTER]

end
