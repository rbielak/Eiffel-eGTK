/*
   Copyright 2000 Richie Bielak and others
   Licensed under Eiffel Forum Freeware License, version 1;
   (see forum.txt)
*/

/*

  eif_gdk.c - gdk specific bindings for eGTK

*/

#include "eif_gtk.h"

#include <gdk/gdk.h>
#include <gtk/gtk.h>
#include <glib.h>


GdkImage* c_gdk_image_new (GdkVisual* visual, int width, int height)
{
	return gdk_image_new (GDK_IMAGE_FASTEST, visual, width, height);
}

/* Gdk Graphic Context */

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

GdkColor* c_gtk_style_get_fg (GtkStyle* style, int index) {
  return &(style -> fg [index]);
}

void c_gtk_style_set_fg (GtkStyle *style, GdkColor *color, int index) {
  style->fg[index] = *color;
}

GdkColor* c_gtk_style_get_bg (GtkStyle* style, int index) {
  return &(style -> bg [index]);
}

void c_gtk_style_set_bg (GtkStyle *style, GdkColor *color, int index) {
  style->bg[index] = *color;
}

GdkColor* c_gtk_style_get_base (GtkStyle* style, int index) {
  return &(style -> base [index]);
}

void c_gtk_style_set_base (GtkStyle *style, GdkColor *color, int index) {
  style->base[index] = *color;
}


GdkColor* c_gtk_style_get_light (GtkStyle* style, int index) {
  return &(style -> light [index]);
}

void c_gtk_style_set_light (GtkStyle *style, GdkColor *color, int index) {
  style->light[index] = *color;
}

GdkColor* c_gtk_style_get_dark (GtkStyle* style, int index) {
  return &(style -> dark [index]);
}

void c_gtk_style_set_dark (GtkStyle *style, GdkColor *color, int index) {
  style->dark[index] = *color;
}

GdkColor* c_gtk_style_get_mid (GtkStyle* style, int index) {
  return &(style -> mid[index]);
}

void c_gtk_style_set_mid (GtkStyle *style, GdkColor *color, int index) {
  style->mid[index] = *color;
}

GdkColor* c_gtk_style_get_text (GtkStyle* style, int index) {
  return &(style -> text[index]);
}

void c_gtk_style_set_text (GtkStyle *style, GdkColor *color, int index) {
  style->text[index] = *color;
}

/* Style fonts */

GdkFont *c_gtk_style_font (GtkStyle *s) {
  return (s->font);
}

void c_gtk_style_set_font (GtkStyle *s, GdkFont *f) {
  s->font = f;
}


/****** GdkEvent ******/

GdkEventType c_gdk_event_type (GdkEventAny* event) {
  return (event -> type);
}

GdkWindow* c_gdk_event_window (GdkEventAny* event)
{
	return event -> window;
}

gint8 c_gdk_event_send_event (GdkEventAny* event)
{
	return event -> send_event;
}

/****** GdkEventMotion ******/

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

/****** GdkEventButton ******/
/* at the time this comment was written (199903210601 utc)
 * this is an almost exact duplicate of GdkEventMotion (is_state/button is
 * different)
 */

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

/* GdkEventKey */

guint32 c_gdk_event_get_time (GdkEventKey* event) {
  return (event->time);
}

guint c_gdk_event_get_state  (GdkEventKey* event) {
  return (event->state);
}

EIF_INTEGER c_gdk_event_get_keyval (GdkEventKey* event) {
  return (EIF_INTEGER)(event->keyval);
}

/* GdkEventConfigure */

EIF_INTEGER	c_gdk_event_configure_x (GdkEventConfigure *ep) {
  return (EIF_INTEGER)(ep->x);
}

EIF_INTEGER	c_gdk_event_configure_y (GdkEventConfigure *ep) {
  return (EIF_INTEGER)(ep->y);
}

EIF_INTEGER	c_gdk_event_configure_width (GdkEventConfigure *ep) {
  return (EIF_INTEGER)(ep->width);
}

EIF_INTEGER	c_gdk_event_configure_height (GdkEventConfigure *ep) {
  return (EIF_INTEGER)(ep->height);
}

/* GdkEventExpose */
GdkRectangle *c_gdk_event_expose_area (GdkEventExpose *ep) {
  return &(ep->area);
}

EIF_INTEGER c_gdk_event_expose_count (GdkEventExpose *ep) {
  return (EIF_INTEGER)(ep->count);
}

/* GdkEventVisibility */
EIF_INTEGER c_gdk_event_visibility_state (GdkEventVisibility *ep) {
  return (EIF_INTEGER)(ep->state);
}

/* GdkEventFocus */
EIF_INTEGER c_gdk_event_focus_in (GdkEventFocus *ep) {
  return (EIF_INTEGER)(ep->in);
}

/* GdkEventProperty */
EIF_INTEGER	c_gdk_event_property_atom (GdkEventProperty *ep) {
  return (EIF_INTEGER)(ep->atom);
}

EIF_INTEGER	c_gdk_event_property_time (GdkEventProperty *ep) {
  return (EIF_INTEGER)(ep->time);
}

EIF_INTEGER	c_gdk_event_property_state (GdkEventProperty *ep) {
  return (EIF_INTEGER)(ep->state);
}

/* GdkEventSelection */

EIF_INTEGER	c_gdk_event_selection_selection (GdkEventSelection *ep) {
  return (EIF_INTEGER)(ep->selection);
}

EIF_INTEGER	c_gdk_event_selection_target (GdkEventSelection *ep) {
  return (EIF_INTEGER)(ep->target);
}

EIF_INTEGER	c_gdk_event_selection_property (GdkEventSelection *ep) {
  return (EIF_INTEGER)(ep->property);
}

EIF_INTEGER	c_gdk_event_selection_requestor (GdkEventSelection *ep) {
  return (EIF_INTEGER)(ep->requestor);
}

EIF_INTEGER	c_gdk_event_selection_time (GdkEventSelection *ep) {
  return (EIF_INTEGER)(ep->time);
}


/***** end of GdkEvents section *******/

/****** gc_values accessors ******/

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
	p = (GdkGCValues*) g_malloc (sizeof (*p));
	/* HERE TODO:, but under control of the Eiffel memory system */
	return p;
}

/* end C helpers */

/* GdkRectangle functions */

GdkRectangle *c_gdk_rectangle_new (int x, int y, int w, int h) {
  GdkRectangle *rp;
  /* TODO: this should be deallocated by Eiffel dispose */
  rp = (GdkRectangle *)g_malloc (sizeof(GdkRectangle));
  rp->x = (gint16)x;
  rp->y = (gint16)y;
  rp->width = (gint16)w;
  rp->height = (gint16)h;
  return rp;
}

void c_gdk_rectangle_x_set (GdkRectangle *rp, int x) {
  rp->x = (gint16)x;
}

EIF_INTEGER c_gdk_rectangle_x (GdkRectangle *rp) {
  return (EIF_INTEGER)(rp->x);
}

void c_gdk_rectangle_y_set (GdkRectangle *rp, int y) {
  rp->y = (gint16)y;
}

EIF_INTEGER c_gdk_rectangle_y (GdkRectangle *rp) {
  return (EIF_INTEGER)(rp->y);
}

void c_gdk_rectangle_width_set (GdkRectangle *rp, int w) {
  rp->width = (gint16)w;
}

EIF_INTEGER c_gdk_rectangle_width (GdkRectangle *rp) {
  return (EIF_INTEGER)(rp->width);
}


void c_gdk_rectangle_height_set (GdkRectangle *rp, int h) {
  rp->height = (gint16)h;
}

EIF_INTEGER c_gdk_rectangle_height (GdkRectangle *rp) {
  return (EIF_INTEGER)(rp->height);
}

/* GdkColor fields */

gint c_gdk_color_size () {
  return (sizeof (GdkColor));
}

gulong	c_gdk_color_pixel (GdkColor *cp) {
  return (cp->pixel);
}

void c_gdk_color_set_pixel (GdkColor *cp, gulong pix) {
  cp->pixel = pix;
}
		
gushort	c_gdk_color_red (GdkColor *cp) {
  return (cp->red);
}

void c_gdk_color_set_red (GdkColor *cp, gushort val) {
  cp->red = val;
}

gushort	c_gdk_color_green (GdkColor *cp) {
  return (cp->green);
}

void c_gdk_color_set_green (GdkColor *cp, gushort val) {
  cp->green = val;
}

gushort	c_gdk_color_blue (GdkColor *cp) {
  return (cp->blue);
}

void c_gdk_color_set_blue (GdkColor *cp, gushort val) {
  cp->blue = val;
}

/* **********  Cursors  *********** */

GdkCursor * c_set_cursor (int cursor) {
  return gdk_cursor_new(cursor);
}

int c_get_cursor(GdkCursor * p) {
  return p->type;
}

/* ********** Geometry ************ */

GdkGeometry * c_gdk_geometry_object (gint min_width, gint min_height, gint max_width, gint max_height, gint base_width, gint base_height, gint width_inc, gint height_inc, gdouble min_aspect, gdouble max_aspect) {
	GdkGeometry * ptr;

	ptr = (GdkGeometry *) g_malloc((gulong) sizeof(GdkGeometry));
	ptr->min_width = min_width;
	ptr->min_height = min_height;
	ptr->max_width = max_width;
	ptr->max_height = max_height;
	ptr->base_width = base_width;
	ptr->base_height = base_height;
	ptr->width_inc = width_inc;
	ptr->height_inc = height_inc;
	ptr->min_aspect = min_aspect;
	ptr->max_aspect = max_aspect;

	return(ptr);
}

void c_gdk_geometry_free(GdkGeometry * ptr) {
		g_free(ptr);
}

void c_gdk_object_set_min_width(GdkGeometry * ptr, gint i) {
	ptr->min_width = i;
}

void c_gdk_object_set_min_height(GdkGeometry * ptr, gint i) {
	ptr->min_height = i;
}

void c_gdk_object_set_max_width(GdkGeometry * ptr, gint i) {
	ptr->max_width = i;
}

void c_gdk_object_set_max_height(GdkGeometry * ptr, gint i) {
	ptr->max_height = i;
}

void c_gdk_object_set_base_width(GdkGeometry * ptr, gint i) {
	ptr->base_width = i;
}

void c_gdk_object_set_base_height(GdkGeometry * ptr, gint i) {
	ptr->base_height = i;
}

void c_gdk_object_set_width_inc(GdkGeometry * ptr, gint i) {
	ptr->width_inc = i;
}

void c_gdk_object_set_height_inc(GdkGeometry * ptr, gint i) {
	ptr->height_inc = i;
}

void c_gdk_object_set_min_aspect(GdkGeometry * ptr, gdouble i) {
	ptr->min_aspect = i;
}

void c_gdk_object_set_max_aspect(GdkGeometry * ptr, gdouble i) {
	ptr->max_aspect = i;
}
