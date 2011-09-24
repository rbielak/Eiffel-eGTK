-- Copyright (C) 1999 Dave E Martin XXIII and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing
	description: "Gtk Range"
	author: "Dave E Martin XXIII"
	genesis: "199905120155 utc"
	version: "v 0.3.5 GTK+ 1.2.x"
	gtk_version: "1.2"
	cvs: "$Id: gtk_range.e,v 1.8 2003/01/11 19:32:51 elphick Exp $"

deferred class GTK_RANGE

inherit

	GTK_WIDGET
		rename 
			widget as range
		end

	GTK_RANGE_EXTERNALS
		undefine
			copy, is_equal
		end	

feature
	--TODO add queries and possibly setters, if not handled by the below

	adjustment: GTK_ADJUSTMENT is
		local
			p: POINTER
		do
			p := gtk_range_get_adjustment (range)
			if adjustment_cache = Void or else
				adjustment_cache.adjustment /= p
			then
				create  adjustment_cache.make_from_pointer (p)
			end
			Result := adjustment_cache
		end

	set_update_policy (the_policy: INTEGER) is
		do
			gtk_range_set_update_policy (range, the_policy)
		end

	set_adjustment (the_adjustment: GTK_ADJUSTMENT) is
		do
			gtk_range_set_adjustment (range, the_adjustment.adjustment)
		end

	draw_background is
		do
			gtk_range_draw_background (range)
		end

	clear_background is
		do
			gtk_range_clear_background (range)
		end

	draw_trough is
		do
			gtk_range_draw_trough (range)
		end

	draw_slider is
		do
			gtk_range_draw_slider (range)
		end

	draw_step_forward is
		do
			gtk_range_draw_step_forw (range)
		end

	draw_step_backward is
		do
			gtk_range_draw_step_back (range)
		end

	slider_update is
		do
			gtk_range_slider_update (range)
		end

---TODO	trough_click (x, y: INTEGER; jump_perc): INTEGER
	default_hslider_update is
		do
			gtk_range_default_hslider_update (range)
		end

	default_vslider_update is
		do
			gtk_range_default_vslider_update (range)
		end

---TODO	default_htrough_click (x, y: INTEGER; jump_perc): INTEGER
---TODO	default_vtrough_click (x, y: INTEGER; jump_perc): INTEGER
	default_hmotion (x_delta, y_delta: INTEGER) is
		do
			gtk_range_default_hmotion (range, x_delta, y_delta)
		end

	default_vmotion (x_delta, y_delta: INTEGER) is
		do
			gtk_range_default_vmotion (range, x_delta, y_delta)
		end

feature {NONE} -- implementation
	adjustment_cache: GTK_ADJUSTMENT

end -- GTK_RANGE
