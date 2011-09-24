-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_SELECTION"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_selection_externals.e,v 1.6 2002/04/18 09:00:23 elphick Exp $"

class GTK_SELECTION_EXTERNALS

feature {NONE}  -- GTK+ calls

	gtk_target_list_new (targets: POINTER; ntargets: INTEGER): POINTER is
		-- targets is a const GtkTargetEntry*
		-- returns a GtkTargetList*
		external "C"
		end

	gtk_target_list_ref (list: POINTER) is
		-- list is a GtkTargetList*
		external "C"
		end

	gtk_target_list_unref (list: POINTER) is
		-- list is a GtkTargetList*
		external "C"
		end

	gtk_target_list_add (list: POINTER; target: INTEGER;
					  flags, info: INTEGER) is
		-- list is a GtkTargetList*
		-- target is a GdkAtom
		external "C"
		end

	gtk_target_list_add_table (list, targets: POINTER;
					  ntargets: INTEGER) is
		-- list is a GtkTargetList*
		-- targets is a const GtkTargetEntry*
		external "C"
		end

	gtk_target_list_remove (list: POINTER; target: INTEGER) is
		-- list is a GtkTargetList*
		-- target is a GdkAtom
		external "C"
		end

	gtk_target_list_find (list: POINTER; target: INTEGER;
					  info: POINTER): BOOLEAN is
		-- list is a GtkTargetList*
		-- target is a GdkAtom
		external "C"
		end


	gtk_selection_owner_set (widget: POINTER;
			      selection: INTEGER;
			      time: INTEGER): INTEGER is
		-- widget is a GtkWidget*
		-- selection is a GdkAtom
		-- time is a guint32
		external "C"
		end

	gtk_selection_add_target (widget: POINTER; 
			       selection, target: INTEGER;
			       info: INTEGER) is
		-- widget is a GtkWidget*
		-- selection is a GdkAtom
		-- target is a GdkAtom
		external "C"
		end

	gtk_selection_add_targets (widget: POINTER; 
				selection: INTEGER;
				targets: POINTER;
				ntargets: INTEGER) is
		-- widget is a GtkWidget*
		-- selection is a GdkAtom
		-- targets is a const GtkTargetEntry*
		external "C"
		end

	gtk_selection_convert (widget: POINTER; 
			      selection, target: INTEGER;
			      time: INTEGER): INTEGER is
		-- widget is a GtkWidget*
		-- selection is a GdkAtom
		-- target is a GdkAtom
		-- time is a guint32
		external "C"
		end

	gtk_selection_data_set (selection_data: POINTER;
			     type: INTEGER;
			     format: INTEGER;
			     data: POINTER;
			     length: INTEGER) is
		-- selection_data is a GtkSelectionData*
		-- type is a GdkAtom
		-- data is a guchar*
		external "C"
		end


	-- Called when a widget is destroyed

	gtk_selection_remove_all (widget: POINTER) is
		-- widget is a GtkWidget*
		external "C"
		end


	-- Event handlers

	gtk_selection_clear (widget, event: POINTER): INTEGER is
		-- widget is a GtkWidget*
		-- event is a GdkEventSelection*
		external "C"
		end

	gtk_selection_request (widget, event: POINTER): INTEGER is
		-- widget is a GtkWidget*
		-- event is a GdkEventSelection*
		external "C"
		end

	gtk_selection_incr_event (window, event: POINTER): INTEGER is
		-- widget is a GtkWidget*
		-- event is a GdkEventProperty*
		external "C"
		end

	gtk_selection_notify (widget, event: POINTER): INTEGER is
		-- widget is a GtkWidget*
		-- event is a GdkEventSelection*
		external "C"
		end

	gtk_selection_property_notify (widget, event: POINTER): INTEGER is
		-- widget is a GtkWidget*
		-- event is a GdkEventProperty*
		external "C"
		end

	gtk_selection_data_copy (data: POINTER): POINTER is
		-- data is a GtkSelectionData*
		-- returns a GtkSelectionData*
		external "C"
		end

	gtk_selection_data_free (data: POINTER) is
		-- data is a GtkSelectionData*
		external "C"
		end

end  -- GTK_SELECTION_EXTERNALS
