-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_COLORSEL"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_colorsel_externals.e,v 1.7 2000/07/29 01:58:27 richieb Exp $"

class GTK_COLORSEL_EXTERNALS
   
inherit
	
	GTK_UPDATE_ENUM

feature {NONE} -- GTK+ calls
   
   gtk_color_selection_new: POINTER is
      external "C"
      end
   
   gtk_color_selection_set_update_policy (colorsel: POINTER;
					  policy: INTEGER) is
	 -- policy is a GtkUpdateType constant
      require
	 in_range: policy >= Gtk_update_continuous and policy <= Gtk_update_delayed
      external "C"
      end
   
   gtk_color_selection_set_opacity (colorsel: POINTER;
				    use_opacity: INTEGER) is
	 -- use_opacity is an INTEGER acting as a BOOLEAN; opacity is 
	 -- another name for the alpha channel
      external "C"
      end
   
   gtk_color_selection_set_color (colorsel, colour: POINTER) is
	 -- colour is a gdouble*; this is an array of 
	 -- gdoubles, which is either 3 or 4 in length.  
	 -- colour[0] = red; [1] = green; [2] = blue and [3] = 
	 -- opacity, but only if opacity has been set true.  All 
	 -- values are in the range 0.0 to 1.0
      external "C"
      end
   
   gtk_color_selection_get_color (colorsel, colour: POINTER) is
	 -- colour is a gdouble*, whose structure is as described 
	 -- above
      external "C"
      end

   
end  -- GTK_COLORSEL_EXTERNALS
