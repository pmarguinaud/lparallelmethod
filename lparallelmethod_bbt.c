#include <bbt.h>
#include <string.h>
#include <strings.h>
#include <stdlib.h>

typedef struct name2method_t
{
  BBT_HEADER (name2method_t);
  char * name;
  char * method;
} name2method_t;


static int compare (const name2method_t * nma, const name2method_t * nmb)
{
  return strcasecmp (nma->name, nmb->name);
}

static name2method_t * root = NULL;

void lparallelmethod_bbt_add_ (const char * NAME, const char * METHOD, int NAME_len, int METHOD_len)
{
  name2method_t * nm = (name2method_t *)malloc (sizeof (name2method_t));
  nm->name = (char *)malloc (NAME_len + 1); strncpy (nm->name, NAME, NAME_len); nm->name[NAME_len] = 0;
  nm->method = (char *)malloc (METHOD_len + 1); strncpy (nm->method, METHOD, METHOD_len); nm->method[METHOD_len] = 0;
  bbt_insert_bbt (&root, nm, compare);
}

void lparallelmethod_bbt_get_ (const char * NAME, char * METHOD, int NAME_len, int METHOD_len)
{
  name2method_t * nm = NULL;
  char name[NAME_len+1];
  int i, len;
  
  strncpy (name, NAME, NAME_len); name[NAME_len] = 0;

  for (nm = root; nm; )
    {
      int cmp = strcasecmp (name, nm->name);
      if (cmp < 0)
        {
          nm = nm->left;
        }
      else if (cmp > 0)
        {
          nm = nm->right;
        }
      else
        {
          strncpy (METHOD, nm->method, METHOD_len);
          len = strlen (nm->method);
          for (i = len; i < METHOD_len; i++)
            METHOD[i] = ' ';
          return;
        }
    }

  for (i = 0; i < METHOD_len; i++)
    METHOD[i] = ' ';

  return;
}


