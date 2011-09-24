class LIST_SELECTION_CMD

inherit

	GTK_COMMAND
		redefine
			parent
		end

creation

	make 

feature

	make (l: GTK_LIST) is
		require
			l_not_void: l /= Void
		do
			list := l
		end

	list: GTK_LIST

	parent: GTK_LIST_ITEM

	execute is
		do
			print ("Selected item: ")
			-- our parent is a child of the list
			print (list.child_position (parent))
			print ("%N")
		end

end
