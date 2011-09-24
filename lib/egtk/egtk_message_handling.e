-- Copyright (C) 1999 Oliver Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

   description: "EGTK_MESSAGE_HANDLING"
   author: "Oliver Elphick"
   date: "May 1999"
   cvs: "$Id: egtk_message_handling.e,v 1.4 2003/01/11 19:32:51 elphick Exp $"

class EGTK_MESSAGE_HANDLING

   -- Any class that wants to use these features should inherit from 
   -- this class and  include one of the creation features in the child's 
   -- creation procedures
   --
   -- Use the features show_info_message, show_query_message,
   -- show_warning_message and fatal_error to display messages
   --
   -- The class can be used even if no windows are yet in existence; 
   -- this allows it to be used for error handling during start-up.

inherit

 --  GTK_MAIN

creation

   make_message_handling, make_message_handling_tty

feature {NONE} -- Creation

   make_message_handling(w: GTK_WINDOW) is
	 -- enable use with GUI
      require
	 window: w /= Void
      do
	 message_parent_window := w
	 use_windows := True
      ensure
	 window_set: message_parent_window = w
	 flag_set:	use_windows
      end

   make_message_handling_tty is
	 --enable use with no GUI
      do
	 message_parent_window := Void
	 use_windows := False
      ensure
	 flag_unset:	not use_windows
	 no_window: message_parent_window = Void
      end

feature {NONE} -- Use

   show_warning_message(msg: STRING) is
	 -- display a warning message
      require
	 msg_set: msg /= Void and then msg.count /= 0
      do
	 if message_parent_window /= Void then
	    if warning_dialog = Void then
	       create warning_dialog.make(message_parent_window, msg)
	    else
	       warning_dialog.message.set_text(msg)
	    end
	    warning_dialog.show_all
	 else
	    print(msg)
	 end
      end

   show_info_message(msg: STRING) is
	 -- display a piece of information
      require
	 msg_set: msg /= Void and then msg.count /= 0
      do
	 if message_parent_window /= Void then
	    if info_dialog = Void then
	       create info_dialog.make(message_parent_window, msg)
	    else
	       info_dialog.message.set_text(msg)
	    end
	    info_dialog.show_all
	 else
	    print(msg)
	 end
      end

   show_query_message(msg: STRING; yes_cmd, no_cmd: EGTK_MESSAGE_HIDE_COMMAND) is
	 -- display a query; if this is in non-GUI mode, you will
	 -- then need to read the reply from stdin
      require
	 msg_set: msg /= Void and then msg.count /= 0
	 yes_cmd_ok: yes_cmd /= Void implies yes_cmd.parent = Void
	 no_cmd_ok: no_cmd /= Void implies no_cmd.parent = Void
	 yes_and_no: yes_cmd /= Void implies no_cmd /= Void
	 no_and_yes: no_cmd /= Void implies yes_cmd /= Void
      do
	 if message_parent_window /= Void then
	    if query_dialog = Void then
	       create query_dialog.make(message_parent_window, msg)
	    else
	       query_dialog.message.set_text(msg)
	       query_dialog.set_cancel_callback(yes_cmd)
	       query_dialog.set_cancel_callback(no_cmd)
	    end
	    query_dialog.show_all
	    query_dialog.set_modal(True)
	 else
	    print(msg)
	 end
      end
	
   fatal_error(msg: STRING) is
	 -- display an error message and abort the program
      require
	 msg_set: msg /= Void and then msg.count /= 0
      local
	 c: EGTK_MESSAGE_HIDE_CMD
	 quit: EGTK_QUIT_COMMAND
      do
	 if use_windows then
	    trace_switch(True)
	    if error_dialog = Void then
	       create quit
	       create error_dialog.make(message_parent_window, msg)
	       create c.make(error_dialog)
	       error_dialog.set_close_cmd(c)
	       error_dialog.add_close_cmd(quit)
	    end
	    error_dialog.show_all
	    query_dialog.set_modal(True)
	 else
	    print(msg)
	 end
	 die_with_code(exit_failure_code)
      end

feature {NONE} -- Attributes

   warning_dialog: EGTK_MESSAGE_WARNING

   info_dialog: EGTK_MESSAGE_INFO

   query_dialog: EGTK_MESSAGE_QUERY
	
   error_dialog: EGTK_MESSAGE_WARNING

   message_parent_window: GTK_WINDOW

   use_windows: BOOLEAN
		
invariant

   window_set: use_windows implies message_parent_window /= Void
   flag_set:  message_parent_window /= Void implies use_windows

end -- EGTK_MESSAGE_HANDLING
