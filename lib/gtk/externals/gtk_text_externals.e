-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_TEXT"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_text_externals.e,v 1.3 2000/07/10 02:01:28 richieb Exp $"

class GTK_TEXT_EXTERNALS


feature {NONE}
			
	gtk_text_new (h, v: POINTER): POINTER is
		external "C"
		end
	
	gtk_text_set_editable (w: POINTER; f: BOOLEAN) is
		external "C"
		end

	gtk_text_set_word_wrap (w: POINTER; f: INTEGER) is
		external "C"
		end
	
	gtk_text_set_line_wrap (w: POINTER; f: INTEGER) is
		external "C"
		end
	
	gtk_text_set_adjustments(w, h, v: POINTER) is
		external "C"
		end
	
	gtk_text_set_point (w: POINTER; p: INTEGER) is
		external "C"
		end

	gtk_text_get_point (w: POINTER): INTEGER is
		external "C"
		end

	gtk_text_get_length (w: POINTER): INTEGER is
		external "C"
		end

	gtk_text_freeze (w: POINTER) is
		external "C"
		end

	gtk_text_thaw (w: POINTER) is
		external "C"
		end

	gtk_text_insert (text, font, fore, back, chars: POINTER;
				     length: INTEGER) is
		-- text is a GtkText*
		-- font is a GdkFont*
		-- fore, back are GdkColor*
		-- chars is const char*
		external "C"
		end

	gtk_text_forward_delete (w: POINTER; c: INTEGER) is
		external "C"
		end

	gtk_text_backward_delete (w: POINTER; c: INTEGER) is
		external "C"
		end

feature {GTK_TEXT}

	c_gtk_text_hadj (w: POINTER): POINTER is
			-- get the horizontal adjustment belonging to w
		external "C"
		end

	c_gtk_text_vadj (w: POINTER): POINTER is
			-- get the vertical adjustment belonging to w
		external "C"
		end

end  -- GTK_TEXT_EXTERNALS
