class ON_EVENT_ACTIVATE

inherit

	GDK_EVENT_COMMAND

creation

	make

feature

	make (sn: STRING) is
		do
			signal_name := clone (sn)
		end

	signal_name: STRING

	execute is
		do
			print ("Event: ")
			print (event.generator)
			print (" occured. signal: ")
			print (signal_name)
			print ("%N")
		end

end
