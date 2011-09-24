class ON_CONFIGURE_EVENT

inherit

	GDK_EVENT_COMMAND
		redefine
			parent
		end

feature

	parent: GTK_DRAWING_AREA

	execute is
		local
			drawable: GDK_WINDOW
			w, h: INTEGER
			c_event: GDK_EVENT_CONFIGURE
		do
			print ("configure_event%N")
			c_event ?= event
			w := c_event.width
			h := c_event.height
		end

end
