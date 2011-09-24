-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

   description:  "Command to quit application"
   author:       "Richie Bielak"
   adapted_by:   "Oliver Elphick"
   date:         "12th November 1999"
   cvs:          "$Id: egtk_quit_command.e,v 1.4 2002/02/26 15:58:41 elphick Exp $"

class EGTK_QUIT_COMMAND

   -- Inherit from this class (or use it directly) and attach it to 
   -- delete_event signal on a window or clicked on a button

inherit

   GDK_EVENT_COMMAND
		
   GTK_APPLICATION
		
feature
	
   execute is
      do
	 main_loop_quit
      end
   
end -- EGTK_QUIT_COMMAND

