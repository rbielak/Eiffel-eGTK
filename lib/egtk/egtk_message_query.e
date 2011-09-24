-- Copyright (C) 199 Oliver Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

   description: "a query dialog"
   author: "Oliver Elphick"
   date: "May 1999"
   cvs: "$Id: egtk_message_query.e,v 1.7 2003/01/11 19:32:51 elphick Exp $"

class EGTK_MESSAGE_QUERY

   -- A message box containing a question to be answered
   -- by OK or Cancel

inherit

   EGTK_MESSAGE
      redefine
	 make_buttons, set_pathname
      end

creation

   make, make_with_commands

feature -- Creation

   make_with_commands(w: GTK_WINDOW; s: STRING;
		      c, d: EGTK_MESSAGE_HIDE_CMD) is
      do
	 make_with_command(w, s, c)
	 set_cancel_callback(d)
      end

feature -- Attributes

   cancel_button: GTK_BUTTON

feature -- Procedures

   set_cancel_callback(cmd: EGTK_MESSAGE_HIDE_CMD) is
	 -- replace all Cancel button callbacks with cmd
      do
	 cancel_button.remove_all_signal_handlers
	 cancel_button.add_action("clicked",cmd)
      end

   add_cancel_callback(cmd: GTK_COMMAND_TYPE) is
	 -- add cmd to the Cancel button callbacks
      do
	 cancel_button.add_action("clicked", cmd)
      end

   make_buttons is
      do
	 Precursor
	 close_button.set_label("OK")
	 make_cancel_button
      end

   make_cancel_button is
      do
	 create cancel_button.make_with_label("Cancel")
	 hbox2.pack(cancel_button, false, false, 5)
      end

   set_pathname is
	 -- set the pathname of the pixmap
      do
	 -- need to read the pathname from a config file...
	 create pathname.make(10)
	 pathname.make_from_string("query.xpm")
      end

   set_cancel_button_text(s: STRING) is
      require
	 string_set: s /= Void and then not s.is_empty
	 cancel_button_made: cancel_button /= Void
      do
	 cancel_button.set_label(s)
      end

   set_cancel_button_default is
      require
	 cancel_button_made: cancel_button /= Void
      do
	 cancel_button.set_label("Cancel")
      end

end -- EGTK_MESSAGE_QUERY
