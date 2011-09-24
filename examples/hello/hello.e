-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class HELLO

inherit

	GTK_APPLICATION

creation
	
	make

feature

	window: GTK_WINDOW

	make is
		do
			initialize_tool_kit
			!!window.make_top_level
			window.show
			main_loop
		end

end
