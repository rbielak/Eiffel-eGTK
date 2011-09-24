-- Copyright (C) 1999 Dave E Martin XXIII and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing
   description: "Gtk Scale"
   author: "Dave E Martin XXIII"
   genesis: "199905120430 utc"
   version: "v 0.3.5 GTK+ 1.2.x"
   gtk_version: "1.2"
   cvs: "$Id: gtk_scale.e,v 1.8 2002/04/18 07:22:25 elphick Exp $"

deferred class GTK_SCALE

inherit

   GTK_RANGE
      rename range as scale end

feature -- commands
   draw_value is
      do
	 gtk_scale_draw_value (scale)
      end

feature -- queries
   get_value_width (digits: INTEGER): INTEGER is
      do
	 Result := gtk_scale_get_value_width (scale)
      end

feature -- setters
   --TODO add queries

   set_digits (digits: INTEGER) is
	 -- number of decimal places to which value is rounded
      do
	 gtk_scale_set_digits (scale, digits)
      end

   set_draw_value (the_draw_value: BOOLEAN) is
	 -- show the value at all?
      do
	 gtk_scale_set_draw_value (scale, the_draw_value.to_integer)
      end

   set_value_pos (pos: INTEGER) is
	 -- which side of the widget should the value appear on?
      do
	 gtk_scale_set_value_pos (scale, pos)
      end

end -- GTK_SCALE
