indexing
	description: "demonstrate GTK image"
	author: "Dave E Martin XXIII"
	license: "Eiffel Forum"
	genesis: "199903210500"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"

class IMAGE_SCRIBBLE_APP
inherit
	GTK_APPLICATION

creation
	make

feature -- Initialization
	make is
		do
			initialize_tool_kit
			set_locale
			!! main_window.make (Current)
			main_loop
		end

feature {NONE} -- implementation
	main_window: MAIN_WINDOW

end
