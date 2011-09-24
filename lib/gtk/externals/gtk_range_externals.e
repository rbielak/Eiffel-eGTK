-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_RANGE"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_range_externals.e,v 1.4 2000/07/10 02:01:28 richieb Exp $"

class GTK_RANGE_EXTERNALS

feature {NONE} -- range stuff

	gtk_range_get_adjustment (range: POINTER): POINTER is
		external "C"
		end

	gtk_range_set_update_policy (range: POINTER; policy: INTEGER) is
		external "C"
		end

	gtk_range_set_adjustment (range: POINTER; adjustment: POINTER) is
		external "C"
		end

	gtk_range_draw_background (range: POINTER) is
		external "C"
		end

	gtk_range_clear_background (range: POINTER) is
		external "C"
		end

	gtk_range_draw_trough (range: POINTER) is
		external "C"
		end

	gtk_range_draw_slider (range: POINTER) is
		external "C"
		end

	gtk_range_draw_step_forw (range: POINTER) is
		external "C"
		end

	gtk_range_draw_step_back (range: POINTER) is
		external "C"
		end

	gtk_range_slider_update (range: POINTER) is
		external "C"
		end

	gtk_range_trough_click (range: POINTER;
			x, y: INTEGER; jump_perc: POINTER): INTEGER is
			-- jump_perc is a *gfloat
		external "C"
		end

	gtk_range_default_hslider_update (range: POINTER) is
		external "C"
		end

	gtk_range_default_vslider_update (range: POINTER) is
		external "C"
		end

	gtk_range_default_htrough_click (range: POINTER;
			x, y: INTEGER; jump_perc: POINTER): INTEGER is
			-- jump_perc is a *gfloat
		external "C"
		end

	gtk_range_default_vtrough_click (range: POINTER;
			x, y: INTEGER; jump_perc: POINTER): INTEGER is
			-- jump_perc is a *gfloat
		external "C"
		end

	gtk_range_default_hmotion (range: POINTER; x_delta, y_delta: INTEGER) is
		external "C"
		end

	gtk_range_default_vmotion (range: POINTER; x_delta, y_delta: INTEGER) is
		external "C"
		end

feature {NONE} -- range<-scale stuff
	gtk_scale_set_digits (scale: POINTER; digits: INTEGER) is
		external "C"
		end

	gtk_scale_set_draw_value (scale: POINTER; draw_value: INTEGER) is
		external "C"
		end

	gtk_scale_set_value_pos (scale: POINTER; pos: INTEGER) is
		external "C"
		end

	gtk_scale_get_value_width (scale: POINTER): INTEGER is
		external "C"
		end

	gtk_scale_draw_value (scale: POINTER) is
		external "C"
		end

feature {NONE} -- range<-scale<-hscale stuff
	gtk_hscale_new (adjustment: POINTER): POINTER is
		external "C"
		end

feature {NONE} -- range<-scale<-vscale stuff
	gtk_vscale_new (adjustment: POINTER): POINTER is
		external "C"
		end

feature {NONE} -- range<-scale<-hscrollbar stuff
	gtk_hscrollbar_new (adjustment: POINTER): POINTER is
		external "C"
		end

feature {NONE} -- range<-scale<-vscrollbar stuff
	gtk_vscrollbar_new (adjustment: POINTER): POINTER is
		external "C"
		end

end  -- GTK_RANGE_EXTERNALS
