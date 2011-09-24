indexing

	description: "Object IDs for reference objects"

class GTK_IDENTIFIED

inherit 

	MEMORY
		redefine
			dispose, is_equal, copy
		end

feature 
	
	gtk_object_id: INTEGER is
		do
			if internal_object_id = 0 then
				internal_object_id := c_new_id (Current)
			end
			Result := internal_object_id
		ensure
			Current = gtk_id_object (Result)
		end

	gtk_id_object (id: INTEGER): GTK_IDENTIFIED is
		require
			valid_id: id > 0
		do
			Result := c_id_object (id)
		end

feature -- comparison and copy

	is_equal (other: like Current): BOOLEAN is
		local
			l_id: INTEGER
		do
			-- Make the internal IDs the same and then
			-- call the standard comparison
			l_id := internal_object_id
			internal_object_id := other.gtk_object_id
			Result := standard_is_equal (other)
			internal_object_id := l_id
		end	

	copy (other: like Current) is
		do
			standard_copy (other)
			internal_object_id := 0
		end	

feature {NONE}

	internal_object_id: INTEGER

	dispose is
		do
			if internal_object_id /= 0 then
				c_free_id (internal_object_id)
				internal_object_id := 0
			end
		end

feature {NONE} -- externals

	c_new_id (object: GTK_IDENTIFIED): INTEGER is
		external "C"
		end

	c_free_id (id: INTEGER) is
		external "C"
		end

	c_id_object (id: INTEGER): GTK_IDENTIFIED is
		external "C"
		end

end




