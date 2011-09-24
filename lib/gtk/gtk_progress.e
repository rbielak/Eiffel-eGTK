-- Copyright 1999 Daniel Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_PROGRESS"
	author: "Daniel Elphick"

class GTK_PROGRESS

inherit

	GTK_WIDGET

	GTK_PROGRESS_EXTERNALS
		undefine
			copy, is_equal
		end

feature

	set_show_text(show_text: BOOLEAN) is
		local
			val: INTEGER
		do
			if show_text then
				val := 1
			end
			gtk_progress_set_show_text(widget, val)
		end

	set_text_alignment(x_align, y_align: REAL) is
		do
			gtk_progress_set_text_alignment(widget, x_align, y_align)
		end

	set_format_string(format: STRING) is
		do
			npc.np_gtk_progress_set_format_string(widget, format)
		end

	set_adjustment(adjustment: GTK_ADJUSTMENT) is
		do
			gtk_progress_set_adjustment(widget, adjustment.adjustment)
		end

	configure(value, min, max: REAL) is
		do
			gtk_progress_configure(widget, value, min, max)
		end

	set_percentage(percentage: REAL) is
		do
			gtk_progress_set_percentage(widget, percentage)
		end

	set_value(value: REAL) is
		do
			gtk_progress_set_value(widget, value)
		end

	get_value: REAL is
		do
			Result := gtk_progress_get_value(widget)
		end

	set_activity_mode(activity_mode: BOOLEAN) is
		local
			value: INTEGER
		do
			if activity_mode then
				value := 1
			end
			gtk_progress_set_activity_mode(widget, value)
		end

	get_current_text: STRING is
		do
			Result := npc.np_gtk_progress_get_current_text(widget)
		end

	get_text_from_value(value: REAL): STRING is
		do
			Result := npc.np_gtk_progress_get_text_from_value(widget, value)
		end
			
	get_current_percentage: REAL is
		do
			Result := gtk_progress_get_current_percentage(widget)
		end

	get_percentage_from_value(value: INTEGER): REAL is
		do
			Result := gtk_progress_get_percentage_from_value(widget, value)
		end

end -- GTK_PROGRESS
