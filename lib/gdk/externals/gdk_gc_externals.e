-- Copyright 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--

class GDK_GC_EXTERNALS

feature {NONE}

	c_gdk_gc_values_get_function (values: POINTER): INTEGER is
		external "C"
		end

	c_gdk_gc_values_set_function (values: POINTER; value:INTEGER) is
		external "C"
		end

	gdk_gc_new (window: POINTER): POINTER is
		external "C"
		end

	gdk_gc_destroy (gc: POINTER) is
		external "C"
		end

	gdk_gc_get_values (gc, values: POINTER) is
		external "C"
		end

	gdk_gc_set_function (gc: POINTER; function_code: INTEGER) is
		external "C"
		end

	gdk_gc_ref (gc:POINTER) is
		external "C"
		end

	gdk_gc_unref (gc:POINTER) is
		external "C"
		end

	c_gdk_make_gc_values: POINTER is
		external "C"
		end

end


