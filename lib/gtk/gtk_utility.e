-- Copyright (C) 1999 Dave E Martin XXIII and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

   description: "general utility functions"
   author: "Dave E Martin XXIII"
   genesis: "199904270504 utc"
   version: "v 0.3.5 GTK+ 1.2.x"
   gtk_version: "1.2"
   cvs: "$Id: gtk_utility.e,v 1.6 2002/04/16 23:02:33 elphick Exp $"

--TODO I think we should consider some sort of naming convention, and/or
--perhaps another cluster for classes which serve the needs of the Eiffel
--interface to the GTK library, but which arent part of the GTK interface;
-- such as this class, and the GTK/GDK_EXTERNAL* classes.
--Also, this class is used by both the GDK and the GTK classes, so should it
--be GTK_UTILITIES or GDK_UTILITIES?  Also, since it looks like this binding
--will be renamed eGtk (maybe?) maybe this class (and any others that arent
--specific to the T or D parts) could be prefixed with EGTK instead (to denote --the name of our binding library, instead of which GTK/GDK klass this
--corresponds with. (the Gdk/Gtk libraries are O-O, but use C which is not an
--O-O language, so its all implemented manually.  In the event that it gets
--compiled with a C++ compiler, they use klass, to avoid a reserved word
--conflict.
--There are also the classes GxK_xxx_COMMAND which do interface with the
--GDK/GTK library, but dont really "belong" to either the T or D variant
--per se, so the naming of some of them has been rather arbitrary.

--TODO additional notes, the gtk_eiffel.c files in the ise and se directories
--contains much common code.  I propose that the common code be moved to
--some other compiler neutral location (perhaps a directory named common)
--and the gtk_eiffel.c for each compiler incorporate it by include
--(#include "../common/common_glue.c" or something similar)

class GTK_UTILITY

obsolete
      "This class is unnecessary and will be removed in the next release"

feature {NONE} -- implementation

   bool_to_int (b: BOOLEAN): INTEGER is
      obsolete
         "Put this code directly where it is needed"
      -- convert a boolean to an integer that Gdk* likes
      -- should be inlined by any decent compiler (either eiffel, or the
      -- underlying compiler, if applicable)
      do
	 check
	    default_result_is_0: Result = 0
	 end
	 if b then
	    Result := 1
	 end
      end

end -- GTK_UTILITY
