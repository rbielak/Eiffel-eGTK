-- Copyright 1999 Pirmin Kalberer and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_CALENDAR - a calendar widget"
	cvs: "$Id: gtk_calendar.e,v 1.3 1999/08/30 20:09:32 pi Exp $"

class GTK_CALENDAR

-- A calendar widget
--
-- Signals (from gtkcalendar.c):
--    "day_selected"               -
--    "day_selected_double_click"  -
--    "month_changed"              -
--    "next_month"                 -
--    "next_year"                  -
--    "prev_month"                 -
--    "prev_year"                  -

inherit
	
	GTK_WIDGET
	
	GTK_CALENDAR_EXTERNALS
		undefine
			copy, is_equal
		end

creation
	
	make,
	make_from_pointer
	
feature
	
	make is 
		do
			widget := gtk_calendar_new
			register_widget
		end
	
feature -- native GTK calls (UNTESTED) - TODO: replace POINTER types

   select_month ( month : INTEGER; year : INTEGER ) : INTEGER is
      do
         Result := gtk_calendar_select_month ( widget, month, year )
      end

   select_day ( day : INTEGER ) is
      do
         gtk_calendar_select_day ( widget, day )
      end

   mark_day ( day : INTEGER ) : INTEGER is
      do
         Result := gtk_calendar_mark_day ( widget, day )
      end

   unmark_day ( day : INTEGER ) : INTEGER is
      do
         Result := gtk_calendar_unmark_day ( widget, day )
      end

   clear_marks is
      do
         gtk_calendar_clear_marks ( widget )
      end

   display_options ( opt_flags : INTEGER ) is
      do
         gtk_calendar_display_options ( widget, opt_flags )
      end

   get_date ( year : POINTER; month : POINTER; day : POINTER ) is
      do
         gtk_calendar_get_date ( widget, year, month, day )
      end

   freeze is
      do
         gtk_calendar_freeze ( widget )
      end

   thaw is
      do
         gtk_calendar_thaw ( widget )
      end

end -- GTK_CALENDAR
