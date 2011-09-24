-- Copyright 2000 Richie Bielak and others
-- Licensed under Eiffel Forum Freeware License, version 1;
-- (see forum.txt)
--

class GTK_CTREE_ENUM

feature  -- GtkCTreePos constants

	Gtk_ctree_pos_before: INTEGER			is  0
	Gtk_ctree_pos_as_child: INTEGER			is  1
	Gtk_ctree_pos_after: INTEGER			is  2

feature  -- GtkCTreeLineStyle constants

	Gtk_ctree_lines_none: INTEGER			is  0
	Gtk_ctree_lines_solid: INTEGER			is  1
	Gtk_ctree_lines_dotted: INTEGER			is  2
	Gtk_ctree_lines_tabbed: INTEGER			is  3

feature  -- GtkCTreeExpanderStyle constants

	Gtk_ctree_expander_none: INTEGER		is  0
	Gtk_ctree_expander_square: INTEGER		is  1
	Gtk_ctree_expander_triangle: INTEGER		is  2
	Gtk_ctree_expander_circular: INTEGER		is  3

feature  -- GtkCTreeExpansionType constants

	Gtk_ctree_expansion_expand: INTEGER		is  0
	Gtk_ctree_expansion_expand_recursive: INTEGER	is  1
	Gtk_ctree_expansion_collapse: INTEGER		is  2
	Gtk_ctree_expansion_collapse_recursive: INTEGER	is  3
	Gtk_ctree_expansion_toggle: INTEGER		is  4
	Gtk_ctree_expansion_toggle_recursive: INTEGER	is  5


end
