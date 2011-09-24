-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_CONTAINER"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_container_externals.e,v 1.4 2000/07/10 02:01:27 richieb Exp $"

class GTK_CONTAINER_EXTERNALS

feature -- GtkResizeMode constants

	Gtk_resize_parent: INTEGER	is 0
		-- Pass resize request to the parent
	Gtk_resize_queue: INTEGER	is 1
		-- Queue resizes on this widget
	Gtk_resize_immediate: INTEGER	is 2
		-- Perform the resizes now

feature -- GtkDirectionType constants

	Gtk_dir_tab_forward: INTEGER	is 0
	Gtk_dir_tab_backward: INTEGER	is 1
	Gtk_dir_up: INTEGER		is 2
	Gtk_dir_down: INTEGER		is 3
	Gtk_dir_left: INTEGER		is 4
	Gtk_dir_right: INTEGER		is 5

feature {NONE} -- access to fields of container

	c_focus_child (w: POINTER): POINTER is
			-- access to field of GTK_CONTAINER
		external "C"
		end

feature {NONE}

	gtk_container_set_border_width (container: POINTER; width: INTEGER) is
		external "C"
		end

	gtk_container_add (container, widget: POINTER) is
		external "C"
		end

	gtk_container_remove (container, widget: POINTER) is
                external "C"
                end

	gtk_container_set_resize_mode (container: POINTER;
				resize_mode: INTEGER) is
		-- resize_mode is a GtkResizeMode constant
                external "C"
                end

	gtk_container_check_resize (container: POINTER) is
                external "C"
                end

-- Cannot directly implement a function that passes a pointer_to_func
--	gtk_container_foreach (container: POINTER,
--			GtkCallback callback,
--			gpointer callback_data) is
--              external "C"
--              end
--
--	gtk_container_foreach_full (container: POINTER,
--			GtkCallback callback,
--			GtkCallbackMarshal marshal,
--			gpointer callback_data,
--			GtkDestroyNotify notify) is
--              external "C"
--              end

	gtk_container_children (container: POINTER): POINTER is
		-- returns a GtkList*
                external "C"
                end

	gtk_container_focus (container: POINTER; direction: INTEGER): INTEGER is
		-- direction is a GtkDirectionType constant
                external "C"
                end

-- Widget-level methods

	gtk_container_set_focus_child (container, child: POINTER) is
                external "C"
                end

	gtk_container_set_focus_vadjustment (container, adjustment: POINTER) is
                external "C"
                end

	gtk_container_set_focus_hadjustment (container, adjustment: POINTER) is
                external "C"
                end

	gtk_container_register_toplevel (container: POINTER) is
                external "C"
                end

	gtk_container_unregister_toplevel (container: POINTER) is
                external "C"
                end

	gtk_container_get_toplevels: POINTER is
		-- returns a GtkList*
                external "C"
                end

	gtk_container_resize_children (container: POINTER) is
                external "C"
                end

	gtk_container_child_type (container: POINTER): INTEGER is
		-- returns a GtkType constant
                external "C"
                end

	-- the `arg_name' argument needs to be a const static string
	gtk_container_add_child_arg_type (arg_name: POINTER;
				arg_type, arg_flags, arg_id: INTEGER) is
		-- arg_name is a const gchar*
		-- arg_type is a GtkType
                external "C"
                end
     
-- Allocate a GtkArg array of size nargs that holds the
-- names and types of the args that can be used with
-- gtk_container_child_getv/gtk_container_child_setv.
-- if (arg_flags!=NULL),
-- (*arg_flags) will be set to point to a newly allocated
-- guint array that holds the flags of the args.
-- It is the caller's responsibility to do a
-- g_free (returned_args); g_free (*arg_flags).
--
-- GtkArg* gtk_container_query_child_args (class_type: INTEGER;
-- 				guint32 **arg_flags,
-- 				guint *nargs) is
--		-- class_type is a GtkType
--              external "C"
--              end

-- gtk_container_child_getv() sets an argument's type and value, or
-- just its type to GTK_TYPE_INVALID.
-- If GTK_FUNDAMENTAL_TYPE (arg->type) == GTK_TYPE_STRING, it's
-- the caller's responsibility to do a g_free (GTK_VALUE_STRING (arg));
--	gtk_container_child_getv (container, child: POINTER;
--				n_args: INTEGER;
--				args: POINTER) is
--		-- args is a GtkArg*
--              external "C"
--              end

--	gtk_container_child_setv (container, child: POINTER;
--				n_args: INTEGER;
--				args: POINTER) is
--		-- args is a GtkArg*
--              external "C"
--              end

-- We cannot directly implement functions with variable argument lists.
--  gtk_container_add_with_args () takes a variable argument list of the form:
--  (..., gchar *arg_name, ARG_VALUES, [repeatedly name/value pairs,] NULL)
--  where ARG_VALUES type depend on the argument and can consist of
--  more than one c-function argument.
-- 
-- 	gtk_container_add_with_args (container, widget: POINTER,
-- 					    const gchar	      *first_arg_name,
-- 					    ...) is
--               external "C"
--               end
--
-- 	gtk_container_addv (container, widget: POINTER,
-- 					    guint	       n_args,
-- 					    GtkArg	      *args) is
--                external "C"
--                end
--
-- 	gtk_container_child_set (container, child: POINTER,
-- 					    const gchar	      *first_arg_name,
-- 					    ...) is
--                external "C"
--                end
     
end  -- GTK_CONTAINER_EXTERNALS
