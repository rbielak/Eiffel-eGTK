
-- Copyright (C) 1999 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "gtk_object - top class of GTK hierarchy"
	author: "Richie Bielak"
	version: "v 0.3.5 GTK+ 1.2.x"
	cvs: "$Id: gtk_object.e,v 1.16 2003/01/11 19:32:51 elphick Exp $"

class GTK_OBJECT

-- Top level of GTK hierarchy; handles actions
--
-- Signals (from gtkobject.c):
--    "destroy"

inherit
	
	GTK_OBJECT_EXTERNALS
		undefine
			copy, is_equal
		end

	GTK_SIGNAL_EXTERNALS
		undefine
			copy, is_equal
		end

	EGTK_NON_PORTABLE
		undefine
			copy, is_equal
		end

	EGTK_SHARED_WIDGET_FACTORY
		undefine
			copy, is_equal
		end

	GTK_IDENTIFIED
		redefine
			dispose
		end

creation

	make_from_pointer

feature 

	gtk_object: POINTER
			-- pointer to the GTK+ structure

	make_from_pointer (p: POINTER) is
			-- make the eiffel object from a pointer to an existing 
			-- Gtk structure
		require
			valid_pointer: p /= default_pointer
		do
			gtk_object := p
			ref
		end

feature -- callbacks

	add_action, signal_connect (signal_name: STRING; cmd: GTK_COMMAND_TYPE) is
			-- add a command object to handle a specific signal
		require
			signal_name_not_void: signal_name /= Void
			cmd_not_void: cmd /= Void
			cmd_not_connected: cmd.parent = Void
		do
			if actions = Void then
				create actions.make (1, 0)
			end
			-- keep track of cmd objects
			actions.force (cmd, actions.count + 1)
			-- call C function to connect the signal handler
			cmd.connect (signal_name, Current)
		ensure
			cmd_connected: cmd.parent = Current
		end

	action_by_name (signal_name: STRING): GTK_COMMAND_TYPE is
			-- return the command object by signal name
		require
			signal_name_not_void: signal_name /= Void
		local
			cmd: GTK_COMMAND_TYPE
			i: INTEGER
		do
			from i := 1
			until (i > actions.count) or (Result /= Void)
			loop
				cmd := actions.item (i)
				if cmd /= Void and then 
					signal_name.is_equal (cmd.event_name)
				 then
					Result := cmd
				end
				i := i + 1
			end
		end
	
	remove_action (old_cmd: GTK_COMMAND_TYPE) is
			-- remove callback
		require
			old_cmd_not_void: old_cmd /= Void
		local
			i: INTEGER
			cmd: GTK_COMMAND_TYPE
		do
			from i := 1
			until i > actions.count
			loop
				cmd := actions.item (i)
				if cmd = old_cmd then
					cmd.disconnect
					actions.put (Void, i)
				end
				i := i + 1
			end
		end

	remove_all_signal_handlers is
			-- remove all action handlers 
		do
			gtk_signal_handlers_destroy (gtk_object)
			actions := Void
		end
	
feature -- query

	flags: INTEGER is
			-- flags returns the sum of all flags set for this
			-- object: see GTK_CONSTANTS under Widget flags
		do
			Result := c_gtk_object_get_flags (gtk_object)
		end

	type_name: STRING is
			-- name of type
		do
			Result :=  npc.np_string_from_pointer (c_gtk_type_name (gtk_object))
		end

	valid_object: BOOLEAN is
			-- true if we represent a valid GTK object
		do
			Result := c_gtk_is_object (gtk_object) /= 0
		end


feature {NONE}

	actions: ARRAY [GTK_COMMAND_TYPE]
			-- keep references to 

	register_widget is
			-- memory management
		do
			widget_factory.add_widget (gtk_object, gtk_object_id)
			ref
		end

	unregister_widget is
			-- unregister the widget
		require
			valid_object: gtk_object /= default_pointer
		do
			unref
			widget_factory.remove_pointer (gtk_object)
			gtk_object := default_pointer
		end

	saved_type: STRING

feature -- memory management

	sink is
		do
			gtk_object_sink (gtk_object)
		end

	ref is
		do
			gtk_object_ref (gtk_object)
			saved_type := clone(type_name)
		end

	unref is
		do
			gtk_object_unref (gtk_object)
		end

	dispose is
		do
			if saved_type /= Void then
				precursor
				if gtk_object /= default_pointer and then
					c_gtk_is_object (gtk_object) > 0 and then
					c_gtk_object_ref_count (gtk_object) > 0 
				 then
					unref
					gtk_object := default_pointer
				end
			else
			   debug
				   print("GTK_OBJECT.dispose - saved_type = Void%Ngenerator = ")
				   print(generator)
				   print("%N")
		   	end
			end
		end

invariant

--	gtk_object_not_void: gtk_object /= default_pointer

end -- GTK_OBJECT
