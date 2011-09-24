class C_LIST_REMOVE_SELECTION_CMD

inherit

	C_LIST_COMMAND

creation

	make

feature

	execute is
		local
			row: INTEGER
		do
			print ("Remove selection %N")
			if clist.selection /= Void then
				clist.freeze
				-- TODO: take selection mode into account here
				from
				until clist.selection = Void
				loop
					row := clist.selection.data_as_integer
					print ("Deleting: ")
					print (clist.cell_text (row, 0))
					print ("%N")
					-- Note. the "selection" glist is modified by this
					-- call
					clist.delete_row (clist.selection.data_as_integer)
				end
				clist.thaw
			end
		end

end
