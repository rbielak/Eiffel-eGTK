-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_PROGRESS_BAR"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_progress_bar_externals.e,v 1.4 2000/07/10 02:01:28 richieb Exp $"

class GTK_PROGRESS_BAR_EXTERNALS

feature -- GtkprogressBarStyle constants

	Gtk_progress_continuous: INTEGER		is 0
	Gtk_progress_discrete: INTEGER			is 1

feature -- GtkProgressbarOrientation constants

	Gtk_progress_left_to_right: INTEGER		is 0
	Gtk_progress_right_to_left: INTEGER		is 1
	Gtk_progress_bottom_to_top: INTEGER		is 2
	Gtk_progress_top_to_bottom: INTEGER		is 3

feature {NONE} -- GTK+ calls

	gtk_progress_bar_new: POINTER is
		external "C"
		end

	gtk_progress_bar_new_with_adjustment (adjustment: POINTER): POINTER is
		-- adjustment is a GtkAdjustment*
		external "C"
		end

	gtk_progress_bar_set_bar_style (pbar: POINTER; style: INTEGER) is
		-- style is a GtkProgressBarStyle constant
		external "C"
		end

	gtk_progress_bar_set_discrete_blocks (pbar: POINTER; blocks: INTEGER) is
		external "C"
		end

	gtk_progress_bar_set_activity_step (pbar: POINTER; step: INTEGER) is
		external "C"
		end

	gtk_progress_bar_set_activity_blocks (pbar: POINTER;
						  blocks: INTEGER) is
		external "C"
		end

	gtk_progress_bar_set_orientation (pbar: POINTER;
					  orientation: INTEGER) is
		-- orientations is a GtkProgressBarOrientation constant
		external "C"
		end

	gtk_progress_bar_update (pbar: POINTER; percentage: REAL) is
		external "C"
		end

end  -- GTK_PROGRESS_BAR_EXTERNALS
