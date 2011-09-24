-- Copyright (C) 1999 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Multi-line text widget"
	author: "Oliver Elphick"
	date: "June 1999"
	cvs: "$Id: gtk_text.e,v 1.11 2003/01/11 19:32:51 elphick Exp $"

class GTK_TEXT

-- A multi-line text widget
--
-- TODO: text properties
--
-- Signals (from gtktext.c):
--    "set_scroll_adjustments"

inherit

	GTK_EDITABLE

	GTK_TEXT_EXTERNALS
		undefine
			copy, is_equal
		end
	
	EGTK_NON_PORTABLE 
		undefine
			copy, is_equal
		end

creation

	make

feature -- set properties

	set_adjustments (h, v: GTK_ADJUSTMENT) is
			-- set the adjustments for horizontal and
			-- vertical scrolling; either or both can be void
			-- NB: The GTK+ tutorial says that horizontal
			--     scrolling is not yet supported
		local
			hp, vp: POINTER
		do
			hp := default_pointer
			vp := default_pointer
			h_adj := h
			if h /= Void then
				hp := h.adjustment
			end
			v_adj := v
			if v /= Void then
				vp := h.adjustment
			end
			gtk_text_set_adjustments (widget, hp, vp)
		end

	set_insertion_point (p: INTEGER) is
			-- place the text cursor relative to the start of the
			-- text (counting tabs, newlines, etc. as single
			-- characters.)
		require
			sane: p >= 0
		do
			gtk_text_set_point (widget, p)
		ensure
			point_set: insertion_point = p
		end
	
	freeze is
			-- prevent continuous update while many changes are
			-- being made (by default this happens anyway on an
			-- insertion >= 1024 characters.)
		do
			gtk_text_freeze(widget)
		end

	thaw is
			-- allow continuous update
		do
			gtk_text_thaw(widget)
		end

	set_editable (flag: BOOLEAN) is
			-- (flag = True)  = enable text editing in the widget
			-- (flag = False) = disable text editing in the widget
		do
			gtk_text_set_editable (widget, flag)
		end

	do_word_wrapping is
			-- have text wrap to a new line on a word boundary
		do
			gtk_text_set_line_wrap (widget, 1)
			gtk_text_set_word_wrap (widget, 1)
		end

	do_line_wrapping is
			-- have text wrap to a new line at a line end (of
			-- visible text).  This is automatically turned
			-- off if horizontal scrolling is in force.
		do
			gtk_text_set_word_wrap (widget, 0)
			gtk_text_set_line_wrap (widget, 1)
		end

	do_no_wrapping is
			-- do not wrap text at edge of widget: this really
			-- needs horizontal scrolling
		do
                        gtk_text_set_word_wrap (widget, 0)
                        gtk_text_set_line_wrap (widget, 0)
                end



feature -- text properties

	insertion_point: INTEGER is
		do
			Result := gtk_text_get_point (widget)
		end

	text_length: INTEGER is
		do
			Result := gtk_text_get_length(widget)
		end

feature -- text modification

	set_text (new_text: STRING) is
			-- Change the entire text contents of the widget
		do
			clear_all
			prepend_text (new_text)
		end

	append_text (new_text: STRING) is
			-- Add new_text to the end of the widget text
		do
			insert_text (new_text, text_length)
		end

	prepend_text (new_text: STRING) is
			-- Add new_text before the existing text
		do
			insert_text (new_text, 0)
		end

	clear_all is
			-- clear the widget of all its contents
		do
			set_insertion_point (0)
			if text_length > 0 then
				delete_forwards (text_length)
			end
		ensure
			empty: text_length = 0
		end

	delete_forwards (cnt: INTEGER) is
			-- delete cnt characters after the insertion point
		require
			sane: cnt > 0
		do
			gtk_text_forward_delete (widget, cnt)
		end

	delete_backwards (cnt: INTEGER) is
			-- delete cnt characters before the insertion point
		require
			sane: cnt > 0
		do
			gtk_text_backward_delete (widget, cnt)
		end

	insert (font: GDK_FONT; fore, back: GDK_COLOR; str: STRING) is
			-- Insert `text' using `font' and the `fore'ground and
			-- `back'ground colors into the text widget.
		local
			fnt, fg, bg: POINTER
		do
			if font = Void then
				fnt := default_pointer
			else
				fnt := font.font
			end
			if fore = Void then
				fg := default_pointer
			else
				fg := fore.color
			end
			if back = Void then
				bg := default_pointer
			else
				bg := back.color
			end
			
			npc.np_gtk_text_insert (widget, fnt, fg, bg, str)
		end

feature -- getting text

	text: STRING is
			-- text actually contained by the widget
		do
			Result := substring (0, text_length)
		end

feature {NONE}

	make is
			-- new text widget, which will generate its own
			-- adjustments
		do
			widget := gtk_text_new (default_pointer, default_pointer)
			create h_adj.make_from_pointer(c_gtk_text_hadj(widget))
			create v_adj.make_from_pointer(c_gtk_text_vadj(widget))
			register_widget
		ensure
			has_h_adj: h_adj /= Void
			has_v_adj: v_adj /= Void
		end

feature -- attributes

	h_adj: GTK_ADJUSTMENT
			-- NB: The GTK+ v1.2 tutorial says that horizontal
			--     scrolling is not yet supported

	v_adj: GTK_ADJUSTMENT

invariant

	has_h_adj: h_adj /= Void
	has_v_adj: v_adj /= Void

end -- GTK_TEXT
