-- Copyright (C) 1999 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GFK_EVENT_COMMAND - handle GDK events"
	version: "v 0.3.5 GTK+ 1.2.x"
	author: "Richie Bielak"
	cvs: "$Id: gdk_event_command.e,v 1.5 2003/01/11 19:32:51 elphick Exp $"

deferred class GDK_EVENT_COMMAND

inherit

	GTK_COMMAND_TYPE
		redefine
			fetch_callback_arguments,
			entry_from_gtk
		end

feature

	execute is
		deferred
		end

	last_event_handled: BOOLEAN
			-- set to True in "execute", if the event was handled here
	
feature -- data from callback

	event: GDK_EVENT
			-- information about the event

	fetch_callback_arguments (argc: INTEGER; argp: POINTER) is
		local
			eventp: POINTER
		do
			-- first argument is the pointer to GDK event
			eventp := fetch_pointer (argp, 0)
			event := event_factory.make_event (eventp) 
		end

feature {GTK_OBJECT}

	entry_from_gtk (argc: INTEGER; argp: POINTER) is
		do
			precursor (argc, argp)
			-- set return value
			set_return_value_boolean (argp, last_event_handled)
		end

feature {NONE}

	event_factory: GDK_EVENT_FACTORY is
		once
			create Result
		end

end -- GDK_EVENT_COMMAND
