-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	author: "Jörgen Tegne´r"
	date: "1/18/99"

deferred class NOTEBOOK_COMMAND

inherit 

   GTK_COMMAND;
   
feature {ANY} 
	
	notebook: GTK_NOTEBOOK;
	
	connect_to_notebook(attached_notebook: GTK_NOTEBOOK; 
					   new_parent: like parent) is 
		do  
			notebook := attached_notebook;
			--         connect(new_event,new_parent);
			connect("clicked",new_parent);
		end -- connect_to_notebook
	
end -- class NOTEBOOK_COMMAND
