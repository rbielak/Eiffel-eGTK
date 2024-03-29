/*
   Copyright 1999 Richie Bielak and others
   Licensed under Eiffel Forum Freeware License, version 1;
   (see forum.txt)
*/

#include <stdio.h>
#include <malloc.h>

#define SIZE_INCREMENT 1024

/* This is really an pointer to an array of pointers             */
/* Size of pointers can is not always 4 bytes (eg. on the Alpha) */
/* so be careful with sizes of things.                           */
static int **id_table = NULL;

/* Capacity in integers */
static int id_table_capacity = 0;
static int next_id = 0;

/***************************************/
/* Assign a new ID to an Eiffel object */
/***************************************/
int c_new_id (void *object) {
  /* Allocate a new table if needed */
  if (id_table == NULL) {
    id_table = (int **)malloc (SIZE_INCREMENT * sizeof (int *));
    id_table_capacity = SIZE_INCREMENT;
  }
  /* Bump ID to the next one */
  next_id++;
  /* If table too small, realloc */
  if (next_id > id_table_capacity) {
    id_table_capacity = id_table_capacity + SIZE_INCREMENT;
    id_table = (int **)realloc (id_table, id_table_capacity * sizeof(int *));
  }
  /* Store the Eiffel reference */
  id_table [next_id] = (int *)object;
  return (next_id);
}

void *c_id_object (int id) {
  void *result;

  if (id <= next_id) 
    result = (void *)id_table [id];
  else
    result = NULL;
  return (result);
}

void c_free_id (int id) {
  if (id <= next_id)
    id_table[id] = 0;
}
