indexing

	description: "TICTACTOE"
	generated_by: "eglade 0.3.0"
	project_file: "/home/nrichieb/Projects/tictactoe/tictactoe.glade"
	date: "Mon Nov  8 21:35:13 1999"

class TICTACTOE

inherit

	GTK_APPLICATION

	TOP_LEVEL_WINDOWS

creation

	make

feature


	make is
		do
			initialize_tool_kit
--			parse_rc_file ("/home/nrichieb/testgtkrc")
			main_window.show
			main_loop
		end

end -- TICTACTOE
