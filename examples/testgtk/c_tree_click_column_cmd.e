class C_TREE_CLICK_COLUMN_CMD

inherit

	C_TREE_BASE_CMD
		redefine
			fetch_callback_arguments
		end

creation

	make

feature

	the_column: INTEGER
			-- column clicked

	fetch_callback_arguments (argc: INTEGER; argp: POINTER) is
		do
			if argc > 0 then
				the_column := fetch_integer (argp, 0)
			end
		end

	execute is
		local
			the_tree: GTK_CTREE
		do
			the_tree := c_tree_cmd.ctree
			print ("Clicked column: ")
			print (the_column)
			print ("%N")
			if the_column = the_tree.sort_column then
				if the_tree.is_sort_ascending then
					the_tree.set_sort_descending
				else
					the_tree.set_sort_ascending
				end
			else
				the_tree.set_sort_column (the_column)
			end
			the_tree.sort_recursive (Void)
		end

end
