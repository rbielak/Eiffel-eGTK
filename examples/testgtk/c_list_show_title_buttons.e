class C_LIST_SHOW_TITLE_BUTTONS

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
			print ("toggle titles %N")
			if parent.button_is_down then
				clist.show_column_titles
			else
				clist.hide_column_titles
			end
		end

end
