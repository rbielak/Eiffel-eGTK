indexing
	description: "Process button press event"
	author: "Dave E Martin XXIII"
	license: "Eiffel Forum"
	genesis: "199903220047 utc"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"

class MAIN_WINDOW_BUTTON_PRESS

inherit

	GDK_BUTTON_PRESS_COMMAND
		redefine
			execute
		end

	GDK_EXTERNALS

creation

	make

feature {NONE} -- initialization

	make (event_generator: MAIN_WINDOW) is
		do
			main_window := event_generator
			make_button_press (event_generator)
		end

feature {NONE} -- implementation

	execute is
		do
			-- print ("goo%N")
			main_window.put_pixel (event.x.rounded, 
									   event.y.rounded, 
									   45354230)
				-- main_window.set_draw_lines (False)
			--TODO			main_window.set_draw_lines (event.button /= 1)
			--fix Image class, which is not really a drawable (but currently thinks it is)
		end

	main_window: MAIN_WINDOW

end
