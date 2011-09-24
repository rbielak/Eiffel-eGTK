-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1
-- (see forum.txt)
--
indexing

	description:	"??? gtkbindings.h calls ???"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_bindings_externals.e,v 1.3 2000/07/10 02:01:27 richieb Exp $"

class GTK_BINDINGS_EXTERNALS

-- There's no GTK+ documentation on this class; what does it do?

feature {NONE}  -- GTK+ calls

	gtk_pattern_spec_init (pspec, pattern: POINTER) is
		external "C"
		end

	gtk_pattern_spec_free_segs (pspec: POINTER) is
		external "C"
		end

	gtk_pattern_match (pspec: POINTER; string_length: INTEGER;
			string, string_reversed: POINTER): BOOLEAN is
		external "C"
		end

	gtk_pattern_match_string (pspec, string: POINTER): BOOLEAN is
		external "C"
		end

	gtk_pattern_match_simple (pattern, string: POINTER): BOOLEAN is
		external "C"
		end


-- Application-level methods

	gtk_binding_set_new (set_name: POINTER): POINTER is
		external "C"
		end

	gtk_binding_set_by_class (object_class: POINTER): POINTER is
		external "C"
		end

	gtk_binding_set_find (set_name: POINTER): POINTER is
		external "C"
		end

	gtk_bindings_activate (object: POINTER;
			keyval, modifiers: INTEGER): BOOLEAN is
		external "C"
		end

	gtk_binding_set_activate (binding_set: POINTER;
			keyval, modifiers: INTEGER;
			object: POINTER): BOOLEAN is
		external "C"
		end

-- #define	 gtk_binding_entry_add		gtk_binding_entry_clear

	gtk_binding_entry_clear (binding_set: POINTER;
			keyval, modifiers: INTEGER) is
		external "C"
		end

-- Eiffel doeesn't  support varargs - create a glue library call to receive
-- an array and build the call from there.
--	gtk_binding_entry_add_signal (binding_set: POINTER;
--			keyval, modifiers: INTEGER;
--			signal_name: POINTER;
--			n_args: INTEGER, ...) is
--		external "C"
--		end

	gtk_binding_set_add_path (binding_set: POINTER;
			path_type: INTEGER;
			path_pattern: POINTER;
			priority: INTEGER) is
		external "C"
		end

end -- GTK_BINDINGS_EXTERNALS
