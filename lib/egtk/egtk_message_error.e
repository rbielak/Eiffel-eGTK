-- Copyright (C) 1999 Oliver Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

   description: "an error message dialog"
   author: "Oliver Elphick"
   date: "May 1999"
   cvs: "$Id: egtk_message_error.e,v 1.6 2003/01/11 19:32:51 elphick Exp $"

class EGTK_MESSAGE_ERROR

   -- A dialog box containing an error message, a retry button
   -- and a cancel button

inherit

   EGTK_MESSAGE_QUERY
      redefine
	 make_close_button, set_pathname
      end

creation

   make, make_with_commands

feature

   set_pathname is
	 -- set the path to the pixmap
      do
	 create pathname.make(10)
	 pathname.make_from_string("error.xpm")
      end

   make_close_button is
      do
	 create close_button.make_with_label("Retry")
	 hbox2.pack(close_button, false, false, 5)
      end

end -- EGTK_MESSAGE_ERROR
