class C_LIST_TOGGLE_REORDERABLE_CMD

inherit

	C_LIST_COMMAND
		redefine
			parent
		end

creation

	make

feature

	parent: GTK_TOGGLE_BUTTON

	execute is
		do
			print ("Toggle reorderable%N")
			clist.set_reorderable (parent.button_is_down)
		end

end
