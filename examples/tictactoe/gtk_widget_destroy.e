indexing

	description: "GTK_WIDGET_DESTROY"
	generated_by: "eglade 0.3.0"
	project_file: "/home/nrichieb/Projects/tictactoe/tictactoe.glade"
	date: "Sun Nov  7 21:14:18 1999"

class GTK_WIDGET_DESTROY

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
				io.put_string("signal handler: gtk_widget_destroy%N")
			end
			main_loop_quit
		end

	make(par: GTK_OBJECT) is
		do
			window := par
		end

end -- GTK_WIDGET_DESTROY
