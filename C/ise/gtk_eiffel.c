/*
   Copyright 1998 Richie Bielak and others
   Licensed under Eiffel Forum Freeware License, version 1;
   (see forum.txt)
*/
/**********************************************

  Version:  0.2 - to be used with gtk+-1.0.4
                  and with ISE Eiffel 4.2.
  Date: 3/3/98
  
  Changes:
      4/23/99 - changed to use a marshaling function for the
	     callbacks so that we can manage callbacks with different
		 parameter lists better.

		5/12/1999 XXIII - add glue for GtkAdjustment

**************************************** */

#include <gtk/gtk.h>
#include "eif_eiffel.h"
#include "eif_argv.h"

typedef  struct _callback_data {
  EIF_PROC rtn;
  EIF_OBJ obj;
  void *data;
} callback_data;

typedef struct _args_data {
  guint   nparams;
  GtkArg  *args;
  GtkType *arg_types;
  GtkArg  *return_valuep;
} args_data;


void callback_entry_func (GtkObject *object, 
						  gpointer        data,
						  guint           nparams,
						  GtkArg         *args,
						  GtkType        *arg_types,
						  GtkType         return_type);


/* -------- Initialization -----------------------------------*/
/* Pass command line arguments to the GTK initialization code */
/* In ISE's runtime there are references to these in "argv.h" */
void c_gtk_init_tool_kit () {
  gtk_init (&eif_argc, &eif_argv);
  gtk_signal_set_funcs(callback_entry_func, NULL); 
}

/* --------------- Callbacks ------------------*/
/* Connect a call back to a widget/event pair */
gint c_gtk_signal_connect (GtkObject *widget, 
						   gchar *name, 
						   EIF_PROC func,
						   EIF_OBJ object,
						   callback_data **p)
{
  callback_data *cbd;
  int name_len;

  eif_freeze (object);  
  cbd = (callback_data *)g_malloc (sizeof (callback_data));
  /* Return the pointer of the allocated block to Eiffel, so it
	 can be deallocated later
  */
  *p = cbd;
  cbd->rtn = func;
  cbd->obj = eif_access (object);
  /* No callback routine here, all callbacks come through "callback_entry_func" */
  return (gtk_signal_connect (widget, name, NULL, (gpointer)cbd));
}

/* This function dispatches all the callbacks from GTK+ to Eiffel */
/* "data" is the Eiffel callback structure.                       */
void callback_entry_func (GtkObject *object, 
						  gpointer        data,
						  guint           nparams,
						  GtkArg         *args,
						  GtkType        *arg_types,
						  GtkType         return_type)
{
  callback_data *cbd;
  args_data argsd;

  /* Get the pointer to the callback block */
  cbd = (callback_data *)data;
  /* Save the arguments in a local struct */
  argsd.nparams = nparams;
  argsd.args = args;
  argsd.arg_types = arg_types;
  /* Set pointer to the return value */
  if (return_type == GTK_TYPE_NONE) 
	argsd.return_valuep = NULL;
  else
	argsd.return_valuep = &args[nparams];

  /* Call Eiffel */
  /*  printf ("callback= %d object= %d cbd= %d\n", cbd->rtn, (cbd->obj), cbd); */
  (cbd->rtn)(cbd->obj, nparams, &argsd);

}

/* Routines for fetching args */
gpointer c_fetch_pointer (args_data *ap, int i) {
  /* Return i-th argument as a pointer */
  gpointer result;
  result = GTK_VALUE_POINTER (ap->args[i]);
  return (result);
}

/* Set return value for a callback */
void c_set_return_value_bool (args_data *ap, int ret_val) {
  if (ap->return_valuep != NULL)
	*GTK_RETLOC_BOOL(*(ap->return_valuep)) = ret_val;
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


/*--------- Widget utility functions ------*/

/* Return a state of a toggle button */
int c_gtk_toggle_button_active (GtkWidget *button) 
{
  return (GTK_TOGGLE_BUTTON(button)->active);
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

GdkWindow *c_gtk_widget_window (GtkWidget *w) 
{
  return (w->window);
}

void c_free_call_back_block (callback_data *p) 
{
  if (p != NULL)
	g_free (p);
}


GtkWidget *c_focus_child (GtkWidget *w) {
  return (GTK_CONTAINER(w)->focus_child);
}

gchar *c_label_text (GtkWidget *w) {
  return (GTK_LABEL(w)->label);
}
						   
/* Dialogs */

GtkWidget* c_dialog_vbox(GtkDialog *p) { 
  return p->vbox;
}

GtkWidget* c_dialog_action_area(GtkDialog *p) { 
  return p->action_area;
}

/* Notebooks */

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

/* file selector */
GtkWidget *c_gtk_file_selection_ok_button (GtkFileSelection *fs) {
  return (fs->ok_button);
}

GtkWidget *c_gtk_file_selection_cancel_button (GtkFileSelection *fs) {
  return (fs->cancel_button);
}



GdkImage* c_gdk_image_new (GdkVisual* visual, int width, int height)
{
	return gdk_image_new (GDK_IMAGE_FASTEST, visual, width, height);
}

/* xxiii ISE forces external "C" names to lower case */
GdkWindow* c_gtk_widget_get_window (GtkWidget* widget)
{
	return widget -> window;
}

GtkStyle* c_gtk_widget_get_style (GtkWidget* widget)
{
	return widget -> style;
}

GdkGC* c_gtk_style_get_fg_gc (GtkStyle* style, int index)
{
	if ((index < 0) || (index >= sizeof (style -> fg_gc)))
		return 0;
	return style -> fg_gc [index];
}

GdkGC* c_gtk_style_get_bg_gc (GtkStyle* style, int index)
{
	if ((index < 0) || (index >= sizeof (style -> bg_gc)))
		return 0;
	return style -> bg_gc [index];
}

GdkGC* c_gtk_style_get_light_gc (GtkStyle* style, int index)
{
	if ((index < 0) || (index >= sizeof (style -> light_gc)))
		return 0;
	return style -> light_gc [index];
}

GdkGC* c_gtk_style_get_dark_gc (GtkStyle* style, int index)
{
	if ((index < 0) || (index >= sizeof (style -> dark_gc)))
		return 0;
	return style -> dark_gc [index];
}

GdkGC* c_gtk_style_get_mid_gc (GtkStyle* style, int index)
{
	if ((index < 0) || (index >= sizeof (style -> mid_gc)))
		return 0;
	return style -> mid_gc [index];
}

GdkGC* c_gtk_style_get_text_gc (GtkStyle* style, int index)
{
	if ((index < 0) || (index >= sizeof (style -> text_gc)))
		return 0;
	return style -> text_gc [index];
}

GdkGC* c_gtk_style_get_base_gc (GtkStyle* style, int index)
{
	if ((index < 0) || (index >= sizeof (style -> base_gc)))
		return 0;
	return style -> base_gc [index];
}

GdkGC* c_gtk_style_get_black_gc (GtkStyle* style)
{
	return style -> black_gc;
}

GdkGC* c_gtk_style_get_white_gc (GtkStyle* style)
{
	return style -> white_gc;
}

/* GdkEvent */

GdkEventType c_gdk_event_type (GdkEvent *event) {
  return (event -> type);
}

/* GdkEventMotion */
GdkWindow* c_gdk_event_motion_get_window (GdkEventMotion* gme)
{
	return gme -> window;
}

gint8 c_gdk_event_motion_get_send_event (GdkEventMotion* gme)
{
	return gme -> send_event;
}

guint32 c_gdk_event_motion_get_time (GdkEventMotion* gme)
{
	return gme -> time;
}

gdouble c_gdk_event_motion_get_x (GdkEventMotion* gme)
{
	return gme -> x;
}

gdouble c_gdk_event_motion_get_y (GdkEventMotion* gme)
{
	return gme -> y;
}

gdouble c_gdk_event_motion_get_pressure (GdkEventMotion* gme)
{
	return gme -> pressure;
}

gdouble c_gdk_event_motion_get_xtilt (GdkEventMotion* gme)
{
	return gme -> xtilt;
}

gdouble c_gdk_event_motion_get_ytilt (GdkEventMotion* gme)
{
	return gme -> ytilt;
}

guint c_gdk_event_motion_get_state (GdkEventMotion* gme)
{
	return gme -> state;
}

gint16 c_gdk_event_motion_get_is_hint (GdkEventMotion* gme)
{
	return gme -> is_hint;
}

guint32 c_gdk_event_motion_get_deviceid (GdkEventMotion* gme)
{
	return gme -> deviceid;
}

gdouble c_gdk_event_motion_get_x_root (GdkEventMotion* gme)
{
	return gme -> x_root;
}

gdouble c_gdk_event_motion_get_y_root (GdkEventMotion* gme)
{
	return gme -> y_root;
}

/* GdkEventButton */
/* at the time this comment was written (199903210601 utc)
 * this is an almost exact duplicate of GdkEventMotion (is_state/button is
 * different)
 */
GdkWindow* c_gdk_event_button_get_window (GdkEventButton* gme)
{
	return gme -> window;
}

gint8 c_gdk_event_button_get_send_event (GdkEventButton* gme)
{
	return gme -> send_event;
}

guint32 c_gdk_event_button_get_time (GdkEventButton* gme)
{
	return gme -> time;
}

gdouble c_gdk_event_button_get_x (GdkEventButton* gme)
{
	return gme -> x;
}

gdouble c_gdk_event_button_get_y (GdkEventButton* gme)
{
	return gme -> y;
}

gdouble c_gdk_event_button_get_pressure (GdkEventButton* gme)
{
	return gme -> pressure;
}

gdouble c_gdk_event_button_get_xtilt (GdkEventButton* gme)
{
	return gme -> xtilt;
}

gdouble c_gdk_event_button_get_ytilt (GdkEventButton* gme)
{
	return gme -> ytilt;
}

guint c_gdk_event_button_get_state (GdkEventButton* gme)
{
	return gme -> state;
}

guint c_gdk_event_button_get_button (GdkEventButton* gme)
{
	return gme -> button;
}

guint32 c_gdk_event_button_get_deviceid (GdkEventButton* gme)
{
	return gme -> deviceid;
}

gdouble c_gdk_event_button_get_x_root (GdkEventButton* gme)
{
	return gme -> x_root;
}

gdouble c_gdk_event_button_get_y_root (GdkEventButton* gme)
{
	return gme -> y_root;
}

guint32 c_gtk_object_get_flags (GtkObject* object)
{
	return GTK_OBJECT_FLAGS(object);
}

/* C MACRO boolean queries, return 0 for false, non-0 for true */
int c_gtk_widget_no_window (GtkWidget* widget)
{
	return GTK_WIDGET_NO_WINDOW(widget);
}

int c_gtk_widget_realized (GtkWidget* widget)
{
	return GTK_WIDGET_REALIZED(widget);
}
/* end C MACRO boolean queries */


/* gc_values accessors */

int c_gdk_gc_values_get_function (GdkGCValues* values)
{
	return values -> function;
}

void c_gdk_gc_values_set_function (GdkGCValues* values, int value)
{
	values -> function = value;
}

/* end gc_values accessors */


/* C helpers, these don't generally call a gdk/gtk function */
/* but do or setup something necessary for some gdk/gtk functions */
/* that can't be done directly in eiffel code */

GdkGCValues* c_gdk_make_gc_values ()
{
	GdkGCValues* p;
	p = (GdkGCValues*) malloc (sizeof (*p));
	/* HERE TODO:, but under control of the Eiffel memory system */
	return p;
}

/* end C helpers */

/* GtkAdjustment accessors */

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

/* GtkText adjustments */

GtkAdjustment * c_gtk_text_hadj (GtkText * text)
{
		return text->hadj;
}

GtkAdjustment * c_gtk_text_vadj (GtkText * text)
{
		return text->vadj;
}

/* end of GtkText adjustments */
