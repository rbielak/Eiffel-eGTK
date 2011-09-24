-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	author: "Jörgen Tegne´r"
	date: "1/18/99"

class TAB_VIS_COMMAND

inherit 

   NOTEBOOK_COMMAND
   
feature {ANY} 
   
   execute is 
      do  
         --  hide or unhide tab
         notebook.show_tabs(not notebook.is_tabs_shown);
      end -- execute

end -- class TAB_VIS_COMMAND
