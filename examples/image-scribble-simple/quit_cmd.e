indexing
	description: "Quit program when quit event received"
	author: "Dave E Martin XXIII"
	license: "Eiffel Forum"
	genesis: "199901210400 utc"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"

class
	QUIT_CMD
inherit
	GTK_COMMAND
creation
	make,
	make_destroy
feature -- initialization
	make (widget: GTK_WIDGET; app: GTK_APPLICATION) is
		do
			application := app
			connect ("delete_event", widget)
			!! destroy.make_destroy (widget, app)
		ensure
			destroy_handled: destroy /= Void
		end
feature {NONE} -- implementation
	execute is
		do
			application.main_loop_quit
		end
	application: GTK_APPLICATION
	destroy: QUIT_CMD
	make_destroy (widget: GTK_WIDGET; app: GTK_APPLICATION) is
		do
			application := app
			connect ("destroy", widget)
		ensure
			not_recursive: destroy = Void
		end
end
