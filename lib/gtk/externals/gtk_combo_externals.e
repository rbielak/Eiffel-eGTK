-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_COMBO"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_combo_externals.e,v 1.5 2000/07/10 02:01:27 richieb Exp $"

class GTK_COMBO_EXTERNALS

feature {NONE} -- GTK+ calls

	gtk_combo_new: POINTER is
		external "C"
		end

	-- the text in the entry must be or not be in the list
	gtk_combo_set_value_in_list (combo: POINTER; 
				val, ok_if_empty: INTEGER) is
		external "C"
		end

	-- set/unset arrows working for changing the value (can be annoying)
	gtk_combo_set_use_arrows (combo: POINTER; 
				val: INTEGER) is
		external "C"
		end

	-- up/down arrows change value if current value not in list
	gtk_combo_set_use_arrows_always (combo: POINTER; 
				val: INTEGER) is
		external "C"
		end

	-- perform case-sensitive comparisons
	gtk_combo_set_case_sensitive (combo: POINTER; 
				val: INTEGER) is
		external "C"
		end

	-- call this function on an item if it isn't a label or you want
	-- it to have a different value to be displayed in the entry
	gtk_combo_set_item_string (combo, item, item_value: POINTER) is
		-- item is a GtkItem*
		-- item_value is a const gchar*
		external "C"
		end

	-- simple interface
	gtk_combo_set_popdown_strings (combo, strings: POINTER) is
		-- strings is a GList*
		external "C"
		end

	gtk_combo_disable_activate (combo: POINTER) is
		external "C"
		end

-- code in glue library

	c_gtk_combo_set_popdown_strings (combo, strings: POINTER; count: INTEGER) is
		external "C"
		end

	c_gtk_combo_entry(combo: POINTER): POINTER is
		external "C"
		end

	c_gtk_combo_list(combo: POINTER): POINTER is
		external "C"
		end

end -- GTK_COMBO_EXTERNALS
