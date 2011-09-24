-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_MAIN"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_main_externals.e,v 1.7 2000/07/10 02:01:28 richieb Exp $"

class GTK_MAIN_EXTERNALS


feature {NONE}	

	gtk_check_version (required_major, required_minor,
			  required_micro: INTEGER): POINTER is
		-- returns a gchar*
		external "C"
		end

--  Initialization, exit, mainloop and miscellaneous routines
	gtk_init (argc, argv: POINTER) is
		-- argc is int*
		-- argv is char***
		external "C"
		end

	gtk_init_check (argc, argv: POINTER): BOOLEAN is
		-- argc is int*
		-- argv is char***
		external "C"
		end

	gtk_exit (n: INTEGER) is
		external "C"
		end

	gtk_set_locale is
		external "C"
		end

	gtk_events_pending: INTEGER is
		external "C"
		end

	-- The following is the event func GTK+ registers with GDK we
	-- expose it mainly to allow filtering of events between GDK and GTK+.
	gtk_main_do_event (event: POINTER) is
		-- event is a GdkEvent*
		external "C"
		end

	gtk_main is
		external "C"
		end

	gtk_main_level: INTEGER is
		external "C"
		end

	gtk_main_quit is
		external "C"
		end
	
	gtk_main_iteration: INTEGER is
			-- gtk_main_iteration () calls gtk_main_iteration_do(TRUE) */
		external "C"
		end


	gtk_main_iteration_do (blocking: BOOLEAN) is
		external "C"
		end

	gtk_true: INTEGER is
		external "C"
		end

	gtk_false: INTEGER is
		external "C"
		end


	gtk_grab_add (w: POINTER) is
		external "C"
		end

	gtk_grab_get_current: POINTER is
			-- returns a GtkWidget* 
		external "C"
		end


	gtk_grab_remove (w: POINTER) is
		external "C"
		end

-- cannot handles pointer_to_func
--	gtk_init_add (GtkFunction function;
--				    data: POINTER) is
--		external "C"
--		end

	gtk_quit_add_destroy (main_level: INTEGER;
				    object: POINTER) is
		external "C"
		end

--	gtk_quit_add (main_level: INTEGER,
--				    GtkFunction	       function,
--				    data: POINTER): INTEGER is
--		external "C"
--		end

--	gtk_quit_add_full (main_level: INTEGER,
--				    GtkFunction	       function,
--				    GtkCallbackMarshal marshal,
--				    data: POINTER,
--				    GtkDestroyNotify   destroy): INTEGER is
--		external "C"
--		end

	gtk_quit_remove (quit_handler_id: INTEGER) is
		external "C"
		end

	gtk_quit_remove_by_data (data: POINTER) is
		external "C"
		end

--	gtk_timeout_add (guint32	       interval: INTEGER,
--				    GtkFunction	       function,
--				    data: POINTER): INTEGER is
--		external "C"
--		end

--	gtk_timeout_add_full (guint32	       interval: INTEGER,
--				    GtkFunction	       function,
--				    GtkCallbackMarshal marshal,
--				    data: POINTER,
--				    GtkDestroyNotify   destroy): INTEGER is
--		external "C"
--		end

	gtk_timeout_remove (timeout_handler_id: INTEGER) is
		external "C"
		end

--	gtk_idle_add (GtkFunction function,
--				    data: POINTER): INTEGER is
--		external "C"
--		end

--	gtk_idle_add_priority (priority: INTEGER,
--				    GtkFunction	       function,
--				    data: POINTER): INTEGER is
--		external "C"
--		end

--	gtk_idle_add_full (priority: INTEGER,
--				    GtkFunction	       function,
--				    GtkCallbackMarshal marshal,
--				    gpointer	       data: POINTER,
--				    GtkDestroyNotify   destroy): INTEGER is
--		external "C"
--		end

	gtk_idle_remove (idle_handler_id: INTEGER) is
		-- idle_handler_id is a guint
		external "C"
		end

	gtk_idle_remove_by_data (data: POINTER) is
		-- data is a gpointer
		external "C"
		end

--	gtk_input_add_full (gint	       source,
--				    GdkInputCondition  condition,
--				    GdkInputFunction   function,
--				    GtkCallbackMarshal marshal,
--				    gpointer	       data: POINTER,
--				    GtkDestroyNotify   destroy): INTEGER is
--		external "C"
--		end
--
	gtk_input_remove (input_handler_id: INTEGER) is
		-- input_handler_id is a guint
		external "C"
		end



--	gtk_key_snooper_install (GtkKeySnoopFunc snooper,
--				    gpointer	    func_data): INTEGER is
--		external "C"
--		end

	gtk_key_snooper_remove (snooper_handler_id: INTEGER) is
		-- snooper_handler_id is a guint
		external "C"
		end

  
	gtk_get_current_event: POINTER is
		-- returns a GtkEvent*
		external "C"
		end

	gtk_get_event_widget (event: POINTER): POINTER is
		-- event is a GdkEvent*
		-- returns a GtkWidget*
		external "C"
		end

end  -- GTK_MAIN_EXTERNALS
