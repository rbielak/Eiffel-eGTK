-- Copyright 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class LIST_CLEAR_CMD

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

	execute is
		do
			list.clear_all
		end

end
