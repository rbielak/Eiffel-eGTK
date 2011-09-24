-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Parent class for all GTK_COMMANDs. These classes %
                 %are used to process all callbacks"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"
	cvs: "$Id: gtk_command_type.e,v 1.9 2002/02/26 15:58:42 elphick Exp $"

deferred class GTK_COMMAND_TYPE

inherit

	EGTK_NON_PORTABLE

	GTK_SIGNAL_EXTERNALS

feature {GTK_OBJECT}

	entry_from_gtk (argc: INTEGER; argp: POINTER) is
			-- this routine is called from the C code when signals or 
			-- events occur
		do
		        -- retrieve any arguments passed to this callback
			debug
				print("entry_from_gtk: argc = " + argc.out + "; argp = " + argp.out + "%N")
			end
			if (argc /= 0) and not skip_arguments then
				debug
					print ("Fetching callback arguments...%N")
				end
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

--	set_parent (p: GTK_OBJECT) is
--		do
--			parent := p
--		end

	connect (new_event: STRING; new_parent: like parent) is
			-- connect command to a widget event
		require
			event_valid: new_event /= Void
			parent_valid: new_parent /= Void
		do
			event_name := new_event
			parent := new_parent
			gtk_command_id := npc.c_gtk_signal_connect (parent.gtk_object,
													event_name.to_external,
													Current)
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

	execute is
			-- handle callback
		deferred
		end

feature {NONE}

	gtk_command_id: INTEGER
			-- ID of this handler

feature {NONE} -- fetch callback arguments

	fetch_pointer (data: POINTER; arg_no: INTEGER): POINTER is
		external "C"
		alias "c_fetch_pointer"
		end

	fetch_integer (data: POINTER; arg_no: INTEGER): INTEGER is
		external "C"
		alias "c_fetch_integer"
		end

	set_return_value_boolean (argp: POINTER; retv: BOOLEAN) is
		external "C"
		alias "c_set_return_value_bool"
		end

end -- GTK_COMMAND_TYPE
