# Copyright 1998 Richie Bielak and others
# Licensed under Eiffel Forum Freeware License, version 1;
# (see forum.txt)

CFLAGS = `gtk-config --cflags` -Wall
INCLUDE = -I.

all: eif_gtk.a

eif_gtk.a: eif_gtk.o eif_gdk.o widget_fact.o eif_gtk_identified.o
	ar rc eif_gtk.a *.o

eif_gtk.o: ../eif_gtk.c eif_gtk.h
	gcc -g -c $(INCLUDE) $(CFLAGS) ../eif_gtk.c

eif_gdk.o: ../eif_gdk.c eif_gtk.h
	gcc -g -c $(INCLUDE) $(CFLAGS) ../eif_gdk.c

widget_fact.o: ../widget_fact.c eif_gtk.h
	gcc -c -g $(INCLUDE) $(CFLAGS) ../widget_fact.c

eif_gtk_identified.o: eif_gtk_identified.c eif_gtk.h
	gcc -c -g $(INCLUDE) $(CFLAGS) eif_gtk_identified.c

clean:
	-rm *.o *.a
