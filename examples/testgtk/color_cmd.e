class COLOR_CMD

inherit

	GTK_COMMAND

creation

	make_as_ok,
	make_as_cancel

feature
	
	make_as_ok (cs: like color_selector) is
		require
			cs_not_void: cs /= Void
		do
			cancel := False
			color_selector := cs
		end

	make_as_cancel (cs: like color_selector) is
		require
			cs_not_void: cs /= Void
		do
			cancel := True
			color_selector := cs
		end

	color_selector: GTK_COLOR_SELECTION_DIALOG

	cancel: BOOLEAN

	execute is
		local
			colors: ARRAY [DOUBLE]
		do
			if not cancel then
				print ("OK%N")
				colors := color_selector.last_color_selected
				print ("Selected color: %N")
				print ("--> R: ")
				print (colors @ 0)
				print ("%N")
				print ("--> G: ")
				print (colors @ 1)
				print ("%N")
				print ("--> B: ")
				print (colors @ 2)
				print ("%N")

			else
				print ("Cancelled%N")
			end
			color_selector.destroy
		end

end
