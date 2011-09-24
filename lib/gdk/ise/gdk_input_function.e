-- Copyright (C) 2000  Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "GDK_INPUT_FUNCTION - functions that will be called %
                 %if an I/O event occurs on some file descriptor"
	author: "Richie Bielak"
	version: "v 0.3.5 GTK+ 1.2.x"

class GDK_INPUT_FUNCTION

inherit

	MEMORY
		redefine
			dispose
		end

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
			valid_fd: source_fd >= 0
		do
			if not destroy_callback then
				input_function_id := gdk_npc.c_gdk_input_add (source_fd, 
															  input_condition,
															  Current,
															  $execute,
															  $call_block_pointer)
			else
				input_function_id := gdk_npc.c_gdk_input_add_full (source_fd, 
																   input_condition,
																   Current,
																   $execute,
																   $notify_of_fd_destruction,
																   $call_block_pointer)


			end
		ensure
			defined: input_function_id >= 0
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
			-- called when file descriptor is ready for I/O
			-- redefine in descendant
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

feature {NONE} -- ISE implementation


	call_block_pointer: POINTER
			-- callback block for input function

	destroy_call_block_pointer: POINTER
			-- callback block for notify destroy function

	dispose is
		do
			if call_block_pointer /= default_pointer then
				c_free_call_back_block (call_block_pointer)
			end
			if destroy_call_block_pointer /= default_pointer then
				c_free_call_back_block (destroy_call_block_pointer)
			end
		end

	c_free_call_back_block (p: POINTER) is
			-- called from dispose
		external "C"
		end

end
