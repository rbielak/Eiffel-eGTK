class CALLBACK

inherit

	GTK_COMMAND
 		redefine
 			fetch_callback_arguments
 		end

feature

	fetch_callback_arguments (argc: INTEGER; argp: POINTER) is
		local
			eventp: POINTER
			i : INTEGER
		do
			print("fetch_callback_arguments: ")
			from 
				i:=0
			until 
				i>=argc
			loop
				eventp := fetch_pointer (argp, i)
				print(eventp)
				i := i + 1
			end
			print("%N")
		end

	execute is
		do
			print (event_name)
			print ("%N")
		end

end
