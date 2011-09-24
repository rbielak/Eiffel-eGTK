-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_OBJECT"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_object_externals.e,v 1.7 2000/07/10 02:01:28 richieb Exp $"

class GTK_OBJECT_EXTERNALS

feature  -- GtkArgFlags constants

	Gtk_arg_readable: INTEGER 		is  1	--  1 << 0
	Gtk_arg_writable: INTEGER 		is  2	--  1 << 1
	Gtk_arg_construct: INTEGER 		is  4	--  1 << 2
	Gtk_arg_construct_only: INTEGER 	is  8	--  1 << 3
	Gtk_arg_child_arg: INTEGER 		is 16	--  1 << 4

	Gtk_arg_mask: INTEGER 			is 31	--  0x1f
	Gtk_arg_readwrite: INTEGER 		is  3
		--  Gtk_arg_readable | Gtk_arg_writable

feature {NONE} -- code in the glue library

	c_gtk_object_get_flags (object: POINTER): INTEGER is
		external "C"
		end

	c_gtk_type_name (wp: POINTER): POINTER is
		external "C"
	    end

	c_gtk_object_type (wp: POINTER): INTEGER is
		external "C"
		end

	c_gtk_is_object (wp: POINTER): INTEGER is
		external "C"
		end

   c_gtk_object_ref_count (wp: POINTER): INTEGER is
       external "C"
       end

feature {NONE}  -- Application-level methods */

-- Append a user defined signal without default handler to a class. */
-- guint	gtk_object_class_user_signal_new (GtkObjectClass     *klass,
--			   const gchar	      *name,
--			   GtkSignalRunType    signal_flags,
--			   GtkSignalMarshaller marshaller,
--			   GtkType	       return_val,
--			   guint	       nparams,
--			   ...);

-- guint	gtk_object_class_user_signal_newv (GtkObjectClass     *klass,
-- 					   const gchar	      *name,
-- 					   GtkSignalRunType    signal_flags,
-- 					   GtkSignalMarshaller marshaller,
-- 					   GtkType	       return_val,
-- 					   guint	       nparams,
-- 					   GtkType	      *params);

-- GtkObject*	gtk_object_new (GtkType	       type,
-- 					   const gchar	      *first_arg_name,
-- 					   ...);

	gtk_object_newv (object_type, n_args: INTEGER;
				args: POINTER): POINTER is
		-- object type is a GtkType constant
		-- n_args is a guint
		-- args is a GtkArg*
		external "C"
		end

	gtk_object_default_construct (object: POINTER) is
		external "C"
		end

	gtk_object_constructed (object: POINTER) is
		external "C"
		end

	gtk_object_sink (object: POINTER) is
		external "C"
		end

	gtk_object_ref (object: POINTER) is
		external "C"
		end

	gtk_object_unref (object: POINTER) is
		external "C"
		end

-- void gtk_object_weakref (GtkObject	    *object,
-- 			   GtkDestroyNotify  notify,
-- 			   gpointer	     data);

-- void gtk_object_weakunref (GtkObject	    *object,
-- 			   GtkDestroyNotify  notify,
-- 			   gpointer	     data);

	gtk_object_destroy (GtkObject: POINTER) is
		external "C"
		end

	-- gtk_object_getv () sets an arguments type and value, or just
	-- its type to GTK_TYPE_INVALID. if
	-- GTK_FUNDAMENTAL_TYPE (arg->type) == GTK_TYPE_STRING, it's
	-- the caller's responsibility to do a g_free (GTK_VALUE_STRING (arg));
	gtk_object_getv (object: POINTER;
				 n_args: INTEGER;
				 args: POINTER) is
		-- n_args is a guint
		-- args is a GtkArg*
		external "C"
		end

	-- gtk_object_get () sets the variable values pointed to by the
	-- adresses passed after the argument names according to the
	-- arguments value. if GTK_FUNDAMENTAL_TYPE (arg->type) ==
	-- GTK_TYPE_STRING, it's the caller's responsibility to do a
	-- g_free (retrived_value);
-- void	gtk_object_get (GtkObject	*object,
-- 				 const gchar	*first_arg_name,
-- 				 ...);

	-- gtk_object_set () takes a variable argument list of the form:
	-- (..., gchar *arg_name, ARG_VALUES, [repeatedly
	-- name/value pairs,] NULL) where ARG_VALUES type depend on the
	-- argument and can consist of more than one c-function argument.
-- void	gtk_object_set (GtkObject	*object,
-- 				 const gchar	*first_arg_name,
-- 				 ...);

	gtk_object_setv (object: POINTER;
				 n_args: INTEGER;
				 args: POINTER) is
		-- n_args is a guint
		-- args is a GtkArg*
		external "C"
		end

	-- Allocate a GtkArg array of size nargs that hold the names and
	-- types of the args that can be used with
	-- gtk_object_set/gtk_object_get.  If (arg_flags!=NULL), (*arg_flags)
	-- will be set to point to a newly allocated * guint array that
	-- holds the flags of the args. It is the caller's responsibility
	-- to do a g_free (returned_args); g_free (*arg_flags).
	gtk_object_query_args (class_type: INTEGER;
				 arg_flags,
				 n_args: POINTER): POINTER is
		-- class_type is a GtkType constant
		-- arg_flags is a guint32**
		-- n_args is a guint*
		-- returns a GtkArg*
		external "C"
		end

	-- Set 'data' to the "object_data" field of the object. The data is
	-- indexed by the "key". If there is already data associated with
	-- "key" then the new data will replace it.  If 'data' is NULL then
	-- this call is equivalent to 'gtk_object_remove_data'.  The
	-- gtk_object_set_data_full variant acts just the same, but takes
	-- an additional argument which is a function to be called when
	-- the data is removed.  `gtk_object_remove_data' is equivalent to
	-- the above, where 'data' is NULL `gtk_object_get_data' gets the
	-- data associated with "key".
	gtk_object_set_data (object, key, data: POINTER) is
		-- key is a const gchar*
		-- data is a gpointer
		external "C"
		end

-- void	 gtk_object_set_data_full (GtkObject	     *object,
-- 				      const gchar    *key,
-- 				      gpointer	      data,
-- 				      GtkDestroyNotify destroy);

	gtk_object_remove_data (object, key: POINTER) is
		-- key is a const gchar*
		external "C"
		end

	gtk_object_get_data (object, key: POINTER): POINTER is
		-- key is a const gchar*
		-- returns a gpointer 
		external "C"
		end

	gtk_object_remove_no_notify (object, key: POINTER) is
		-- key is a const gchar*
		external "C"
		end

	-- Set/get the "user_data" object data field of "object". It should
	-- be noted that these functions are no different than calling
	-- `gtk_object_set_data'/`gtk_object_get_data' with a key of
	-- "user_data".  They are merely provided as a convenience.
	gtk_object_set_user_data (object, data: POINTER) is
		-- data is a gpointer
		external "C"
		end

	gtk_object_get_user_data (object: POINTER): POINTER is
		-- returns a gpointer 
		external "C"
		end


feature {NONE}  -- Object-level methods */

	-- Append "signals" to those already defined in "class".
	gtk_object_class_add_signals (klass, signals: POINTER;
					 nsignals: INTEGER) is
		-- signals is a guint*
		external "C"
		end

	-- the `arg_name' argument needs to be a const static string 
	gtk_object_add_arg_type (arg_name: POINTER;
				 arg_type, arg_flags, arg_id: INTEGER) is
		-- arg_name is a const gchar*
		-- arg_type is a GtkType constant
		external "C"
		end

feature {NONE} -- Object data method variants that operate on key ids.
		-- NB: GQuark is a guint32

	gtk_object_set_data_by_id (object: POINTER; data_id: INTEGER;
					 data: POINTER) is
		-- data_id is a GQuark
		-- data_id is a GQuark
		-- data is a gpointer
		external "C"
		end

-- void gtk_object_set_data_by_id_full (GtkObject	 *object,
-- 					 GQuark		  data_id,
-- 					 gpointer	  data,
-- 					 GtkDestroyNotify destroy);

	gtk_object_get_data_by_id (object: POINTER;
							   data_id: INTEGER): POINTER is
		-- data_id is a GQuark
		-- returns a gpointer
		external "C"
		end

	gtk_object_remove_data_by_id (object: POINTER;
					 data_id: INTEGER) is
		-- data_id is a GQuark
		external "C"
		end

	gtk_object_remove_no_notify_by_id (object: POINTER;
					 key_id: INTEGER) is
		-- data_id is a GQuark
		external "C"
		end

end  -- GTK_OBJECT_EXTERNALS
