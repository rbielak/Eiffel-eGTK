indexing

	description: "Portable access to Eiffel object IDs."
	author: "Richie Bielak"
	date: "August 20th, 1999"

class GTK_IDENTIFIED

inherit

	IDENTIFIED
		rename
			object_id as gtk_object_id,
			id_object as gtk_id_object
		end

feature -- no features

end
