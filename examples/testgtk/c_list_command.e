deferred class C_LIST_COMMAND

inherit

	GTK_COMMAND

feature

	make (l: GTK_CLIST) is
		require
			not_void: l /= Void
		do
			clist := l
		end

	clist: GTK_CLIST

	clist_columns: INTEGER is 12

end

	
