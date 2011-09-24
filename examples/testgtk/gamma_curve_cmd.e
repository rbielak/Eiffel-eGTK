class GAMMA_CURVE_CMD

inherit

	GTK_COMMAND

feature

	g_curve: GTK_GAMMA_CURVE

	window: WINDOW_WITH_CLOSE_BUTTON

	execute is
		local
			i, max: INTEGER
			vector: ARRAY [REAL]
		do
			!!vector.make (1, 256)
			!!g_curve.make
			
			from
				i := 1
				max := vector.count
			until i > max
			loop
				vector.put (i - 0.1*i, i)
				i := i + 1
			end
			g_curve.curve.set_range (0, max, 0, max)
			g_curve.curve.set_vector (vector.count, vector)
			!!window.make ("Gamma Curve")
			window.box.add_widget (g_curve)
			window.show_all
			-- should just use a plain window and connect another 
			-- routine to the close/destroy signal to get the values 
			-- of the curve that was displayed
		end

end
