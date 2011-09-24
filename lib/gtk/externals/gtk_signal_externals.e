-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_SIGNAL"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_signal_externals.e,v 1.4 2000/07/10 02:01:28 richieb Exp $"

class GTK_SIGNAL_EXTERNALS

-- features commented out use pointer_to_func or varargs and cannot be
-- implemented directly

feature {NONE}  -- GTK+ calls - Application-level methods

	gtk_signal_lookup (name: POINTER; object_type: INTEGER): INTEGER is
		-- name is a const gchar*
		-- obhect_type is a GtkType constant
		external "C"
		end

	gtk_signal_name (signal_id: INTEGER): POINTER is
		-- returns a gchar*
		external "C"
		end

	gtk_signal_n_emissions (object: POINTER;
					signal_id: INTEGER): INTEGER is
		-- object is a GtkObject*
		external "C"
		end

	gtk_signal_n_emissions_by_name (object, name: POINTER): INTEGER is
		-- object is a GtkObject*
		-- name is a const gchar*
		external "C"
		end

	gtk_signal_emit_stop (object: POINTER; signal_id: INTEGER) is
		-- object is a GtkObject*
		external "C"
		end

	gtk_signal_emit_stop_by_name (object, name: POINTER) is
		-- object is a GtkObject*
		-- name is a const gchar*
		external "C"
		end

-- guint  gtk_signal_connect (GtkObject	       *object,
-- 					   const gchar	       *name,
-- 					   GtkSignalFunc	func,
-- 					   gpointer		func_data);
-- guint  gtk_signal_connect_after (GtkObject	       *object,
-- 					   const gchar	       *name,
-- 					   GtkSignalFunc	func,
-- 					   gpointer		func_data);
-- guint  gtk_signal_connect_object (GtkObject	       *object,
-- 					   const gchar	       *name,
-- 					   GtkSignalFunc	func,
-- 					   GtkObject	       *slot_object);
-- guint  gtk_signal_connect_object_after (GtkObject	       *object,
-- 					   const gchar	       *name,
-- 					   GtkSignalFunc	func,
-- 					   GtkObject	       *slot_object);
-- guint  gtk_signal_connect_full (GtkObject	       *object,
-- 					   const gchar	       *name,
-- 					   GtkSignalFunc	func,
-- 					   GtkCallbackMarshal	marshal,
-- 					   gpointer		data,
-- 					   GtkDestroyNotify	destroy_func,
-- 					   gint			object_signal,
-- 					   gint			after);

-- void   gtk_signal_connect_object_while_alive (GtkObject	       *object,
-- 					      const gchar      *signal,
-- 					      GtkSignalFunc	func,
-- 					      GtkObject	       *alive_object);
-- void   gtk_signal_connect_while_alive (GtkObject	       *object,
-- 					      const gchar      *signal,
-- 					      GtkSignalFunc	func,
-- 					      gpointer		func_data,
-- 					      GtkObject	       *alive_object);

	gtk_signal_disconnect (object: POINTER; handler_id: INTEGER) is
		external "C"
		end

-- void   gtk_signal_disconnect_by_func (GtkObject	       *object,
-- 					   GtkSignalFunc	func,
-- 					   gpointer		data);

	gtk_signal_disconnect_by_data (object, data: POINTER) is
		-- object is a GtkObject*
		-- data is a gpointer
		external "C"
		end

	gtk_signal_handler_block (object: POINTER;
					   handler_id: INTEGER) is
		-- object is a GtkObject*
		external "C"
		end

-- void   gtk_signal_handler_block_by_func (GtkObject	       *object,
-- 					   GtkSignalFunc	func,
-- 					   gpointer		data);

	gtk_signal_handler_block_by_data (object, data: POINTER) is
		-- object is a GtkObject*
		-- data is a gpointer
		external "C"
		end

	gtk_signal_handler_unblock (object: POINTER; handler_id: INTEGER) is
		-- object is a GtkObject*
		external "C"
		end

-- void   gtk_signal_handler_unblock_by_func (GtkObject	       *object,
-- 					   GtkSignalFunc	func,
-- 					   gpointer		data);

	gtk_signal_handler_unblock_by_data (object, data: POINTER) is
		-- object is a GtkObject*
		-- data is a gpointer
		external "C"
		end

	gtk_signal_handler_pending (object: POINTER; signal_id: INTEGER
					   may_be_blocked: BOOLEAN): INTEGER is
		-- object is a GtkObject*
		external "C"
		end

-- guint  gtk_signal_handler_pending_by_func (GtkObject	       *object,
-- 					   guint		signal_id,
-- 					   gboolean		may_be_blocked,
-- 					   GtkSignalFunc	func,
-- 					   gpointer		data);

	gtk_signal_handler_pending_by_id (object: POINTER; handler_id: INTEGER;
					   may_be_blocked: BOOLEAN): INTEGER is
		-- object is a GtkObject*
		external "C"
		end


-- guint  gtk_signal_add_emission_hook (guint		signal_id,
-- 					   GtkEmissionHook	hook_func,
-- 					   gpointer       	data);
-- guint  gtk_signal_add_emission_hook_full (guint		signal_id,
-- 					   GtkEmissionHook	hook_func,
-- 					   gpointer       	data,
-- 					   GDestroyNotify	destroy);

	gtk_signal_remove_emission_hook (signal_id, hook_id: INTEGER) is
		external "C"
		end


	-- Report internal information about a signal. The caller has the
	-- responsibility to invoke a subsequent g_free (returned_data); but
	-- must not modify data pointed to by the members of GtkSignalQuery 
	gtk_signal_query (signal_id: INTEGER): POINTER is
		-- returns a GtkSignalQuery* 
		external "C"
		end



feature {NONE}  -- GTK+ calls -  Widget-level methods

	gtk_signal_init is
		external "C"
		end

-- guint  gtk_signal_new (const gchar	       *name,
-- 					   GtkSignalRunType	signal_flags,
-- 					   GtkType		object_type,
-- 					   guint		function_offset,
-- 					   GtkSignalMarshaller	marshaller,
-- 					   GtkType		return_val,
-- 					   guint		nparams,
-- 					   ...);

--	gtk_signal_newv (const gchar	       *name,
--					   GtkSignalRunType	signal_flags,
--					   GtkType		object_type,
--					   guint		function_offset,
--					   GtkSignalMarshaller	marshaller,
--					   GtkType		return_val,
--					   guint		nparams,
--					   GtkType	       *params): INTEGER is

-- void   gtk_signal_emit (GtkObject	       *object,
-- 					   guint		signal_id,
-- 					   ...);
-- void   gtk_signal_emit_by_name (GtkObject	       *object,
-- 					   const gchar	       *name,
-- 					   ...);

	gtk_signal_emitv (object: POINTER; signal_id: INTEGER;
					   params: POINTER) is
		-- object is a GtkObject*
		-- params is a GtkArg*
		external "C"
		end

	gtk_signal_emitv_by_name (object, name, params: POINTER) is
		-- object is a GtkObject*
		-- name is a const gchar*
		-- params is a GtkArg*
		external "C"
		end

feature {NONE}  -- GTK+ non-public method  -- should we be using it?
	
	gtk_signal_handlers_destroy (widget: POINTER) is
		external "C"
		end

end  -- GTK_SIGNAL_EXTERNALS
