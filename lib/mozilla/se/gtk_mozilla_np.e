indexing

	description:	""
	version: "v 0.3.5 GTK+ 1.2.x"
	
	author:		"Andreas Leitner"
	date:		"Jannuary 2000"

class GTK_MOZILLA_NP
   
inherit
   GTK_MOZILLA_EXTERNALS
   
feature {NONE}

   np_gtk_mozilla_load_url (moz: POINTER; url: STRING) is
      do
	 gtk_mozilla_load_url (moz, url.to_external)
      end
   
   np_gtk_mozilla_stream_start (moz: POINTER; base_url, action, content_type: STRING) is
      do
	 gtk_mozilla_stream_start (moz, base_url.to_external, action.to_external, content_type.to_external)
      end
   
   np_gtk_mozilla_stream_start_html (moz: POINTER; base_url: STRING) is
      do
	 gtk_mozilla_stream_start_html (moz, base_url.to_external)
      end
   
   np_gtk_mozilla_stream_write (moz: POINTER; data: STRING; offset, len: INTEGER) is
      do
	 gtk_mozilla_stream_write (moz, data.to_external, offset, len)
      end
   np_gtk_mozilla_stream_end (moz: POINTER) is
      do
	 gtk_mozilla_stream_end (moz)
      end
   
   
end  -- GTK_MOZILLA_NP
