class MENU_SELECT_COMMAND

inherit

	GTK_COMMAND

creation

	make

feature

	make (item: GTK_MENU_ITEM; str: STRING) is
		require
			item_exits: item /= Void
			string_exists: str /= Void
		do
			-- connect ("activate", item)
			item.add_action ("activate", Current)
			msg := str
		end
			
	msg: STRING

	execute is
		do
			print ("Menu: ")
			print (msg)
			print ("%N")
		end
	
end
