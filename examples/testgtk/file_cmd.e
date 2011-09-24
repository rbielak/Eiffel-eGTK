class FILE_CMD

inherit

	GTK_COMMAND

creation

	make_as_ok,
	make_as_cancel

feature

	f_selector: GTK_FILE_SELECTION

	make_as_ok (fs: like f_selector) is
		require
			valid_fs: fs /= Void
		do
			f_selector := fs
			cancelled := False
		end

	make_as_cancel (fs: like f_selector) is
		require
			valid_fs: fs /= Void
		do
			f_selector := fs
			cancelled := True
		end

	cancelled: BOOLEAN

	execute is
		local
			fname: STRING
		do
			if not cancelled then
				fname := f_selector.get_file_name
				print ("File selected: ")
				print (fname)
				print ("%N")
			end
			f_selector.destroy
		end

end
