-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Calls to gdk toolkit that are not portable between %
                 %compilers. This is the SE version "
	author: "Richieb Bielak"

class GDK_NON_PORTABLE_CALLS

inherit

	GDK_PIXMAP_EXTERNALS
	
	GDK_FONT_EXTERNALS

feature

	np_gdk_pixmap_create_from_data (window: POINTER;
									data: STRING;
									w, h, d: INTEGER;
									fg_color, bg_color: POINTER): POINTER is
		do
			 Result := gdk_pixmap_create_from_data (window,
													data.to_external,
													w, h, d,
													fg_color, bg_color)
		end
	
	np_gdk_pixmap_create_from_xpm (window: POINTER;
								   mask: POINTER;
								   color: POINTER;
								   fname: STRING): POINTER is
		do
			Result := gdk_pixmap_create_from_xpm (window,
												  mask,
												  color,
												  fname.to_external)
		end


	np_gdk_pixmap_create_from_xpm_d (window: POINTER;
									 mask: POINTER;
									 color: POINTER;
									 data: STRING): POINTER is
		do
			Result := gdk_pixmap_create_from_xpm_d (window,
													mask,
													color,
													data.to_external)
		end


	np_gdk_font_load (description: STRING): POINTER is
		do
			Result := gdk_font_load (description.to_external)
		end

feature  -- externals called differently

	c_gdk_input_add (fd: INTEGER; condition: INTEGER; object: GDK_INPUT_FUNCTION): INTEGER is
		external "C"
		end

	c_gdk_input_add_full (fd: INTEGER; condition: INTEGER; object: GDK_INPUT_FUNCTION): INTEGER is
		external "C"
		end

end
