-- Copyright (C) 1999 Oliver Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

   description: "a command to hide a message dialog"
   author: "Oliver Elphick"
   date: "May 1999"
   cvs: "$Id: egtk_message_hide_cmd.e,v 1.3 2002/02/26 15:58:41 elphick Exp $"

class EGTK_MESSAGE_HIDE_CMD

   -- Command to hide a message box; attach to its command buttons

inherit
	
   GTK_COMMAND_TYPE

   GTK_MAIN

creation

   make

feature -- Creation

   make(w: EGTK_MESSAGE) is
      require
	 w_set: w /= Void
      do
	 dialog := w
      ensure
	 dialog_set: dialog = w
      end

feature -- Procedures

   execute is
      do
	 dialog.hide
	 dialog.set_modal(False)
	 main_loop_quit
      end

feature -- Attributes

   dialog: EGTK_MESSAGE

end -- EGTK_MESSAGE_HIDE_CMD
