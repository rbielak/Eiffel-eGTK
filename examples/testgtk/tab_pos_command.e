-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	author: "Jörgen Tegne´r"
	date: "1/18/99"

class TAB_POS_COMMAND

inherit 

   NOTEBOOK_COMMAND;
   
feature {ANY} 
   
   execute is 
      do  
         --  rotate_book
		  notebook.set_tab_pos((notebook.current_tab_pos + 1) \\ 4);
      end -- execute
	  
end -- class TAB_POS_COMMAND
