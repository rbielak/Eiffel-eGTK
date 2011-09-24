-- Copyright (C) 2000  Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GDK_INPUT_FUNCTION - functions that will be called %
                 %if an I/O event occurs on some file descriptor (SE)"
	author: "Richie Bielak"
	version: "v 0.3.5 GTK+ 1.2.x"

class GDK_INPUT_FUNCTION

inherit

	EGTK_NON_PORTABLE

feature

	source_fd: INTEGER
			-- file descriptor watched for input

	set_source_fd (fd: INTEGER) is
			-- set the file descriptor to watch
		require
			fd_valid: fd >= 0
		do
			source_fd := fd
		end

	input_add (input_condition: INTEGER; destroy_callback: BOOLEAN) is
			-- define input function
		require
			valid_fd: source_fd >=  0
		do
			if not destroy_callback then
				input_function_id := gdk_npc.c_gdk_input_add (source_fd, 
															  input_condition,
															  Current)
			else
				input_function_id := gdk_npc.c_gdk_input_add_full (source_fd, 
																   input_condition,
																   Current)
			end
		ensure
			defined: input_function_id /= 0
		end

	input_function_id: INTEGER
			-- id assigned by GDK to this input function

	remove_input is
		require
			input_function_id_valid: input_function_id /= 0
		do
			gdk_input_remove (input_function_id)
			input_function_id := 0
		end

feature

	execute (input_condition: INTEGER) is
			-- called when file descriptor is ready for I/O, redefine 
			-- in descendant
			-- *****
			-- SE Note: This function should really be deferred, but 
			-- because it is mentioned in cecil.se SE issues warnings 
			-- if the system you are compiling has no descendants, so 
			-- I just made it an empty routine.
			-- *****
		do
		end

	notify_of_fd_destruction is
			-- redefine in descendant as needed
		do
		end

	
feature {NONE}

	gdk_input_remove (id: INTEGER) is
		external "C"
		end

end
