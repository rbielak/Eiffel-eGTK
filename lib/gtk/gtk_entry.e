-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_ENTRY - text entry widget"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"
	cvs: "$Id: gtk_entry.e,v 1.11 2003/01/11 19:32:51 elphick Exp $"
	

class GTK_ENTRY

-- A single-line text entry box.
--
-- Available signals from gtkeditable:
--     "activate"        - when RETURN is pressed in the box
--     "changed"         - when any change to the text occurs
--     "copy_clipboard"  -
--     "cut_clipboard"   -
--     "delete_text"     -
--     "insert_text"     -
--     "kill_char"       -
--     "kill_line"       -
--     "kill_word"       -
--     "move_cursor"     -
--     "move_page"       -  [probably not applicable]
--     "move_to_column"  -
--     "move_to_row"     -  [probably not applicable]
--     "move_word"       -
--     "paste_clipboard" -
--     "set-editable"    -

inherit

	GTK_EDITABLE

	GTK_ENTRY_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make,
	make_with_max_length,
	make_from_pointer

feature -- modifying text

	set_text (new_text: STRING) is
		require else
			text_valid: new_text /= Void
		do
--			gtk_entry_set_text (entry, $(new_text.to_c))
			npc.np_gtk_entry_set_text (widget, new_text)
		end

	append_text (new_text: STRING) is
		require else
			text_valid: new_text /= Void
		do
--			gtk_entry_append_text (entry, $(new_text.to_c))
			npc.np_gtk_entry_append_text (widget, new_text)
		end
		
	prepend_text (new_text: STRING) is
		require else
			text_valid: new_text /= Void
		do
--			gtk_entry_prepend_text (entry, $(new_text.to_c))
			npc.np_gtk_entry_prepend_text (widget, new_text)
		end

feature -- getting text

	text: STRING is
			-- text actually contained by the widget
		do
--			create Result.make (0)
--			Result.from_c (gtk_entry_get_text (entry))
			Result := npc.np_string_from_pointer (gtk_entry_get_text (widget))
		end

        text_length: INTEGER is
                do
                        Result := text.count
                end
		

feature -- widget attributes

	set_editable (flag: BOOLEAN) is
			-- if true the user can modify the text
		do
			gtk_entry_set_editable (widget, flag)
		end

	set_visible (flag: BOOLEAN) is
			-- if true the user can see the text
			-- use this to stop a password field echoing its contents
		do
			gtk_entry_set_visibility (widget, flag)
		end

feature {NONE}

	make is
			-- new text entry
		do
			widget := gtk_entry_new
			register_widget
		end

	make_with_max_length (len: INTEGER) is
			-- new text entry with a limit on text size
		require
			len_valid: len > 0
		do
			widget := gtk_entry_new_with_max_length (len)
			register_widget
		end

end
