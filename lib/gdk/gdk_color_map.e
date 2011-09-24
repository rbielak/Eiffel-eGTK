class GDK_COLOR_MAP

creation

	make

feature

	make(map: POINTER) is
		do
			color_map := map
		end

	color_map: POINTER

end
