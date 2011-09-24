indexing

	description: "EGTK_EXPORTABLE - mechanisms to enable the export of %
	             %arbitrary data to a gpointer for storage in (for example) %
					 %a GtkCList"
	author: "Oliver Elphick"
	date: "10th may 2000"
	cvs: "$Id: egtk_exportable.e,v 1.9 2003/01/11 19:32:51 elphick Exp $"

class EGTK_EXPORTABLE

	-- Note: garbage collection of this object should leave the memory 
	-- allocated by C untouched.  The c_pointer_to_free function 
	-- should always be passed to the GTK+ object that uses the 
	-- exported data to ensure that the C memory gets freed when the 
	-- object to which it is attached gets deleted.

inherit

	EGTK_NON_PORTABLE

	INCOMPATIBLES

creation

	make, make_from_data, make_from_pointer

feature

	c_object: POINTER

	data: STRING

feature -- Creation

	make is
		do
			create data.make(0)
			c_object := default_pointer
			debug
				io.put_string("EGTK_EXPORTABLE make%N")
				io.put_string("c_object = ")
				io.put_string(c_object.out)
				io.put_new_line
			end
		end

	make_from_data(a: ARRAY[STRING]) is
		require
			good_array: a /= Void and then a.lower = 0
		local
			i: INTEGER
		do
			-- portable creation from an array; the array must not 
			-- contain any void elements, since import stops at the 
			-- first void.
			create data.make (0)
			from
				i := a.lower
			until
				i > a.upper or (a @ i) = Void
			loop
				add_to_data (a @ i)
				i := i + 1
			end
			c_object := default_pointer
			debug
				io.put_string("EGTK_EXPORTABLE make_from_data%N")
				io.put_string("c_object = ")
				io.put_string(c_object.out)
				io.put_new_line
			end
		end

	make_from_pointer(p: POINTER) is
		require
			good_pointer: p /= default_pointer
		do
			c_object := p
			create data.make(0)
			if p /= Void then
				import_data
			end
			debug
				io.put_string("EGTK_EXPORTABLE make_from_pointer%N")
				io.put_string("c_object = ")
				io.put_string(c_object.out)
				io.put_new_line
			end
		end

feature -- helper routines

	pre_export_string(s: STRING) is
		do
			add_to_data(s)
		end

	pre_export_integer(i: INTEGER) is
		do
			add_to_data(i.out)
		end

	pre_export_real(r: REAL) is
		do
			add_to_data(r.out)
		end

	pre_export_double(d: DOUBLE) is
		do
			add_to_data(d.out)
		end

	pre_export_boolean(b: BOOLEAN) is
		local
			i: INTEGER
		do
			if b then
				i := 1
			end
			add_to_data(i.out)
		end

	clear is
		do
			if c_object /= default_pointer then
				free_c_object(c_object)
				c_object := default_pointer
			end
			data.wipe_out
		end

feature -- Access

	count: INTEGER is
		do
			if data.count = 0 then
				Result := 0
			else
				Result := 1 + data.occurrences('%T')
			end
		end

	data_array: ARRAY[STRING] is
		local
			i: INTEGER
		do
			Result := splitstring(data)
			if Result /= Void then
				from
					i := 0
				invariant
					i <= Result.count + 1
				variant
					Result.count - i + 1
				until
					i = Result.count
				loop
					Result.put(reconvert(Result @ i), i)
					i := i + 1			
				end
			else
				create Result.make(0,-1)
			end
		ensure
			consistent_result: Result.count = count
		end

feature -- export and import

	export_data is
		do
			debug
				io.put_string("EGTK_EXPORTABLE export_data%N")
				io.put_string(data)
				io.put_new_line
			end
			c_object := egtk_npc.npc_export_data(data)
			debug
				io.put_string("c_object = ")
				io.put_string(c_object.out)
				io.put_new_line
			end
		end

	import_data is
		do
			debug
				io.put_string("EGTK_EXPORTABLE import_data%N")
				io.put_string("c_object = ")
				io.put_string(c_object.out)
				io.put_new_line
			end
			data := egtk_npc.npc_import_data(c_object)
			debug
				io.put_string(data)
				io.put_new_line
			end
		end

feature {NONE}

	add_to_data(s: STRING) is
		require
			array_made: data /= Void
			good_addition: s /= Void
		local
			a: ARRAY[STRING]
			i: INTEGER
		do
			debug
				io.put_string("add_to_data (%'")
				io.put_string(s)
				io.put_string("%') at index ")
				io.put_integer(count)
				io.put_new_line
			end
			if data.count /= 0 then
				data.extend('%T')
			end
			-- convert any backslashes in the data to \\ and tabs to \t
			if s.index_of('%H',1) <= s.count then
				from
					a := splitstring(s)
					i := 1
					s.wipe_out
				invariant
					i <= a.count+1
				variant
					a.count - i + 1
				until
					i > a.count
				loop
					if s.count /= 0 then
						s.append("%H%H")
					end
					s.append(a @ i)
					i := i + 1
				end
			end
			if s.index_of('%T',1) <= s.count then
			end
			data.append(s)
			debug
				io.put_string(data)
				io.put_new_line
			end
		ensure
			added: old data.count = 0 or else
					 data.occurrences('%T') = old data.occurrences('%T')+1
		end

	reconvert(s: STRING): STRING is
		require
			non_void: s /= Void
		local
			i: INTEGER
		do
			Result := clone(s)
			if string_has_string(s,"%H%H") or string_has_string(s,"%Ht") then
				from
					i := 1
				invariant
					i >= 1 and i <= Result.count
				variant
					Result.count - i + 1
				until
					not (string_has_string(Result,"%H%H") or string_has_string(Result,"%Ht")) or
						i = Result.count
				loop
					if (Result @ i) = '%H' then
						if (Result @ (i + 1)) = '%H' or 
							(Result @ (i + 1)) = 't' then
							Result.remove(i)
						end
					end
				end
			end
		end

feature {NONE} -- string splitting (code adapted from SmallEiffel STRING)

	splitstring(s: STRING): ARRAY[STRING] is
         -- Split the string into an array of strings (dividing on tab)
         -- Gives Void or a non empty array.
      do
         if s.count > 0 then
			 split_buffer.clear_all
			 split_in(split_buffer, s)
			 if split_buffer.count /= 0 then
				 Result := clone (split_buffer)
			 end;
         end;
		ensure
			Result /= Void implies Result.count /= 0
	 end;

	 split_in(words: COLLECTION[STRING]; s: STRING) is
		require
			words /= Void
		local 
			state, i: INTEGER;
			-- state = 0 : waiting next word.
			-- state = 1 : inside a new word.
			c: CHARACTER;
			tmp_string: STRING
		do
			if s.count > 0 then
				from
					i := 1;
					create tmp_string.make(256)
				until
					i > s.count
				loop
					c := s.item(i);
					if state = 0 then
						if c /= '%T' then
							tmp_string.wipe_out;
							tmp_string.extend(c);
							state := 1;
						end;
					else
						if c /= '%T' then
							tmp_string.extend(c);
						else
							extend_string_collection (words, clone (tmp_string))
							state := 0;
						end;
					end;
					i := i + 1;
				end;
				if state = 1 then 
					extend_string_collection (words, clone (tmp_string))
				end;
			end;
		ensure
			-- words.count >= old (words.count)
		end;
	
	split_buffer: ARRAY[STRING] is
		once
--			create Result.with_capacity(4,0);
			create Result.make (0, 4)
		end;

feature {GTK_CTREE, GTK_CLIST}

	free_c_object(p: POINTER) is
		external
			"C"
		end

	c_pointer_to_free: POINTER is
		external
			"C"
		end

end -- EGTK_EXPORTABLE
