-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class REPARENT_CMD

inherit

	GTK_COMMAND

creation

	make

feature

	make (new_label: GTK_LABEL; new_parent: GTK_CONTAINER) is
		do
			label := new_label
			other_parent := new_parent
		end

	label: GTK_LABEL

	other_parent: GTK_CONTAINER

	execute is
		do
			label.reparent (other_parent)
		end

end
