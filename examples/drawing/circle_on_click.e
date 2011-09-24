class CIRCLE_ON_CLICK

inherit

	ON_CLICK
		redefine
			make
		end

creation

	make

feature

	make (a: GTK_DRAWING_AREA) is
		do
			precursor (a)
			x := 10
			y := 10
			dx := 20
			dy := 20
		end

	x, y, dx, dy: INTEGER

	execute is
		local
			drawable: GDK_WINDOW
			h, w: INTEGER
		do
			print ("circle_on_click %N")
			drawable := area.window
			h := area.height
			w := area.width
			if x+dx > w then
				x := 1
			end
			if y + dy > h then
				y := 1
			end
			drawable.draw_arc (area.style.black_gc,
							   False,
							   x, y, x+dx, y+dy,
							   0, 360*64)
			x := x + 3
			y := y + 5
		end
end
