class ON_EXPOSE_EVENT 

inherit
	
	GDK_EVENT_COMMAND
		redefine
			parent
		end

feature

	parent: GTK_DRAWING_AREA

	execute is
		local
			eevent: GDK_EVENT_EXPOSE
			exposed: GDK_RECTANGLE
			drawable: GDK_WINDOW
		do
			print ("expose event%N")
			eevent ?= event
			exposed := eevent.area
			drawable := parent.window
			drawable.draw_rectangle (parent.style.white_gc,
									 True, exposed.x, exposed.y,
									 exposed.width, exposed.height)
		end

end
