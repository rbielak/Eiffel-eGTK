class RECTANGLE_ON_CLICK

inherit

	ON_CLICK

creation

	make

feature

	width, height: INTEGER

	execute is
		local
			drawable: GDK_WINDOW
			h, w: INTEGER
		do
			print ("rectangle_on_click %N")
			drawable := area.window
			h := area.height
			w := area.width
			width := (width + 5) \\ w
			height := (height + 5) \\ h

			-- draw a rectangle
			drawable.draw_rectangle (area.style.black_gc, False, 2, 2, width, height)
		end

end
