-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_PROGRESS"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_progress_externals.e,v 1.3 2000/07/10 02:01:28 richieb Exp $"

class GTK_PROGRESS_EXTERNALS

feature {NONE}  -- GTK+ calls

	gtk_progress_set_show_text (progress: POINTER; show_text: INTEGER) is
		external "C"
		end

	gtk_progress_set_text_alignment (progress: POINTER;
					     x_align, y_align: REAL) is
		external "C"
		end

	gtk_progress_set_format_string (progress, format: POINTER) is
		-- adjustment is a gchar*
		external "C"
		end

	gtk_progress_set_adjustment (progress, adjustment: POINTER) is
		-- adjustment is a GtkAdjustment*
		external "C"
		end

	gtk_progress_configure (progress: POINTER; value, min, max: REAL) is
		external "C"
		end

	gtk_progress_set_percentage (progress: POINTER; percentage: REAL) is
		external "C"
		end

	gtk_progress_set_value (progress: POINTER; value: REAL) is
		external "C"
		end

	gtk_progress_get_value (progress: POINTER): REAL is
		external "C"
		end

	gtk_progress_set_activity_mode (progress: POINTER;
					activity_mode: INTEGER) is
		external "C"
		end

	gtk_progress_get_current_text (progress: POINTER): POINTER is
		-- returns a gchar*
		external "C"
		end

	gtk_progress_get_text_from_value (progress: POINTER;
					     value: REAL): POINTER is
		-- returns a gchar*
		external "C"
		end

	gtk_progress_get_current_percentage (progress: POINTER): REAL is
		external "C"
		end

	gtk_progress_get_percentage_from_value (progress: POINTER;
						   value: REAL): REAL is
		external "C"
		end

end  -- GTK_PROGRESS_EXTERNALS
