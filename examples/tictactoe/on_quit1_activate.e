indexing

	description: "ON_QUIT1_ACTIVATE"
	generated_by: "eglade 0.3.0"
	project_file: "/home/nrichieb/Projects/tictactoe/tictactoe.glade"
	date: "Mon Nov  8 21:28:52 1999"

class ON_QUIT1_ACTIVATE

inherit

	GTK_COMMAND
	GTK_APPLICATION

creation

	make

feature

	window: GTK_OBJECT

	execute is
		do
			-- window is set to be the window in which the widget
			-- is located
			debug
				io.put_string("signal handler: on_quit1_activate%N")
			end
			exit (0)
		end

	make(par: GTK_OBJECT) is
		do
			window := par
		end

end -- ON_QUIT1_ACTIVATE
