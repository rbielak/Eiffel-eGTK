-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	author: "Jörgen Tegne´r"
	date: "1/18/99"

class ROTATE_COMMAND
	
inherit 

	NOTEBOOK_COMMAND;
   
feature {ANY}

	direction: INTEGER;
	
	set_direction(dir: INTEGER) is 
		require 
			valid_parameter: dir = - 1 or dir = 1; 
		do  
			direction := dir;
		end -- set_direction
	
	
	execute is 
		do  
			if direction = - 1 then 
				notebook.prev_page;
			else 
				notebook.next_page;
			end; 
		end -- execute
	
end -- class ROTATE_COMMAND
