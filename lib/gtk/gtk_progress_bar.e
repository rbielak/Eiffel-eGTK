-- Copyright 1999 Daniel Elphick and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_PROGRESS_BAR - for displaying the progress of a task"
	author: "Daniel Elphick"
	cvs: "$Id: gtk_progress_bar.e,v 1.2 2000/05/18 17:31:14 elphick Exp $"

class GTK_PROGRESS_BAR

inherit

	GTK_PROGRESS

	GTK_PROGRESS_BAR_EXTERNALS
		undefine
			copy, is_equal
		end

creation

	make,
	make_with_adjustment

feature

	set_bar_style(bar_style: INTEGER) is
      require
	 bar_style_in_range: bar_style >= Gtk_progress_continuous and
			     bar_style <= Gtk_progress_discrete
		do
			gtk_progress_bar_set_bar_style(widget, bar_style)
		end

	set_discrete_blocks(blocks: INTEGER) is
		do
			gtk_progress_bar_set_discrete_blocks(widget, blocks)
		end

	set_activity_step(step: INTEGER) is
		do
			gtk_progress_bar_set_activity_step(widget, step)
		end

	set_activity_blocks(blocks: INTEGER) is
		do
			gtk_progress_bar_set_activity_blocks(widget, blocks)
		end

	set_orientation(orientation: INTEGER) is
      require
	 in_range: orientation >= Gtk_progress_left_to_right and
		   orientation <= Gtk_progress_top_to_bottom
		do
			gtk_progress_bar_set_orientation(widget, orientation)
		end

	update(percentage: REAL) is
		do
			gtk_progress_bar_update(widget, percentage)
		end

feature {NONE}

	make is
		do
			widget := gtk_progress_bar_new
			register_widget
		end

	make_with_adjustment(adjustment: GTK_ADJUSTMENT) is
		do
			widget := gtk_progress_bar_new_with_adjustment(adjustment.adjustment)
			register_widget
		end

	
feature

end -- GTK_PROGRESS_BAR
