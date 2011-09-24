-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description:	""
	version: "v 0.3.5 GTK+ 1.2.x"
	
	author:		"Andreas Leitner"
	date:		"June 1999"

class GTK_MOZ_EMBED_NP
   
inherit
   GTK_MOZ_EMBED_EXTERNALS
   
feature {NONE}

   np_gtk_moz_embed_load_url (moz: POINTER; url: STRING) is
      do
	 gtk_moz_embed_load_url (moz,$(url.to_c))
      end
   
--     np_gtk_moz_embed_stream_start (moz: POINTER; base_url, action, content_type: STRING) is
--        do
--  	 gtk_moz_embed_stream_start (moz, $(base_url.to_c), $(action.to_c), $(content_type.to_c))
--        end
   
--     np_gtk_moz_embed_stream_start_html (moz: POINTER; base_url: STRING) is
--        do
--  	 gtk_moz_embed_stream_start_html (moz, $(base_url.to_c))
--        end
   
--     np_gtk_moz_embed_stream_write (moz: POINTER; data: STRING; offset, len: INTEGER) is
--        do
--  	 gtk_moz_embed_stream_write (moz, $(data.to_c), offset, len)
--        end
   
   
   
end  -- GTK_MOZ_EMBED_EXTERNALS
