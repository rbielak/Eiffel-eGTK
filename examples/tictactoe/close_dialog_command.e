class CLOSE_DIALOG_COMMAND

inherit

	GTK_COMMAND

creation

	make

feature

	make (d: GTK_DIALOG) is
		require
			d_not_void: d /= Void
		do
			dialog := d
		end

	dialog: GTK_DIALOG

	execute is
		do
			dialog.destroy
		end

end
