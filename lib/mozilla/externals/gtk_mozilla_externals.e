-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_MOZILLA"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Andreas Leitner"
	date:		"June 1999"

class GTK_MOZILLA_EXTERNALS
   
   inherit

feature {NONE}
			
   gtk_mozilla_new: POINTER is
      external "C"
      end
		
   gtk_mozilla_load_url (moz, url: POINTER) is
	 -- moz is a GtkMozilla *
	 -- url is a const char *
      external "C"
      end
   
   gtk_mozilla_stop (moz: POINTER) is
      external "C"
      end
   
   gtk_mozilla_reload (moz: POINTER; reload_type: INTEGER) is
	 -- reload type is a GtkMozillaReloadType
      external "C"
      end
   
   gtk_mozilla_resize (moz: POINTER; a_width, a_height: INTEGER) is
      external "C"
      end
   
   gtk_mozilla_back (moz: POINTER) is
      external "C"
      end
   
   gtk_mozilla_forward (moz: POINTER) is
      external "C"
      end
   
   gtk_mozilla_can_back (moz: POINTER): INTEGER is
      external "C"
      end
   
   gtk_mozilla_can_forward (moz: POINTER): INTEGER is
      external "C"
      end
   
   gtk_mozilla_goto_history (moz: POINTER; index: INTEGER) is
      external "C"
      end
   
   gtk_mozilla_get_history_length (moz: POINTER): INTEGER is
      external "C"
      end
   
   gtk_mozilla_get_history_index (moz: POINTER): INTEGER is
      external "C"
      end
   
   gtk_mozilla_stream_start (moz: POINTER; base_url, action, content_type: POINTER) is
	 -- everything except moz is a const char *
      external "C"
      end
   
   gtk_mozilla_stream_start_html (moz: POINTER; base_url: POINTER) is
	 -- everything except moz is a const char *
      external "C"
      end
   
   gtk_mozilla_stream_write (moz: POINTER; data: POINTER; offset, len: INTEGER) is
	 -- data is a const char *
      external "C"
      end
   
   gtk_mozilla_stream_end (moz: POINTER) is
      external "C"
      end
   
   
end  -- GTK_MOZILLA_EXTERNALS
