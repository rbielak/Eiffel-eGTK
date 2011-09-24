-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_TOOLTIPS -  global controls general characteristics %
                 %of tooltips"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"
	cvs: "$Id: gtk_tooltips.e,v 1.7 2000/07/10 02:01:27 richieb Exp $"

class GTK_TOOLTIPS

inherit

	GTK_TOOLTIPS_EXTERNALS

	EGTK_NON_PORTABLE

feature

	set_tool_tip (tip: STRING; widget: GTK_WIDGET) is
		require
			tip_valid: tip /= Void
			widget_valid: widget /= Void
		do
			npc.np_gtk_tooltips_set_tip (tooltips, widget.widget, tip)
		end

	enable is
		do
			gtk_tooltips_enable (tooltips)
		end

	disable is
		do
			gtk_tooltips_disable (tooltips)
		end

	set_delay (delay: INTEGER) is
		require
			delay > 0
		do
			gtk_tooltips_set_delay (delay)
		end

feature {NONE}

	tooltips: POINTER is
		once
			Result := gtk_tooltips_new
		end

end
	
