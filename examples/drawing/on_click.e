deferred class ON_CLICK

inherit

	GTK_COMMAND

feature

	area: GTK_DRAWING_AREA

	make (an_area: like area) is
		require
			an_area_not_void: an_area /= Void
		do
			area := an_area
		end

end
