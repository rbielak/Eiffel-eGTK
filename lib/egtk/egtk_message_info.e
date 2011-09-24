-- Copyright (C) 1999 Oliver Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

   description: "an information message dialog"
   author: "Oliver Elphick"
   date: "May 1999"
   cvs: "$Id: egtk_message_info.e,v 1.6 2003/01/11 19:32:51 elphick Exp $"

class EGTK_MESSAGE_INFO

   -- Information message popup

inherit

   EGTK_MESSAGE

creation

   make, make_with_command

feature

   set_pathname is
	 -- set the path to the pixmap
      do
	 create pathname.make(10)
	 pathname.make_from_string("info.xpm")
      end

end -- EGTK_MESSAGE_INFO
