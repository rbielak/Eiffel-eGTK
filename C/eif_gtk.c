/*
   Copyright 1999 Richie Bielak and others
   Licensed under Eiffel Forum Freeware License, version 1;
   (see forum.txt)
*/
/*

  eif_gtk.c - v 0.3.4

  This file contains the external routines whose code is common between
  all Eiffel compilers.


 */

#include <gtk/gtk.h>
#include "eif_gtk.h"


/*****  GtkObject fields *****/
GtkObjectClass *c_gtk_object_klass (GtkObject *o) {
  return (o->klass);
}

guint32 c_gtk_object_flags (GtkObject *o) {
  return (o->flags);
}

GData *c_gtk_object_data (GtkObject *o) {
  return (o->object_data);
}

guint c_gtk_object_ref_count (GtkObject *o) {
  return (o->ref_count);
}

/***** GtkWidget fields *****/
gchar *c_gtk_widget_name (GtkWidget *w) {
  return (w->name);
}

GtkStyle* c_gtk_widget_get_style (GtkWidget* widget)
{
	return widget -> style;
}

GdkWindow *c_gtk_widget_window (GtkWidget *w) 
{
  return (w->window);
}

GtkWidget *c_gtk_widget_parent (GtkWidget *w) {
  return (w->parent);
}

/* Set widget flags */
void c_gtk_widget_set_flags (GtkWidget *widget, int flags) 
{
  GTK_WIDGET_SET_FLAGS (widget, flags);
}

EIF_BOOLEAN c_gtk_widget_visible (GtkWidget *w) 
{
  if (GTK_WIDGET_VISIBLE(w))
	return (1);
  else
	return (0);
}

EIF_INTEGER c_gtk_widget_width (GtkWidget *w)
{
  EIF_INTEGER result = 0;
  if (w != NULL)
	result = w->allocation.width;
  return (result);
}

EIF_INTEGER c_gtk_widget_height (GtkWidget *w)
{
  EIF_INTEGER result = 0;
  if (w != NULL)
	result = w->allocation.height;
  return (result);
}


GtkWidget *c_focus_child (GtkWidget *w) {
  return (GTK_CONTAINER(w)->focus_child);
}

gchar *c_label_text (GtkWidget *w) {
  return (GTK_LABEL(w)->label);
}

/****** GTK_BIN *********/
GtkWidget *c_gtk_bin_child (GtkWidget *w) {
  return (GTK_BIN(w)->child);
}

/****** GTK_BUTTON ******/

/* Return a state of a toggle button */
int c_gtk_toggle_button_active (GtkWidget *button) 
{
  return (GTK_TOGGLE_BUTTON(button)->active);
}


/****** Dialogs ******/

GtkWidget* c_dialog_vbox(GtkDialog *p) { 
  return p->vbox;
}

GtkWidget* c_dialog_action_area(GtkDialog *p) { 
  return p->action_area;
}

/****** Notebooks ******/

int c_gtk_notebook_is_tabs_shown(GtkNotebook *p)
{
  return p->show_tabs;
}

int c_gtk_notebook_is_border_shown(GtkNotebook *p)
{
  return p->show_border;
}

int c_gtk_notebook_current_tab_pos(GtkNotebook *p)
{
  return p->tab_pos;
}

/****** file selector ******/
GtkWidget *c_gtk_file_selection_ok_button (GtkFileSelection *fs) {
  return (fs->ok_button);
}

GtkWidget *c_gtk_file_selection_cancel_button (GtkFileSelection *fs) {
  return (fs->cancel_button);
}

/***** Color selection *****/
GtkWidget *c_gtk_color_selection_dialog_ok_button (GtkColorSelectionDialog *cs) {
  return (cs->ok_button);
}

GtkWidget *c_gtk_color_selection_dialog_cancel_button (GtkColorSelectionDialog *cs) {
  return (cs->cancel_button);
}
GtkWidget *c_gtk_color_selection_dialog_colorsel (GtkColorSelectionDialog *cs) {
  return (cs->colorsel);
}

/***** Font selection ******/
GtkWidget *c_gtk_font_selection_dialog_ok_button(GtkFontSelectionDialog *fs)
{
	return fs->ok_button;
}

GtkWidget *c_gtk_font_selection_dialog_apply_button(GtkFontSelectionDialog *fs)
{
	return fs->apply_button;
}

GtkWidget *c_gtk_font_selection_dialog_cancel_button(GtkFontSelectionDialog *fs)
{
	return fs->cancel_button;
}

GtkWidget *c_gtk_font_selection_dialog_fontsel (GtkFontSelectionDialog *fs) {
  return (fs->fontsel);
}

GtkWidget *c_gtk_gamma_curve_curve(GtkGammaCurve *gc) {
	return (gc->curve);
}


/* xxiii ISE forces external "C" names to lower case */
GdkWindow* c_gtk_widget_get_window (GtkWidget* widget)
{
	return widget -> window;
}

/* frido 1999-10-01 */
GtkWidget *c_gtk_color_selection_dialog_help_button(GtkColorSelectionDialog *cs) {
  return (cs->help_button);
}


guint32 c_gtk_object_get_flags (GtkObject* object)
{
	return GTK_OBJECT_FLAGS(object);
}

/* C MACRO boolean queries, return 0 for false, non-0 for true */

gint c_gtk_object_type (GtkObject *op) {
  return (GTK_OBJECT_TYPE (op));
}

gint c_gtk_is_object (GtkObject *op) {
  return (GTK_IS_OBJECT (op));
}

gint c_gtk_widget_no_window (GtkWidget* widget)
{
	return GTK_WIDGET_NO_WINDOW(widget);
}

gint c_gtk_widget_realized (GtkWidget* widget)
{
	return GTK_WIDGET_REALIZED(widget);
}


gint c_gtk_is_widget (GtkWidget *widget) {
  return GTK_IS_WIDGET (widget);
}
/* end C MACRO boolean queries */



/****** GtkAdjustment accessors ******/

float c_gtk_adjustment_get_lower (GtkAdjustment* adjustment)
{
	return adjustment -> lower;
}

void c_gtk_adjustment_set_lower (GtkAdjustment* adjustment, float value)
{
	adjustment -> lower = value;
}

float c_gtk_adjustment_get_upper (GtkAdjustment* adjustment)
{
	return adjustment -> upper;
}

void c_gtk_adjustment_set_upper (GtkAdjustment* adjustment, float value)
{
	adjustment -> upper = value;
}

float c_gtk_adjustment_get_page_increment (GtkAdjustment* adjustment)
{
	return adjustment -> page_increment;
}

void c_gtk_adjustment_set_page_increment (GtkAdjustment* adjustment, float value)
{
	adjustment -> page_increment = value;
}

float c_gtk_adjustment_get_page_size (GtkAdjustment* adjustment)
{
	return adjustment -> page_size;
}

void c_gtk_adjustment_set_page_size (GtkAdjustment* adjustment, float value)
{
	adjustment -> page_size = value;
}

float c_gtk_adjustment_get_step_increment (GtkAdjustment* adjustment)
{
	return adjustment -> step_increment;
}

void c_gtk_adjustment_set_step_increment (GtkAdjustment* adjustment, float value)
{
	adjustment -> step_increment = value;
}

float c_gtk_adjustment_get_value (GtkAdjustment* adjustment)
{
	return adjustment -> value;
}
/* set value is present in the gtk library, and directly called from the eiffel
 * code.
 */

/* end GtkAdjustment accessors */

/****** GtkText adjustments ******/

GtkAdjustment * c_gtk_text_hadj (GtkText * text)
{
		return text->hadj;
}

GtkAdjustment * c_gtk_text_vadj (GtkText * text)
{
		return text->vadj;
}

/* end of GtkText adjustments */

/****** GtkCList features *****/

EIF_INTEGER c_gtk_clist_col_count (GtkCList * clist)
{
	return (EIF_INTEGER) clist->columns;
}

EIF_INTEGER c_gtk_clist_row_count (GtkCList * clist)
{
	return (EIF_INTEGER) clist->rows;
}

EIF_BOOLEAN c_gtk_clist_autosorting (GtkCList * clist)
{
	return (EIF_BOOLEAN) GTK_CLIST_AUTO_SORT(clist);
}

EIF_INTEGER c_gtk_clist_sort_type (GtkCList *clist) {
  return (EIF_INTEGER)(clist->sort_type);
}

EIF_INTEGER c_gtk_clist_sort_column (GtkCList *clist) {
  return (EIF_INTEGER)(clist->sort_column);
}

EIF_INTEGER c_gtk_clist_focus_row (GtkCList *clist) {
  return (EIF_INTEGER) clist -> focus_row;
}

GList *c_gtk_clist_selection (GtkCList *clist) {
  return (clist->selection);
}

GList *c_gtk_clist_selection_end (GtkCList *clist) {
  return (clist->selection_end);
}

GList *c_gtk_clist_row_list (GtkCList *clist) {
  return (clist->row_list);
}

static gint ccsr = -1;

static gint ccsc = -1;

void c_gtk_clist_get_selection_info(GtkCList *clist, guint x, guint y) {
  gtk_clist_get_selection_info(clist, x, y, &ccsr, &ccsc);
}

EIF_INTEGER c_cell_selected_row() {
  return (EIF_INTEGER) ccsr;
}

EIF_INTEGER c_cell_selected_col() {
  return (EIF_INTEGER) ccsc;
}

/* ----------------------------------------------------- */
/* Create a pixmap widget from an xpm file */
GtkWidget *c_gtk_pixmap_create_from_xpm (GtkWidget *widget, char *fname) 
{
  GdkBitmap *mask;
  GdkPixmap *pixmap;
  
  /* Widget must be realized before we can attach a pixmap to it */
  if (widget->window == NULL)
	gtk_widget_realize (widget);
  pixmap = gdk_pixmap_create_from_xpm (widget->window,
		   &mask, 
		   &widget->style->bg[GTK_STATE_NORMAL],
		   fname);
  return (gtk_pixmap_new (pixmap, mask));
}

/* Combo Boxes */

/* Create a GList from an array of char *'s */
void c_gtk_combo_set_popdown_strings(GtkCombo *combo, char **strings, int count)
{
	int i;
	GList *list;
	GList *temp;

	if(count > 0)
	{
		list = g_list_alloc();
		list->data = strings[0];
		temp = list;
		for(i = 1; i < count; i++)
		{
			temp->next = g_list_alloc();
			temp->next->prev = temp;
			temp = temp->next;
			temp->data = strings[i];
		}
	}
	else
		list = NULL;
	gtk_combo_set_popdown_strings(combo, list);
}

/* Return a pointer to the entry component of a combo box */
GtkWidget* c_gtk_combo_entry(GtkCombo* combo) {
		return combo->entry;
}

/* Return a pointer to the list component of a combo box */
GtkWidget* c_gtk_combo_list(GtkCombo* combo) {
		return combo->list;
}

/* Button Boxes */

int c_gtk_button_box_get_child_size_min_width_default()
{
	int width, height;
	gtk_button_box_get_child_size_default(&width, &height);
	return width;
}

int c_gtk_button_box_get_child_size_min_height_default()
{
	int width, height;
	gtk_button_box_get_child_size_default(&width, &height);
	return height;
}

int c_gtk_button_box_get_child_ipadding_x_default()
{
	int ipad_x, ipad_y;
	gtk_button_box_get_child_ipadding_default(&ipad_x, &ipad_y);
	return ipad_x;
}

int c_gtk_button_box_get_child_ipadding_y_default()
{
	int ipad_x, ipad_y;
	gtk_button_box_get_child_ipadding_default(&ipad_x, &ipad_y);
	return ipad_y;
}

int c_gtk_button_box_get_child_size_min_width(GtkButtonBox* box)
{
	int width, height;
	gtk_button_box_get_child_size(box, &width, &height);
	return width;
}

int c_gtk_button_box_get_child_size_min_height(GtkButtonBox* box)
{
	int width, height;
	gtk_button_box_get_child_size(box, &width, &height);
	return height;
}

int c_gtk_button_box_get_child_ipadding_x(GtkButtonBox* box)
{
	int ipad_x, ipad_y;
	gtk_button_box_get_child_ipadding(box, &ipad_x, &ipad_y);
	return ipad_x;
}

int c_gtk_button_box_get_child_ipadding_y(GtkButtonBox* box)
{
	int ipad_x, ipad_y;
	gtk_button_box_get_child_ipadding(box, &ipad_x, &ipad_y);
	return ipad_y;
}

void c_gtk_paned_set_handle_size(GtkPaned *paned, int size)
{
	gtk_paned_set_handle_size(paned, (guint16) size);
}

void c_gtk_paned_set_gutter_size(GtkPaned *paned, int size)
{
	gtk_paned_set_gutter_size(paned, (guint16) size);
}

/* GtkList structure fields */
gint c_gtk_list_children_count (GtkList *gl) {
  return (g_list_length (gl->children));
}

GList *c_gtk_list_selection (GtkList *tree) {
  return (tree->selection);
}


/* Tree structure fields */
GList *c_gtk_tree_selection (GtkTree *tree) {
  return (tree->selection);
}

gint c_gtk_tree_children_count (GtkTree *tree) {
  return (g_list_length (tree->children));
}

GtkWidget *c_gtk_tree_item_subtree (GtkTreeItem *it) {
  return (it->subtree);
}

/* Fields of check menu item */
gint c_gtk_check_menu_item_is_active (GtkCheckMenuItem *it) {
  return (it->active);
}

/* GtkStyle */
/* Glist fields */

gpointer c_glist_data_as_pointer (GList *gl) {
  return (gl->data);
}

gint c_glist_data_as_integer (GList *gl) {
  return (gint)(gl->data);
}

gpointer c_glist_next (GList *gl) {
  return gl->next;
}

gpointer c_glist_prev (GList *gl) {
  return gl->prev;
}

/* GtkCTree helper routines */

guint c_gtk_ctree_tree_indent (GtkCTree *ct) {
  return (ct->tree_indent);
}

guint c_gtk_ctree_tree_spacing (GtkCTree *ct) {
  return (ct->tree_spacing);
}

guint c_gtk_ctree_tree_column (GtkCTree *ct) {
  return (ct->tree_column);
}

guint c_gtk_ctree_line_style (GtkCTree *ct) {
  return (ct->line_style);
}

guint c_gtk_ctree_expander_style (GtkCTree *ct) {
  return (ct->expander_style);
}

guint c_gtk_ctree_show_stub  (GtkCTree *ct) {
  return (ct->show_stub);
}

/* fetching data from cells of the tree */

static gchar *node_text = NULL;
static GdkPixmap *node_pixmap = NULL;
static GdkBitmap *node_mask = NULL;
static guint8 node_spacing = 0;

gint c_gtk_ctree_node_get_text (GtkCTree *ct,
										  GtkCTreeNode *nd,
										  gint col) {
  return gtk_ctree_node_get_text (ct, nd, col,
											 &node_text);
}

gint c_gtk_ctree_node_get_pixmap (GtkCTree *ct,
											 GtkCTreeNode *nd,
											 gint col) {
  return gtk_ctree_node_get_pixmap (ct, nd, col,
												&node_pixmap, &node_mask);
}

gint c_gtk_ctree_node_get_pixtext (GtkCTree *ct,
											  GtkCTreeNode *nd,
											  gint col) {
  return gtk_ctree_node_get_pixtext (ct, nd, col,
												 &node_text, &node_spacing,
												 &node_pixmap, &node_mask);
}

/* note that these routines don't care which tree the last item came from,
	so they must be accessed immediately if the read is successful */

gchar *c_gtk_ctree_last_text() {
  return node_text;
}

GdkPixmap *c_gtk_ctree_last_pixmap() {
  return node_pixmap;
}

GdkBitmap *c_gtk_ctree_last_mask() {
  return node_mask;
}

int c_gtk_ctree_last_spacing() {
  return (int) node_spacing;
}


/* ********************************************************* */
/* g_hash_table helper routines */

/* simple hash - the value of the key is the hash value */
guint hash_func (gconstpointer key) {
  return (guint)(key);
}

/* Return true if pointers are equal */
gint hash_compare_func (gconstpointer key1, gconstpointer key2) {
  return (key1 == key2);
}

GHashTable *c_g_hash_table_new_gpointer_int () {
  GHashTable *result;
  result = g_hash_table_new (hash_func, hash_compare_func);
  return result;
}


/* GtkCell helper routines */
GtkCellType c_gtk_cell_type (GtkCell *c) {
  return (c->type);
}

gint16 c_gtk_cell_vertical (GtkCell *c) {
  return (c->vertical);
}

gint16 c_gtk_cell_horizontal (GtkCell *c) {
  return (c->horizontal);
}

GtkStyle *c_gtk_cell_style (GtkCell *c) {
  return (c->style);
}

gchar *c_gtk_cell_text_text (GtkCellText *c) {
  return (c->text);
}

void c_gtk_cell_text_set_text (GtkCellText *c, gchar *text) {
  /* Should we deallocate old test and alloc new one ??? */
  c->text = text;
}

/* GtkCListRow helper routines */
GtkStyle *c_gtk_clist_row_style (GtkCListRow *rp) {
  return (rp->style);
}

GtkCell *c_gtk_clist_row_cell (GtkCListRow *rp) {
  return (rp->cell);
}


/* exportable arbitrary data

   This setup lets the data be preserved through garbage collection;
   unfortunately, that means that memory must be freed explicitly, which
   is a pain.  Class EGTK_EXPORTABLE gives access to the freeing function.

 */

void free_c_object(gpointer gp) {
  g_free(gp);
}

gpointer c_load_export(char *data) {
  gpointer gp;
  
  gp = g_malloc(strlen(data)+1);
  strcpy(gp, data);
  return gp;
}

GtkDestroyNotify c_pointer_to_free() {
  return (GtkDestroyNotify) free_c_object;
}

/*  ++++++++++++++++++++++++++++++++++++++++++++++ */

/* GtkCtreeRow stuff */

GtkCTreeNode *c_gtk_ctree_row_parent (GtkCTreeRow *r) {
  return (r->parent);
}

GtkCTreeNode *c_gtk_ctree_row_sibling (GtkCTreeRow *r) {
  return (r->sibling);
}

GtkCTreeNode *c_gtk_ctree_row_children (GtkCTreeRow *r) {
  return (r->children);
}

GdkPixmap *c_gtk_ctree_row_pixmap_closed (GtkCTreeRow *r) {
  return (r->pixmap_closed);
}

GdkPixmap *c_gtk_ctree_row_mask_closed (GtkCTreeRow *r) {
  return (r->mask_closed);
}

GdkPixmap *c_gtk_ctree_row_pixmap_opened (GtkCTreeRow *r) {
  return (r->pixmap_opened);
}

GdkPixmap *c_gtk_ctree_row_mask_opened (GtkCTreeRow *r) {
  return (r->mask_opened);
}

guint16 c_gtk_ctree_row_level (GtkCTreeRow *r) {
  return (r->level);
}

guint c_gtk_ctree_row_is_leaf (GtkCTreeRow *r) {
  return (r->is_leaf);
}

guint c_gtk_ctree_row_expanded (GtkCTreeRow *r) {
  return (r->expanded);
}

/* GtkRcStyle access */

gchar* c_gtk_rc_style_name(GtkRcStyle *s) {
  return (s->name);
}

gchar* c_gtk_rc_style_font_name(GtkRcStyle *s) {
  return (s->font_name);
}

gchar* c_gtk_rc_style_fontset_name(GtkRcStyle *s) {
  return (s->fontset_name);
}

gchar* c_gtk_rc_style_pixmap_name(GtkRcStyle *s, guint i) {
  return (s->bg_pixmap_name[i]);
}

GdkColor* c_gtk_rc_style_colour(GtkRcStyle *s, guint i, GtkRcFlags j) {

  switch (j) {
  case GTK_RC_FG:
	 return (&(s->fg[i]));
	 break;
  case GTK_RC_BG:
	 return (&(s->bg[i]));
	 break;
  case GTK_RC_TEXT:
	 return (&(s->text[i]));
	 break;
  case GTK_RC_BASE:
	 return ((&s->base[i]));
	 break;
  }
  return (NULL);
}

guint c_gtk_rc_style_colour_set(GtkRcStyle *s, guint i, GtkRcFlags j) {
  return (s->color_flags[i] & j);
}
