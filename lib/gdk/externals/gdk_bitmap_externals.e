-- Copyright (C) 2000  Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
class GDK_BITMAP_EXTERNALS

feature

	gdk_bitmap_ref (bp: POINTER): POINTER is
		external "C"
		end

	gdk_bitmap_unref (bp: POINTER) is
		external "C"
		end

	gdk_bitmap_create_from_data (window: POINTER; data: POINTER;
								 width, height: INTEGER): POINTER is
		external "C"
		end
								 

end
