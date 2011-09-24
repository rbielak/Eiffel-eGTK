----------------------------------------------------------------------
-- Copyright 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing
	
	description: "Field access for GDK_COLOR"

class GDK_FONT_EXTERNALS

feature {NONE}

	gdk_font_load (description: POINTER): POINTER is
		external "C"
		end

	gdk_font_ref (f: POINTER): POINTER is
		external "C"
		end

	gdk_font_unref (f: POINTER) is
		external "C"
		end

end
