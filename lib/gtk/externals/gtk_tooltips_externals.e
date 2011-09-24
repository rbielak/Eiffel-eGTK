-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_TOOLTIPS"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_tooltips_externals.e,v 1.4 2000/07/10 02:01:28 richieb Exp $"

class GTK_TOOLTIPS_EXTERNALS


feature {NONE}

	gtk_tooltips_new: POINTER is
		external "C"
		end

	gtk_tooltips_enable (tooltips: POINTER) is
		external "C"
		end

	gtk_tooltips_disable (tooltips: POINTER) is
		external "C"
		end

	gtk_tooltips_set_delay (delay: INTEGER) is
		external "C"
		end
	
	gtk_tooltips_set_tip (tooltips, widget, tip, tip_private: POINTER) is
		external "C"
		end

	gtk_tooltips_set_colors (tooltips, background, foreground: POINTER) is
		-- background, foreground are GdkColor*
		external "C"
		end
	
	gtk_tooltips_data_get (widget: POINTER): POINTER is
		-- returns a GtkTooltipsData* 
		external "C"
		end
	
	gtk_tooltips_force_window (tooltips: POINTER) is
		external "C"
		end
	

end  -- GTK_TOOLTIPS_EXTERNALS
