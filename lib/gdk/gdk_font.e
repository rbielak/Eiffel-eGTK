-- Copyright (C) 1999 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	cvs: "$Id: gdk_font.e,v 1.5 2002/02/26 15:58:42 elphick Exp $"

class GDK_FONT

inherit
	
	EGTK_HANDLE
		rename
			handle as font
		redefine
			destroy_object
		end

	GDK_FONT_EXTERNALS
		undefine
			is_equal, copy
		end

	EGTK_NON_PORTABLE
		undefine
			is_equal, copy
		end

creation

	make_from_description,
	make_from_pointer

feature -- Creation
	
	make_from_description (description: STRING) is
			-- Create the font from `description'.
		do
			load (description)
			register(font, Current)
		end

feature

	load (description: STRING) is
			-- Load the font.
		do
			font := gdk_npc.np_gdk_font_load (description)
			font := gdk_font_ref (font)
		end

	destroy_object is
		do
	--		unregister(font)  -- causes a segfault, but I can't see why
			gdk_font_unref (font)
		end
	
end -- GDK_FONT
