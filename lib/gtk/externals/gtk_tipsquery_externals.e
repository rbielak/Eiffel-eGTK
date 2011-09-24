-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_TIPSQUERY"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_tipsquery_externals.e,v 1.3 2000/07/10 02:01:28 richieb Exp $"

class GTK_TIPSQUERY_EXTERNALS

feature {NONE}  -- GTK+ calls

	gtk_tips_query_new: POINTER is
		external "C"
		end

	gtk_tips_query_start_query (tips_query: POINTER) is
		external "C"
		end

	gtk_tips_query_stop_query (tips_query: POINTER) is
		external "C"
		end

	gtk_tips_query_set_caller (tips_query, caller: POINTER) is
		-- caller is a GtkWidget*
		external "C"
		end

	gtk_tips_query_set_labels (tips_query,
				 label_inactive, label_no_tip: POINTER) is
		-- label_inactive, label_no_tip are const gchar*
		external "C"
		end

end  -- GTK_TIPSQUERY_EXTERNALS
