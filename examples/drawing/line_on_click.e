class LINE_ON_CLICK

inherit

	ON_CLICK

creation

	make

feature

	bx, by: INTEGER

	execute is
		local
			drawable: GDK_WINDOW
			h, w: INTEGER
		do
			print ("line_on_click %N")
			drawable := area.window
			h := area.height
			w := area.width
			bx := (bx + 5) \\ w
			by := (by + 7) \\ h
			-- draw a line
			drawable.draw_line (area.style.black_gc, 1, 1, bx, by)
		end

end
