-- Copyright 1999 Pirmin Kalberer and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GTK_TIPS_QUERY"
	cvs: "$Id: gtk_tips_query.e,v 1.3 1999/08/30 20:09:32 pi Exp $"

class GTK_TIPS_QUERY

-- Query onscreen widgets for their tooltips
--
-- Signals (from gtktipsquery.c):
--    "start_query"
--    "stop_query"
--    "widget_entered"
--    "widget_selected"

inherit
	
   GTK_LABEL
      rename
	 make as make_label
      end
	
   GTK_TIPSQUERY_EXTERNALS
      undefine
	 copy, is_equal
      end

creation
	
	make,
	make_from_pointer
	
feature
	
	make is 
		do
			widget := gtk_tips_query_new
			register_widget
		end
	
feature -- native GTK calls (UNTESTED) - TODO: replace POINTER types

   start_query is
      do
         gtk_tips_query_start_query ( widget )
      end

   stop_query is
      do
         gtk_tips_query_stop_query ( widget )
      end

   set_caller ( caller : POINTER ) is
      do
         gtk_tips_query_set_caller ( widget, caller )
      end

   set_labels ( label_inactive : POINTER; label_no_tip : POINTER ) is
      do
         gtk_tips_query_set_labels ( widget, label_inactive, label_no_tip )
      end
   
end -- GTK_TIPS_QUERY
