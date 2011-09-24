class C_LIST_UNDO_SELECTION_CMD

inherit

	C_LIST_COMMAND

creation

	make

feature

	execute is
		do
			clist.undo_selection
		end

end
