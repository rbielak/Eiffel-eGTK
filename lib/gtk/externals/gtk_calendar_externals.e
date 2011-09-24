-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_CALENDAR"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_calendar_externals.e,v 1.4 2000/07/10 02:01:27 richieb Exp $"

class GTK_CALENDAR_EXTERNALS

feature  -- GtkCalendarDisplayOptions constants
	Gtk_calendar_show_heading: INTEGER		is  1	 --   1 << 0
	Gtk_calendar_show_day_names: INTEGER		is  2	 --   1 << 1
	Gtk_calendar_no_month_change: INTEGER		is  4	 --   1 << 2
	Gtk_calendar_show_week_numbers: INTEGER		is  8	 --   1 << 3
	Gtk_calendar_week_start_monday: INTEGER		is 16	 --   1 << 4

feature {NONE} -- GTK+ calls

	gtk_calendar_new: POINTER is
		external "C"
		end

	gtk_calendar_select_month (calendar: POINTER;
			 month, year: INTEGER): INTEGER is
		external "C"
		end

	gtk_calendar_select_day (calendar: POINTER;
			 day: INTEGER) is
		external "C"
		end

	gtk_calendar_mark_day (calendar: POINTER;
			 day: INTEGER): INTEGER is
		external "C"
		end

	gtk_calendar_unmark_day (calendar: POINTER;
			 day: INTEGER): INTEGER is
		external "C"
		end

	gtk_calendar_clear_marks (calendar: POINTER) is
		external "C"
		end

	gtk_calendar_display_options (calendar: POINTER;
			 flags: INTEGER) is
		-- flags should be the sum of one or more
		-- GtkCalendarDisplayOptions constants
		external "C"
		end

	gtk_calendar_get_date (calendar: POINTER;
			 year, month, day: POINTER) is
		-- year, month and day are pointers to guint
		external "C"
		end

	gtk_calendar_freeze (calendar: POINTER) is
		external "C"
		end

	gtk_calendar_thaw (calendar: POINTER) is
		external "C"
		end

end  -- GTK_CALENDAR_EXTERNALS
