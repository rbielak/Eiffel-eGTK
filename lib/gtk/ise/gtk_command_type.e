-- Copyright (C) 1999 RIchie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Parent class for all GTK_COMMANDs. These classes %
                 %are used to process all callbacks"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"
	cvs: "$Id: gtk_command_type.e,v 1.7 2000/07/10 02:01:28 richieb Exp $"

deferred class GTK_COMMAND_TYPE

inherit

	GTK_SIGNAL_EXTERNALS

	EGTK_NON_PORTABLE

	MEMORY
		redefine
			dispose
		end


feature -- this routine gets actually execute during the call back

	execute is
			-- handle callback
		deferred
		end


feature {NONE} -- ISE specific implementation

	call_block_pointer: POINTER
			-- this points to a block of memory needed to hold data 
			-- about the call back. How this data is obtained depends 
			-- of type of callback, so it's implementation is in 
			-- descendant class

	c_free_call_back_block (p: POINTER) is
			-- called from dispose
		external "C"
		end

	dispose is
		do
			c_free_call_back_block (call_block_pointer)
		end


feature {GTK_OBJECT}


	set_parent (p: GTK_OBJECT) is
		do
			parent := p
		end

feature {GTK_OBJECT} -- connect and disconnect callback with a widget

	connect (new_event: STRING; new_parent: like parent) is
			-- connect command to a widget event
		require
			event_not_void: new_event /= Void
			new_parent_not_void: new_parent /= Void
		do
			event_name := new_event
			parent := new_parent
			gtk_command_id := npc.c_gtk_signal_connect (parent.gtk_object,
														$(new_event.to_c),
														$entry_from_gtk, 
														Current,
														$call_block_pointer)
		ensure
			parent /= Void
		end

	disconnect is
			-- remove the command from the widget
		require
			parent_not_void: parent /= Void
		do
			gtk_signal_disconnect (parent.gtk_object, gtk_command_id)
			parent := Void
		end

feature

	parent: GTK_OBJECT
			-- object to which we are connected

	event_name: STRING
			-- name of event we're connected to 


feature {NONE} -- callback entry into Eiffel

	entry_from_gtk (argc: INTEGER; argp: POINTER) is
			-- this routine is called from the C code when signals or 
			-- events occur
		do
			-- retrieve any arguments passed to this callback
			if (argc /= 0) and not skip_arguments then
				fetch_callback_arguments (argc, argp)
			end
			-- process the callback
			execute
		end

	skip_arguments: BOOLEAN
			-- if set to true, the arguments from callback will be 
			-- ignored. Set to False by default
	
	fetch_callback_arguments (argc: INTEGER; argp: POINTER) is
			-- redefine in descendant as needed depending on type of 
			-- callback 
		do
		end

feature {NONE} -- fetch callback arguments

	-- TODO: add routines for fetching other kinds of arguments
	fetch_pointer (data: POINTER; arg_no: INTEGER): POINTER is
		external "C"
		alias "c_fetch_pointer"
		end

	fetch_integer (data: POINTER; arg_no: INTEGER): INTEGER is
		external "C"
		alias "c_fetch_integer"
		end

	-- TODO: Add calls for returning other kinds of values
	set_return_value_boolean (argp: POINTER; retv: BOOLEAN) is
		external "C"
		alias "c_set_return_value_bool"
		end


	set_return_value_integer (argp: POINTER; retv: INTEGER) is
		external "C"
		alias "c_set_return_value_int"
		end

feature {NONE}

	gtk_command_id: INTEGER

end -- GTK_COMMAND_TYPE
