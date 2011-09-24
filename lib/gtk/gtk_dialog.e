-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

   description: "GTK_DIALOG widget"
   version: "v 0.3.5 GTK+ 1.2.x"
   author: "Francois Pennaneach, Richie Bielak (ISE Version)"
   cvs: "$Id: gtk_dialog.e,v 1.8 2002/02/26 15:58:42 elphick Exp $"

class GTK_DIALOG

inherit

   GTK_WINDOW
      rename
	 window as dialog
      end

   GTK_DIALOG_EXTERNALS
      undefine
	 copy, is_equal
      end

   GTK_MAIN_EXTERNALS
      undefine
	 copy, is_equal
      end

   EGTK_SHARED_WIDGET_FACTORY
      undefine
	 copy, is_equal
      end

creation

   make

feature

   make is
      do
	 dialog := gtk_dialog_new
	 register_widget
	 vbox ?= widget_factory.item_from_pointer (c_dialog_vbox (dialog))
	 action_area ?= widget_factory.item_from_pointer (c_dialog_action_area(dialog))
	 add_child (vbox)
	 add_child (action_area)
      end

   vbox: GTK_BOX

   action_area: GTK_BOX

-- set_modal is now defined in GTK_WINDOW using gtk_window_set_modal
-- set_modal(flag: BOOLEAN) is
	 -- if flag is true, become modal (i.e., stop any other windows
	 -- in the application from receiving events).
--     do
--	 if flag then
--	    gtk_grab_add(dialog)
--	 else
--	    gtk_grab_remove(dialog)
--	 end
--     end

end
