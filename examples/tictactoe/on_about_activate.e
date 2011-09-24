indexing

	description: "ON_ABOUT2_ACTIVATE"
	generated_by: "eglade 0.3.0"
	project_file: "/home/nrichieb/Projects/tictactoe/tictactoe.glade"
	date: "Mon Nov  8 21:28:52 1999"

class ON_ABOUT_ACTIVATE

inherit

	GTK_COMMAND

creation

	make

feature

	window: GTK_OBJECT


	execute is
		local
			close_button: GTK_BUTTON
			message: GTK_LABEL
			close_cmd: CLOSE_DIALOG_COMMAND
			dialog: GTK_DIALOG
		do
			!!dialog.make
			dialog.set_title ("About Tic Tac Toe")
			dialog.set_size (200, 100)
			!!message.make ("TIC-TAC-TOE Game in Eiffel%N  with eGTK")
			dialog.vbox.pack (message, False, False, 10)
			!!close_button.make_with_label ("Close")
			dialog.action_area.pack (close_button, True, True, 1)
			-- now call backs
			!!close_cmd.make (dialog)
			close_button.add_action ("pressed", close_cmd)
			close_button.set_flags (close_button.Gtk_can_default)
			close_button.grab_default
			dialog.show_all
		end

	make(par: GTK_OBJECT) is
		do
			window := par
		end

end -- ON_ABOUT_ACTIVATE
