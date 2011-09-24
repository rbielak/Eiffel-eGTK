indexing
	description: ""
	author: "Andreas Leitner"
	license: "GPL"
class
   END_LOAD_URL_CMD
inherit
   GTK_COMMAND
      redefine
	 fetch_callback_arguments
      end
creation
	make
feature -- initialization
   make is
      do
      end
feature {NONE} -- implementation
   execute is
      do
	 print ("end load url: ")
	 print (url)
	 print ("%N")
      end
   
   fetch_callback_arguments (argc: INTEGER; argp: POINTER) is
	 -- redefine in descendant as needed depending on type of 
	 -- callback 
      do
	 -- FIXME: Make compiler independent
	 --	 !! url.from_external_copy (fetch_pointer (argp, 0))
	 --	 url := clone (url)
	 url := clone ("")
      end
   
   url: STRING
end
