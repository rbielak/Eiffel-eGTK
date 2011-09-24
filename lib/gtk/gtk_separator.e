-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_SEPARATOR - a separator widget"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"
	cvs: "$Id: gtk_separator.e,v 1.7 2000/07/10 02:01:27 richieb Exp $"

class GTK_SEPARATOR

inherit

	GTK_WIDGET

	GTK_VSEPARATOR_EXTERNALS
		undefine
			copy, is_equal
		end

	GTK_HSEPARATOR_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make_horizontal, 
	make_vertical, 
	make_from_pointer

feature {NONE}

	make_horizontal is
		do
			widget := gtk_hseparator_new
			register_widget
		end
	
	make_vertical is
		do
			widget := gtk_vseparator_new
			register_widget
		end
		

end	
