indexing
	description: "Handle the GTK destroy signal"
	author: "Dave E Martin XXIII"
	genesis: "199905122316 utc"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"

class DESTROY_COMMAND

inherit
	GTK_DESTROY_COMMAND

creation
	make

feature {NONE} -- initialization
	make (widget: GTK_WIDGET; the_app: GTK_APPLICATION) is
		do
			app := the_app
			make_destroy (widget)
		ensure
			app_set: app = the_app
		end

feature {NONE} -- implementation
	app: GTK_APPLICATION

	execute is
		do
			app.main_loop_quit
		end

end
