-- Copyright (C) 1998 Francois Pennaneach and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

   description: "Gtk accelerator group"
   author: "Francois Pennaneach"
   changes: "Adapted to ISE by Richie Bielak"
   version: "v 0.3.5 GTK+ 1.2.x"
   cvs: "$Id: gtk_accel_group.e,v 1.8 2002/02/26 15:58:42 elphick Exp $"

class GTK_ACCEL_GROUP

   -- An accelerator group
   --
   -- Signals (from gtkaccelgroup.c):
   --    "add-accelerator"     -
   --    "remove-accelerator"  -

inherit

   GTK_OBJECT

   GTK_ACCEL_GROUP_EXTERNALS
      undefine
	 copy, is_equal
      end

   GTK_ACCEL_FLAGS
      undefine
	 copy, is_equal
      end

   EGTK_NON_PORTABLE
      undefine
	 copy, is_equal
      end

creation

   make, make_from_pointer, make_default

feature -- Creation

   make is
      do
	 gtk_object := gtk_accel_group_new
	 register_widget
      end -- make
	

   make_default is
      do
	 gtk_object := gtk_accel_group_get_default
	 register_widget
      end
	
feature {ANY} -- Commands

   activate (accel_key: INTEGER; accel_mods: INTEGER): BOOLEAN is
      do
	 Result := gtk_accel_group_activate (gtk_object, accel_key, accel_mods) 
      end
	
   attach (object: GTK_OBJECT) is
      do
	 gtk_accel_group_attach (gtk_object, object.gtk_object) 
      end
	
   detach (object: GTK_OBJECT) is
      do
	 gtk_accel_group_detach (gtk_object, object.gtk_object) 
      end

   lock is
      do
	 gtk_accel_group_lock (gtk_object) 
      end
	
   unlock is
      do
	 gtk_accel_group_unlock (gtk_object) 
      end
	
   lock_entry (accel_key: INTEGER; accel_mods: INTEGER) is
      do
	 gtk_accel_group_lock_entry (gtk_object, accel_key, accel_mods) 
      end
	
   unlock_entry (accel_key: INTEGER; accel_mods: INTEGER) is
      do
	 gtk_accel_group_unlock_entry (gtk_object, accel_key, 
				       accel_mods) 
      end
	
   add (accel_key: INTEGER; accel_mods: INTEGER;
	accel_flags: INTEGER;
	object: GTK_OBJECT; 
	accel_signal: STRING) is
      require
	 flags: accel_flags >= 0 and accel_flags <= Gtk_accel_mask
      do
	 npc.np_gtk_accel_group_add (gtk_object, accel_key, accel_mods,
				     accel_flags,
				     object.gtk_object,
				     accel_signal) 
      end
	
   remove (accel_key: INTEGER; 
	   accel_mods: INTEGER;
	   object: GTK_OBJECT) is
      do
	 gtk_accel_group_remove (gtk_object, accel_key, accel_mods,
				 object.gtk_object ) 
      end
	
end -- GTK_ACCEL_GROUP
