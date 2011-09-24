class ON_BUTTON_PRESS_COMMAND

inherit

	GTK_COMMAND_TYPE
		redefine
			parent
		end

creation

	make

feature

	parent: GTK_BUTTON

	pix1, pix2: GDK_PIXMAP

	first: BOOLEAN

	make (p1, p2: GDK_PIXMAP) is
		require
			p1_not_void: p1 /= Void
			p2_not_void: p2 /= Void
		do
			first := False
			pix1 := p1
			pix2 := p2
		end

	execute is
			-- this routine is called on button press, switch the 
			-- pixmaps
		local
			pic: GTK_PIXMAP
		do
			if first then
				-- first pixmap
				!!pic.make (pix1, default_pointer)
			else
				-- second pixmap
				!!pic.make (pix2, default_pointer)
			end
			pic.show
			parent.set_pixmap (pic)
			first := not first
		end

end
