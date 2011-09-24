-- Copyright 2000 Luc Taesch and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Top level class for Gnome applications"
	author: "Luc Taesch"
	date: "2000"

class GNOME_APPLICATION

inherit

	GNOME_APP_NON_PORTABLE_CALLS

feature {ANY} 
   
   initialize_gnome (app_id: STRING; app_version: STRING)  is 
		do
			np_gnome_init_tool_kit (app_id, app_version)
		end

end -- class GNOME_APPLICATION
