class C_LIST_CLICK_COLUMN_CMD

inherit

	C_LIST_COMMAND
		redefine
			fetch_callback_arguments
		end

creation

	make

feature

	clicked_column: INTEGER

	execute is
		do
			print ("You clicked on column: ")
			print (clicked_column)
			print ("%N")
			if clicked_column = 4 then
				clist.set_column_visibility (clicked_column, False)
			elseif clicked_column = clist.sort_column then
				if clist.is_sort_ascending then
					clist.set_sort_descending
				else
					clist.set_sort_ascending
				end
			else
				clist.set_sort_column (clicked_column)
			end
			clist.sort
		end

feature {NONE}

	fetch_callback_arguments (argc: INTEGER; argp: POINTER) is
		do
			if argc > 0 then
				clicked_column := fetch_integer (argp, 0)
			end
		end

end
