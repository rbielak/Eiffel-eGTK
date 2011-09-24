deferred class MENU_ITEM_CMD

inherit

	GTK_COMMAND

feature
	
	item_index: INTEGER

	set_item_index (i: INTEGER) is
		require
			valid_index: i > 0
		do
			item_index := i
		end

end
