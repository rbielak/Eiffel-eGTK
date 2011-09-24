-- Copyright 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--
indexing

	description: "Constant GTK_CELL_TYPE values"
	author: "Richie Bielak";
	date: "April 18, 2000"

class GTK_CELLTYPE_ENUM

feature -- GtkCellType constants

	Gtk_cell_empty: INTEGER			is    0
	Gtk_cell_text: INTEGER			is    1
	Gtk_cell_pixmap: INTEGER		is    2
	Gtk_cell_pixtext: INTEGER		is    3
	Gtk_cell_widget: INTEGER		is    4

end
