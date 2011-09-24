-- Copyright 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class LIST_ADD_CMD

inherit

	GTK_COMMAND

creation

	make

feature

	list: GTK_LIST

	make (llist: like list) is
		do
			list := llist
		end

	count: INTEGER

	execute is
		local
			label: STRING
			list_item: GTK_LIST_ITEM
		do
			count := count + 1
			label := clone (msg)
			label.append (count.out)
			!!list_item.make_with_label (label)
			list_item.show
			list.add_widget (list_item)
		end

	msg: STRING is "added item "

end
