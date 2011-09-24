class GTK_PREVIEW_INFO

creation

	make

feature

	make(info: POINTER) is
		do
			preview_info := info
		end

	preview_info: POINTER

end
