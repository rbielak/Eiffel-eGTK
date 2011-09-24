indexing
	description: "Process button press event"
	author: "Dave E Martin XXIII"
	license: "Eiffel Forum"
	genesis: "199903220047 utc"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"

class MAIN_WINDOW_MOTION

inherit

	GDK_MOTION_COMMAND
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
			make_motion (event_generator)
		end

feature {NONE} -- implementation

	execute is
		do
--			print ("goo%N")
--			if main_window.draw_lines then
--				main_window.draw_line (
--					main_window.last_plot_x, main_window.last_plot_y,
--					event.x.rounded, event.y.rounded)
--			else
			main_window.put_pixel (event.x.rounded, event.y.rounded, 55354230)
--			end
		end

	main_window: MAIN_WINDOW

end
