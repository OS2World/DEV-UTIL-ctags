/*************************************************************************
 *
 * owconfig.h - config header for Open Watcom 1.6 and above OS/2 and NT
 *              targets.
 *
 *           Michael Greene <os2@mgreene.org> December 2006
 *
 *************************************************************************/


/*  You can define this label to be a string containing the name of a
 *  site-specific configuration file containing site-wide default options. The
 *  files /etc/ctags.conf and /usr/local/etc/ctags.conf are already checked,
 *  so only define one here if you need a file somewhere else.
 */
/* #undef CUSTOM_CONFIGURATION_FILE */

/*  Define this label if you want macro tags (defined lables) to use patterns
 *  in the EX command by default (original ctags behavior is to use line
 *  numbers).
 */
/* #undef MACROS_USE_PATTERNS */

/*  Define this as desired.
 *    1:  Original ctags format
 *    2:  Extended ctags format with extension flags in EX-style comment.
 */
#define DEFAULT_FILE_FORMAT 2

/* If you wish to change the directory in which temporary files are stored,
 * define this label to the directory desired.
 */
#define TMPDIR getenv("TMP")

/*  Define this label if your system supports starting scripts with a line of
 *  the form "#! /bin/sh" to select the interpreter to use for the script.
 */
// #define SYS_INTERPRETER 1


/* Define to 1 if you have the `fnmatch' function. */
//#define HAVE_FNMATCH 1

/* Define to 1 if you have the <fnmatch.h> header file. */
// #define HAVE_FNMATCH_H 1

/* Define to 1 if you have the `ftruncate' function. */
/* #undef HAVE_FTRUNCATE */

#define CASE_INSENSITIVE_FILENAMES 1
#define MSDOS_STYLE_PATH 1

/*  Define this label to use the system sort utility (which is probably more
 *  efficient) over the internal sorting algorithm.
 */
#ifndef INTERNAL_SORT
/* # undef EXTERNAL_SORT */
#endif

/* Define to 1 if you have the <sys/dir.h> header file. */
// #define HAVE_SYS_DIR_H 1

/* Define to 1 if you have the `truncate' function. */
// #define HAVE_TRUNCATE 1

// MANUAL_GLOBBING

#define HAVE_STAT_ST_INO 1
#define HAVE_CHMOD       1
#define HAVE_CHSIZE      1
#define HAVE_CLOCK       1
#define HAVE_DIRECT_H    1
#define HAVE_FCNTL_H     1
#define HAVE_FGETPOS     1
#define HAVE__FINDFIRST  1
#define HAVE_INTTYPES_H  1
#define HAVE_MEMORY_H    1
#define HAVE_MKSTEMP     1
#define HAVE_OPENDIR     1
#define HAVE_PUTENV      1
#define HAVE_REGCOMP     1
#define HAVE_REMOVE      1
#define HAVE_SETENV      1
#define HAVE_STAT_H      1
#define HAVE_STDINT_H    1
#define HAVE_STDLIB_H    1
#define HAVE_STRCASECMP  1
#define HAVE_STRERROR    1
#define HAVE_STRICMP     1
#define HAVE_STRINGS_H   1
#define HAVE_STRING_H    1
#define HAVE_STRNCASECMP 1
#define HAVE_STRNICMP    1
#define HAVE_STRSTR      1
#define HAVE_IO_H        1
#define HAVE_SYS_STAT_H  1
#define HAVE_SYS_TYPES_H 1
#define HAVE_TEMPNAM     1
#define HAVE_TIME_H      1
#define HAVE_TYPES_H     1
#define HAVE_UNISTD_H    1
#define HAVE__FINDFIRST  1
#define STDC_HEADERS     1


