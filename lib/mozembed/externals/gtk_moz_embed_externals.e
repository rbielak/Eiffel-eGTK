-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	"External C calls for GTK_MOZEMBED"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Andreas Leitner"
	date:		"June 1999"

class GTK_MOZ_EMBED_EXTERNALS
   
   inherit

feature {NONE}
			
   gtk_moz_embed_new: POINTER is
      external "C"
      end
		
   gtk_moz_embed_load_url (moz, url: POINTER) is
	 -- moz is a GtkMoz_Embed *
	 -- url is a const char *
      external "C"
      end
   
   gtk_moz_embed_stop (moz: POINTER) is
      external "C"
      end
   
   gtk_moz_embed_reload (moz: POINTER; reload_type: INTEGER) is
	 -- reload type is a GtkMoz_EmbedReloadType
      external "C"
      end
   
   gtk_moz_embed_resize (moz: POINTER; a_width, a_height: INTEGER) is
      external "C"
      end
   
   gtk_moz_embed_go_back (moz: POINTER) is
      external "C"
      end
   
   gtk_moz_embed_go_forward (moz: POINTER) is
      external "C"
      end
   
   gtk_moz_embed_can_go_back (moz: POINTER): INTEGER is
      external "C"
      end
   
   gtk_moz_embed_can_go_forward (moz: POINTER): INTEGER is
      external "C"
      end
   
--     gtk_moz_embed_goto_history (moz: POINTER; index: INTEGER) is
--        external "C"
--        end
   
--     gtk_moz_embed_get_history_length (moz: POINTER): INTEGER is
--        external "C"
--        end
   
--     gtk_moz_embed_get_history_index (moz: POINTER): INTEGER is
--        external "C"
--        end
   
--     gtk_moz_embed_stream_start (moz: POINTER; base_url, action, content_type: POINTER) is
--  	 -- everything except moz is a const char *
--        external "C"
--        end
   
--     gtk_moz_embed_stream_start_html (moz: POINTER; base_url: POINTER) is
--  	 -- everything except moz is a const char *
--        external "C"
--        end
   
--     gtk_moz_embed_stream_write (moz: POINTER; data: POINTER; offset, len: INTEGER) is
--  	 -- data is a const char *
--        external "C"
--        end
   
--     gtk_moz_embed_stream_end (moz: POINTER) is
--        external "C"
--        end
   
   
end  -- GTK_MOZ_EMBED_EXTERNALS




