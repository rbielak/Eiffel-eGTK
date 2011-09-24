-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class TOGGLE_CMD

inherit

	GTK_COMMAND

creation

	make

feature

	make (d: GTK_DIALOG) is
		require
			d /= Void
		do
			dialog := d
		end

	execute is
		do
			if not labelled then
				!!label.make ("  Simple Label for Dialog ")
				dialog.vbox.pack (label, True, True, 0)
				label.show
				labelled := True
			else
				dialog.vbox.remove_widget (label)
				labelled := false
				label.destroy
			end
			dialog.show_all
		end
	
	dialog: GTK_DIALOG

	label: GTK_LABEL 

	labelled: BOOLEAN

end
