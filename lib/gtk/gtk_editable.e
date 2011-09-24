-- Copyright 1999 Oliver Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_EDITABLE - a field containing text for editing"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Oliver Elphick"
	changed: "6 June 1999"
	cvs: "$Id: gtk_editable.e,v 1.11 2002/05/08 21:59:31 elphick Exp $"

deferred class GTK_EDITABLE

-- This is a widget containing text that can be edited

-- Available signals from gtkeditable:
--     "activate"        - when RETURN is pressed in the widget
--     "changed"         - when any change to the text occurs
--     "copy_clipboard"  -
--     "cut_clipboard"   -
--     "delete_text"     -
--     "insert_text"     -
--     "kill_char"       -
--     "kill_line"       -
--     "kill_word"       -
--     "move_cursor"     -
--     "move_page"       - 
--     "move_to_column"  -
--     "move_to_row"     - 
--     "move_word"       -
--     "paste_clipboard" -
--     "set-editable"    -

inherit

	GTK_WIDGET

	GTK_EDITABLE_EXTERNALS
		undefine
			copy, is_equal
		end
	
	EGTK_NON_PORTABLE
		undefine
			copy, is_equal
		end

feature -- text modification

	set_text(new_text: STRING) is
			-- Change the entire text contents of the widget
		require
			text_valid: new_text /= Void
		deferred
		ensure
			text_set: text.is_equal(new_text)
		end
	
	append_text (new_text: STRING) is
			-- add new_text to the end of the widget's text
		require
			text_valid: new_text /= Void
		deferred
		end
	
	prepend_text (new_text: STRING) is
			-- add new_text at the start of the widget's text
		require
			text_valid: new_text /= Void
		deferred
		end
	
	insert_text (new_text: STRING; pos: INTEGER) is
			-- insert new_text at the specified position in
			-- the widget's text
		require
			text_valid: new_text /= Void
			sane_position: pos >= 0
		do
			npc.np_gtk_editable_insert_text(widget, new_text, new_text.count, pos)
		end
	
	delete_text (start, finish: INTEGER) is
			-- delete and close up text in the specified range
		require
			sane: start >= 0 and start <= finish
		do
			gtk_editable_delete_text(widget, start, finish)
		end
	
feature -- getting text
	
	text: STRING is
			-- text actually contained by the widget
		deferred
		ensure
			not_void: Result /= Void
		end
	
	substring(start, finish: INTEGER): STRING is
		require
			sane: start >= 0 and finish >= start
		do
			Result := npc.np_string_from_pointer (gtk_editable_get_chars(widget, start, finish))
		ensure
			not_void: Result /= Void
		end
	
	text_length: INTEGER is
			-- length of the text in the widget
		deferred
		ensure
			Result >= 0
		end

feature -- text cursor postition

        get_text_cursor_position: INTEGER is
                -- returns the position of the text cursor in the text
                -- (the first character is at position 0)
                do
		        Result := gtk_editable_get_position (widget)
		end

        set_text_cursor_position(newpos: INTEGER) is
                -- sets the position of the text cursor in the text
                -- (the first character is at position 0).  The cursor
                -- is placed before the indicated character.
                require
                        in_range: newpos >= 0 and newpos < text_length
                do
		        gtk_editable_set_position (widget, newpos)
		end

feature -- widget attributes
	
	set_editable (flag: BOOLEAN) is
			-- if true the user can modify the text
		deferred
		end
	
feature -- selection
	
	select_region (start, finish: INTEGER) is
			-- select the designated region (preparatory to
			-- cut, copy, etc.  The selected text is high-
			-- lighted.
			-- If finish is negative, all text from start to
			-- the end is selected.
		require
			sane: (start < finish or finish < 0)  and finish <= text_length
		do
			gtk_editable_select_region(widget, start, finish)
		end
	
	cut_clipboard is
			-- cut the selected text and put it in the clipboard
		do
			gtk_editable_cut_clipboard(widget)
		end
	
	copy_clipboard is
			-- copy the selected text and put it in the clipboard
		do
			gtk_editable_copy_clipboard(widget)
		end
	
	paste_clipboard is
			-- overwrite the current selection with the current
			-- clipboard contents.  (If nothing is selected, this
			-- does an insert at the text cursor position.)
		do
			gtk_editable_paste_clipboard(widget)
		end
	
	delete_selection is
			-- delete the current text selection
		do
			gtk_editable_delete_selection(widget)
		end
	
	claim_selection is
			-- TODO: implement
		do
		end
	
feature -- control
	
	signal_a_change is
			-- emit a "changed" signal
		do
			gtk_editable_changed(widget)
		end
	
end -- GTK_EDITABLE
