-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_STYLE"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_style_externals.e,v 1.7 2000/07/10 02:01:28 richieb Exp $"

class GTK_STYLE_EXTERNALS

inherit

	GTK_ARROWTYPE_ENUM

	GTK_POSITIONTYPE_ENUM

	GTK_SHADOWTYPE_ENUM

	GTK_STATETYPE_ENUM

feature  -- GtkOrientation constants

	Gtk_orientation_horizontal: INTEGER	is 0
	Gtk_orientation_vertical: INTEGER	is 1

feature {NONE}  -- GTK+ calls

	gtk_style_new: POINTER is
		external "C"
		end

	gtk_style_copy (style: POINTER): POINTER is
		external "C"
		end

	gtk_style_attach (style, window: POINTER) is
		-- window is a GdkWindow*
		external "C"
		end

	gtk_style_detach (style: POINTER): POINTER is
		external "C"
		end

	gtk_style_ref (style: POINTER): POINTER is
		external "C"
		end

	gtk_style_unref (style: POINTER) is
		external "C"
		end

	gtk_style_set_background (style, window: POINTER;
			      state_type: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
		external "C"
		end

	gtk_style_apply_default_background (style, window: POINTER;
				set_bg: BOOLEAN;
				state_type: INTEGER; 
				area: POINTER; 
				x, y, width, height: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- area is a GdkRectangle*
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
		external "C"
		end

	gtk_draw_hline (style, window: POINTER;
		       state_type, x1, x2, y: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
		external "C"
		end

	gtk_draw_vline (style, window: POINTER;
		       state_type, y1, y2, x: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
		external "C"
		end

	gtk_draw_shadow (style, window: POINTER;
		       state_type, shadow_type,
		       x, y, width, height: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
		external "C"
		end

	gtk_draw_polygon (style, window: POINTER;
		       state_type, shadow_type: INTEGER;
		       points: POINTER;
		       npoints: INTEGER;
		       fill: BOOLEAN) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		-- points is a GdkPoint*
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
		external "C"
		end

	gtk_draw_arrow (style, window: POINTER;
		       state_type, shadow_type, arrow_type: INTEGER;
		       fill: BOOLEAN;
		       x, y, width, height: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		-- arrow_type is a GtkArrowType constant
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
			arrow: arrow_type >= Gtk_arrow_up and arrow_type <= Gtk_arrow_right
		external "C"
		end

	gtk_draw_diamond (style, window: POINTER;
		       state_type, shadow_type,
		       x, y, width, height: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
		external "C"
		end

	gtk_draw_oval (style, window: POINTER;
		       state_type, shadow_type,
		       x, y, width, height: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
		external "C"
		end

	gtk_draw_string (style, window: POINTER;
		       state_type, x, y: INTEGER;
		       string: POINTER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- string is a const gchar*
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
		external "C"
		end

	gtk_draw_box (style, window: POINTER;
		       state_type, shadow_type,
		       x, y, width, height: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
		external "C"
		end

	gtk_draw_flat_box (style, window: POINTER;
			state_type, shadow_type,
			x, y, width, height: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
		external "C"
		end

	gtk_draw_check (style, window: POINTER;
		       state_type, shadow_type,
		       x, y, width, height: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
		external "C"
		end

	gtk_draw_option (style, window: POINTER;
		       state_type, shadow_type,
		       x, y, width, height: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
		external "C"
		end

	gtk_draw_cross (style, window: POINTER;
		       state_type, shadow_type,
		       x, y, width, height: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
		external "C"
		end

	gtk_draw_ramp (style, window: POINTER;
		       state_type, shadow_type, arrow_type,
		       x, y, width, height: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		-- arrow_type is a GtkArrowType constant
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
			arrow: arrow_type >= Gtk_arrow_up and arrow_type <= Gtk_arrow_right
		external "C"
		end

	gtk_draw_tab (style, window: POINTER;
		       state_type, shadow_type,
		       x, y, width, height: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
		external "C"
		end

	gtk_draw_shadow_gap (style, window: POINTER;
			  state_type, shadow_type,
			  x, y, width, height,
			  gap_side, gap_x, gap_width: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		-- gap_side is a GtkPositionType constant
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
			position: gap_side >= Gtk_pos_left and gap_side <= Gtk_pos_bottom
		external "C"
		end

	gtk_draw_box_gap (style, window: POINTER;
		       state_type, shadow_type,
		       x, y, width, height,
		       gap_side, gap_x, gap_width: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		-- gap_side is a GtkPositionType constant
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
			position: gap_side >= Gtk_pos_left and gap_side <= Gtk_pos_bottom
		external "C"
		end

	gtk_draw_extension (style, window: POINTER;
			 state_type, shadow_type,
			 x, y, width, height, gap_side: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		-- gap_side is a GtkPositionType constant
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
			position: gap_side >= Gtk_pos_left and gap_side <= Gtk_pos_bottom
		external "C"
		end

	gtk_draw_focus (style, window: POINTER;
		       x, y, width, height: INTEGER) is
		-- window is a GdkWindow*
		external "C"
		end

	gtk_draw_slider (style, window: POINTER;
		       state_type, shadow_type,
		       x, y, width, height, orientation: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		-- orientation is a GtkOrientation constant
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
		external "C"
		end

	gtk_draw_handle (style, window: POINTER;
		       state_type, shadow_type,
		       x, y, width, height, orientation: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		-- orientation is a GtkOrientation constant
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
		external "C"
		end

	gtk_paint_hline (style, window: POINTER;
			state_type: INTEGER;
			area, widget, detail: POINTER;
			x1, x2, y: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- area is a GdkRectangle*
		-- widget is a GtkWidget*
		-- detail is a gchar*
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
		external "C"
		end

	gtk_paint_vline (style, window: POINTER;
			state_type: INTEGER;
			area, widget, detail: POINTER;
			y1, y2, x: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- area is a GdkRectangle*
		-- widget is a GtkWidget*
		-- detail is a gchar*
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
		external "C"
		end

	gtk_paint_shadow (style, window: POINTER;
			state_type, shadow_type: INTEGER;
			area, widget, detail: POINTER;
			x, y, width, height: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		-- area is a GdkRectangle*
		-- widget is a GtkWidget*
		-- detail is a gchar*
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
		external "C"
		end

	gtk_paint_polygon (style, window: POINTER;
			state_type, shadow_type: INTEGER;
			area, widget, detail, points: POINTER;
			npoints: INTEGER;
			fill: BOOLEAN) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		-- area is a GdkRectangle*
		-- widget is a GtkWidget*
		-- detail is a gchar*
		-- points is a GdkPoint*
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
		external "C"
		end

	gtk_paint_arrow (style, window: POINTER;
			state_type, shadow_type: INTEGER;
			area, widget, detail: POINTER;
			arrow_type: INTEGER;
			fill: BOOLEAN;
			x, y, width, height: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		-- area is a GdkRectangle*
		-- widget is a GtkWidget*
		-- detail is a gchar*
		-- arrow_type is a GtkArrowType constant
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
			arrow: arrow_type >= Gtk_arrow_up and arrow_type <= Gtk_arrow_right
		external "C"
		end

	gtk_paint_diamond (style, window: POINTER;
			state_type, shadow_type: INTEGER;
			area, widget, detail: POINTER;
			x, y, width, height: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		-- area is a GdkRectangle*
		-- widget is a GtkWidget*
		-- detail is a gchar*
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
		external "C"
		end

	gtk_paint_oval (style, window: POINTER;
			state_type, shadow_type: INTEGER;
			area, widget, detail: POINTER;
			x, y, width, height: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		-- area is a GdkRectangle*
		-- widget is a GtkWidget*
		-- detail is a gchar*
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
		external "C"
		end

	gtk_paint_string (style, window: POINTER;
			state_type: INTEGER;
			area, widget, detail: POINTER;
			x, y: INTEGER;
			string: POINTER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- area is a GdkRectangle*
		-- widget is a GtkWidget*
		-- detail is a gchar*
		-- string is a const gchar*
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
		external "C"
		end

	gtk_paint_box (style, window: POINTER;
			state_type, shadow_type: INTEGER;
			area, widget, detail: POINTER;
			x, y, width, height: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		-- area is a GdkRectangle*
		-- widget is a GtkWidget*
		-- detail is a gchar*
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
		external "C"
		end

	gtk_paint_flat_box (style, window: POINTER;
			 state_type, shadow_type: INTEGER;
			 area, widget, detail: POINTER;
			 x, y, width, height: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		-- area is a GdkRectangle*
		-- widget is a GtkWidget*
		-- detail is a gchar*
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
		external "C"
		end

	gtk_paint_check (style, window: POINTER;
			state_type, shadow_type: INTEGER;
			area, widget, detail: POINTER;
			x, y, width, height: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		-- area is a GdkRectangle*
		-- widget is a GtkWidget*
		-- detail is a gchar*
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
		external "C"
		end

	gtk_paint_option (style, window: POINTER;
			state_type, shadow_type: INTEGER;
			area, widget, detail: POINTER;
			x, y, width, height: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		-- area is a GdkRectangle*
		-- widget is a GtkWidget*
		-- detail is a gchar*
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
		external "C"
		end

	gtk_paint_cross (style, window: POINTER;
			state_type, shadow_type: INTEGER;
			area, widget, detail: POINTER;
			x, y, width, height: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		-- area is a GdkRectangle*
		-- widget is a GtkWidget*
		-- detail is a gchar*
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
		external "C"
		end

	gtk_paint_ramp (style, window: POINTER;
			state_type, shadow_type: INTEGER;
			area, widget, detail: POINTER;
			arrow_type, x, y, width, height: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		-- area is a GdkRectangle*
		-- widget is a GtkWidget*
		-- detail is a gchar*
		-- arrow_type is a GtkArrowType constant
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
			arrow: arrow_type >= Gtk_arrow_up and arrow_type <= Gtk_arrow_right
		external "C"
		end

	gtk_paint_tab (style, window: POINTER;
			state_type, shadow_type: INTEGER;
			area, widget, detail: POINTER;
			x, y, width, height: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		-- area is a GdkRectangle*
		-- widget is a GtkWidget*
		-- detail is a gchar*
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
		external "C"
		end

	gtk_paint_shadow_gap (style, window: POINTER;
			   state_type, shadow_type: INTEGER;
			   area, widget, detail: POINTER;
			   x, y, width, height,
			   gap_side, gap_x, gap_width: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		-- area is a GdkRectangle*
		-- widget is a GtkWidget*
		-- detail is a gchar*
		-- gap_side is a GtkPositionType constant
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
			position: gap_side >= Gtk_pos_left and gap_side <= Gtk_pos_bottom
		external "C"
		end

	gtk_paint_box_gap (style, window: POINTER;
			state_type, shadow_type: INTEGER;
			area, widget, detail: POINTER;
			x, y, width, height,
			gap_side, gap_x, gap_width: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		-- area is a GdkRectangle*
		-- widget is a GtkWidget*
		-- detail is a gchar*
		-- gap_side is a GtkPositionType constant
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			position: gap_side >= Gtk_pos_left and gap_side <= Gtk_pos_bottom
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
		external "C"
		end

	gtk_paint_extension (style, window: POINTER;
			  state_type, shadow_type: INTEGER;
			  area, widget, detail: POINTER;
			  x, y, width, height, gap_side: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		-- area is a GdkRectangle*
		-- widget is a GtkWidget*
		-- detail is a gchar*
		-- gap_side is a GtkPositionType constant
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
			position: gap_side >= Gtk_pos_left and gap_side <= Gtk_pos_bottom
		external "C"
		end

	gtk_paint_focus (style, window, area, widget, detail: POINTER;
			x, y, width, height: INTEGER) is
		-- window is a GdkWindow*
		-- area is a GdkRectangle*
		-- widget is a GtkWidget*
		-- detail is a gchar*
		external "C"
		end

	gtk_paint_slider (style, window: POINTER;
			state_type, shadow_type: INTEGER;
			area, widget, detail: POINTER;
			x, y, width, height, orientation: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		-- area is a GdkRectangle*
		-- widget is a GtkWidget*
		-- detail is a gchar*
		-- orientation is a GtkOrientation constant
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
		external "C"
		end

	gtk_paint_handle (style, window: POINTER;
			state_type, shadow_type: INTEGER;
			area, widget, detail: POINTER;
			x, y, width, height, orientation: INTEGER) is
		-- window is a GdkWindow*
		-- state_type is a GtkStateType constant
		-- shadow_type is a GtkShadowType constant
		-- area is a GdkRectangle*
		-- widget is a GtkWidget*
		-- detail is a gchar*
		-- orientation is a GtkOrientation constant
		require
			type: state_type >= Gtk_state_normal and state_type <= Gtk_state_insensitive
			shadow: shadow_type >= Gtk_shadow_none and shadow_type <= Gtk_shadow_etched_out
		external "C"
		end

feature {NONE} -- code in the glue library

	c_gtk_style_get_fg_gc (style: POINTER; index: INTEGER): POINTER is
		require
			index_non_negative: index >= 0
			index_not_to_big: -- index not too big
		external "C"
		end

	c_gtk_style_get_bg_gc (style: POINTER; index: INTEGER): POINTER is
		require
			index_non_negative: index >= 0
			index_not_to_big: -- index not too big
		external "C"
		end

	c_gtk_style_get_light_gc (style: POINTER; index: INTEGER): POINTER is
		require
			index_non_negative: index >= 0
			index_not_to_big: -- index not too big
		external "C"
		end

	c_gtk_style_get_dark_gc (style: POINTER; index: INTEGER): POINTER is
		require
			index_non_negative: index >= 0
			index_not_to_big: -- index not too big
		external "C"
		end

	c_gtk_style_get_mid_gc (style: POINTER; index: INTEGER): POINTER is
		require
			index_non_negative: index >= 0
			index_not_to_big: -- index not too big
		external "C"
		end

	c_gtk_style_get_text_gc (style: POINTER; index: INTEGER): POINTER is
		require
			index_non_negative: index >= 0
			index_not_to_big: -- index not too big
		external "C"
		end

	c_gtk_style_get_base_gc (style: POINTER; index: INTEGER): POINTER is
		require
			index_non_negative: index >= 0
			index_not_to_big: -- index not too big
		external "C"
		end

	c_gtk_style_get_fg (style: POINTER; index: INTEGER): POINTER is
		external "C"
		end

	c_gtk_style_get_bg (style: POINTER; index: INTEGER): POINTER is
		external "C"
		end

	c_gtk_style_get_base (style: POINTER; index: INTEGER): POINTER is
		external "C"
		end

	c_gtk_style_get_light (style: POINTER; index: INTEGER): POINTER is
		external "C"
		end

	c_gtk_style_get_dark (style: POINTER; index: INTEGER): POINTER is
		external "C"
		end

	c_gtk_style_get_mid (style: POINTER; index: INTEGER): POINTER is
		external "C"
		end

	c_gtk_style_get_text (style: POINTER; index: INTEGER): POINTER is
		external "C"
		end

	c_gtk_style_set_fg (style: POINTER; color: POINTER; index: INTEGER) is
		external "C"
		end

	c_gtk_style_set_bg (style: POINTER; color: POINTER; index: INTEGER) is
		external "C"
		end

	c_gtk_style_set_base (style: POINTER; color: POINTER; index: INTEGER) is
		external "C"
		end

	c_gtk_style_set_mid (style: POINTER; color: POINTER; index: INTEGER) is
		external "C"
		end

	c_gtk_style_set_light (style: POINTER; color: POINTER; index: INTEGER) is
		external "C"
		end

	c_gtk_style_set_dark  (style: POINTER; color: POINTER; index: INTEGER) is
		external "C"
		end

	c_gtk_style_set_text (style: POINTER; color: POINTER; index: INTEGER) is
		external "C"
		end


--TODO
--HERE decide what to do, if anything, about upper bound in get_xxx_gc contracts

	c_gtk_style_get_black_gc (style: POINTER): POINTER is
		external "C"
		end

	c_gtk_style_get_white_gc (style: POINTER): POINTER is
		external "C"
		end

	c_gtk_style_font (style: POINTER): POINTER is
		external "C"
		end

	c_gtk_style_set_font (style: POINTER; font: POINTER) is
		external "C"
		end		

end  -- GTK_STYLE_EXTERNALS
