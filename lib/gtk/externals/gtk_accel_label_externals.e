-- Copyright 1998 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--

indexing
	description:	"GTK+ external calls for GTK_ACCEL_LABEL"
	version: "v 0.3.5 GTK+ 1.2.x"
	author:		"Oliver Elphick"
	date:		"June 1999"
	cvs:		"$Id: gtk_accel_label_externals.e,v 1.3 2000/07/10 02:01:27 richieb Exp $"

class GTK_ACCEL_LABEL_EXTERNALS

feature {NONE}

	gtk_accel_label_new (string: POINTER): POINTER is
		external "C"
		end

	gtk_accel_label_get_accel_width (accel_label: POINTER): INTEGER is
		external "C"
		end

	gtk_accel_label_set_accel_widget  (accel_label,
			accel_widget: POINTER) is
		external "C"
		end

	gtk_accel_label_refetch (accel_label: POINTER): BOOLEAN is
		external "C"
		end

end -- GTK_ACCEL_LABEL_EXTERNALS
