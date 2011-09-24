#include <gnome.h>

GtkWidget* c_gnome_canvas_new() {
  GtkWidget* result ;
  result = gnome_canvas_new() ;
  //printf("canvas canvas new %p \n", result);
  return result;
}

GtkWidget* c_gnome_canvas_new_aa() {
  GtkWidget* result ;
  gdk_rgb_init();
  result = gnome_canvas_new_aa() ;
  //printf("canvas canvas new aa%p \n", result);
  return result;
}

GnomeCanvasItem* c_gnome_canvas_item_new(GtkWidget* group) {
  GnomeCanvasItem* item;
  printf("canvas item new:group %p \n", group);
  item=gnome_canvas_item_new(GNOME_CANVAS_GROUP(group),
							 gnome_canvas_rect_get_type(),
							 NULL); 
  return item;
}

GnomeCanvasGroup* c_gnome_canvas_as_root_group(GtkWidget* canvas) {
  GnomeCanvasGroup* group;
  printf("canvas root\n£");
  group = gnome_canvas_root(GNOME_CANVAS(canvas));
  printf("canvas group as root  new:canvas %p group %p \n", canvas, group);
  return group;
}


GnomeCanvasItem* c_gnome_canvas_group_new(GtkWidget* canvas) {
  GnomeCanvasItem* group;
  //printf("canvas group  new:group %p \n", canvas);
  group = gnome_canvas_item_new(GNOME_CANVAS_GROUP(canvas),
								gnome_canvas_group_get_type(),
								NULL);
  printf("canvas group as root  new:canvas %p group %p \n", canvas, group);
  return group;
}

GnomeCanvasItem* c_gnome_canvas_widget_new(GtkWidget* canvas) {
  GnomeCanvasItem* result;
  //printf("canvas widget new:group %p \n", canvas);
  result = gnome_canvas_item_new(GNOME_CANVAS_GROUP(canvas),
								 gnome_canvas_widget_get_type(),NULL);
  printf("canvas widget new:group %p widget %p \n", canvas, result);
  return result;
}

GnomeCanvasItem* c_gnome_canvas_text_new(GtkWidget* canvas) {
  GnomeCanvasItem* result;
  //printf("canvas widget new:group %p \n", canvas);
  result = gnome_canvas_item_new(GNOME_CANVAS_GROUP(canvas),
								 gnome_canvas_text_get_type(),NULL);
  printf("canvas text new %p widget %p \n", canvas, result);
  return result;
}

/* void	c_gnome_canvas_item_position (GtkWidget* widget, int x, int y ,char * s,  char * k) */
/* { printf("init ok widget : %p x:%i y %i x2: x%s y2%p\n",widget,x,y,s,k); */
/*   gnome_canvas_item_set(GNOME_CANVAS_ITEM(widget),  */
/* 			"x1", */
/* 			(double)x, */
/* 			"y1", */
/* 			(double)y, */
/* 			NULL) */
/* ;} */


void c_gtk_object_set_string(GtkWidget* w, 
							 const gchar *name,
							 const gchar *value) {
  /* gtk_object_set(w, name, value, NULL); */
  /*  printf("set_string:%p %s %s\n", w, name, value); */
  gnome_canvas_item_set(GNOME_CANVAS_ITEM(w), 
						name,
						value,
						NULL);
};


void c_gtk_object_set_double(GtkWidget* w,
							 const gchar *name,
							 const double value) {
  /* gtk_object_set(w, name, value, NULL); */
  printf("set_double:%p %s %f\n", w, name, value);
  gnome_canvas_item_set(GNOME_CANVAS_ITEM(w), 
						name,
						value,
						NULL);
};

void c_gtk_object_set_integer(GtkWidget* w, 
							  const gchar *name,
							  const gint value) {
  // gtk_object_set(w, name, value, NULL); 
  printf("set_integer:%p %s %i\n", w, name, value);
  gnome_canvas_item_set(GNOME_CANVAS_ITEM(w), 
						name,
						value,
						NULL);
};

void c_gtk_object_set_boolean(GtkWidget* w, 
							  const gchar *name,
							  const gboolean value) {
  // gtk_object_set(w, name, value, NULL); 
  printf("set_boolean:%p %s %i\n", w, name, value);
  gnome_canvas_item_set(GNOME_CANVAS_ITEM(w), 
						name,
						value,
						NULL);
};

void c_gnome_canvas_item_w2i (GnomeCanvasItem* item, 
							  int* x, int *y) {
  double item_x, item_y;
  printf("x,y: %i %i", *x,*y);
  item_x = (double) *x;
  item_y = (double) *y;
  gnome_canvas_item_w2i(item->parent, &item_x, &item_y);
  *x = item_x;
  *y = item_y;
  printf("x,y after: %i %i ",*x, *y); 
};

void c_gnome_canvas_set_scroll_region(GnomeCanvas* canvas, 
									  int x1,int y1,int x2,int y2) {
  gnome_canvas_set_scroll_region(GNOME_CANVAS(canvas), x1, y1, x2, y2);
}

double  c_gtk_object_get_double(GtkWidget *w, char* name) {
  GtkArg arg[1];
  arg[0].name=name;
  gtk_object_getv(GTK_OBJECT(w),1,arg);
  printf("x: %f", GTK_VALUE_DOUBLE(arg[0]));
  return GTK_VALUE_DOUBLE(arg[0]);
}

double c_gnome_canvas_item_x_as_item(GtkWidget *w) {
  double item_x,item_y,item_x2, item_y2;  
  GtkArg arg[2];
  arg[0].name="x";
  arg[1].name="y1";
  //  gtk_object_getv(GTK_OBJECT(w),1,arg);
  // item_x =  GTK_VALUE_DOUBLE(arg[0]);
  //  item_y = GTK_VALUE_DOUBLE(arg[1]);
  gnome_canvas_item_get_bounds(GNOME_CANVAS_ITEM(w), 
							   &item_x, &item_y,
							   &item_x2, &item_y2);
  // printf("item %p avant transfo x: %f y: %f",w,item_x, item_y);
  // gnome_canvas_item_w2i(GNOME_CANVAS_ITEM(w), &item_x, &item_y);
  
  // printf("apres transfo x: %f y: %f",item_x, item_y);
  return item_x;
 }

double c_gnome_canvas_item_y_as_item(GtkWidget *w) {
  double item_x,item_y,item_x2, item_y2;  
  
  gnome_canvas_item_get_bounds(GNOME_CANVAS_ITEM(w), &item_x, &item_y,
							   &item_x2, &item_y2);
  return item_y;
}

void c_gnome_canvas_item_grab(GnomeCanvasItem *item) {
  GdkCursor *fleur;
  fleur = gdk_cursor_new(GDK_FLEUR);
  gnome_canvas_item_grab(item,
						 GDK_POINTER_MOTION_MASK | 
						 GDK_BUTTON_RELEASE_MASK,
						 fleur,
						 GDK_CURRENT_TIME);
  gdk_cursor_destroy(fleur);
}

void c_gnome_canvas_item_ungrab(GnomeCanvasItem *item) {
  gnome_canvas_item_ungrab(item,GDK_CURRENT_TIME);
}

GnomeCanvasItem* c_gnome_canvas_line_new(GnomeCanvasItem* group,
										 gint num_of_points, double p[]) {
  GnomeCanvasPoints* points;
  gint i, max;
  // GnomeCanvasGroup* group;
  GnomeCanvasItem* item;
  GtkType test;
  //  double affine[6];
  //  GtkWidget*  button;
  max = num_of_points /2;
  printf("line start p: %p num:%i p1:%f p4:%f\n",p,num_of_points,
		 p[0],p[num_of_points]);
  points = gnome_canvas_points_new(max);
  for (i=0;i< num_of_points;i++) {
	points->coords[i] = p[i];
	printf("i, p %i, %f",i,p[i]);
  };
 
  printf("line: group %p points %p num %i\n",group,points,points->num_points);
  //#ifdef GNOME_CANVAS_LINE_H
  test =gnome_canvas_line_get_type ();
  printf("testinfo name:%s\n", gtk_type_name(test)); 
  
  item = gnome_canvas_item_new(GNOME_CANVAS_GROUP(group),
							   gnome_canvas_line_get_type(),
							   "points", points,
							   "fill_color", "tan",
							   "outline_color", "black",
							   "width_units", 3.0,
							   //"points",points,
							   //GNOME_TYPE_CANVAS_LINE ,
							   NULL);
  printf("item new done\n");
  // gnome_canvas_line_get_type (),
  //GNOME_CANVAS_GROUP(group),
  //     gnome_canvas_polygon_get_type(),
  gnome_canvas_item_set(item, 
						"points",points,
						"fill_color", "black",
						//  "outline_color", "black",
						"width_units", 1.0,
						NULL);
  //      "points",points,"fill_color", "black","width_pixels", 2,  NULL);
  gnome_canvas_points_free(points); 
  printf("line %p\n", item);
  return item;
}
