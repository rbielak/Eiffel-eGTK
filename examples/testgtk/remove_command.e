-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	author: "Jörgen Tegne´r"
	date: "1/18/99"

class REMOVE_COMMAND

inherit 

   NOTEBOOK_COMMAND;
   
feature {ANY} 
   
   execute is 
      do  
         notebook.remove_page;
      end -- execute

end -- class REMOVE_COMMAND
