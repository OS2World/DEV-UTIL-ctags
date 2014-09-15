#----------------------------------------------------------------------------
#
# Makefile for Exuberant CTAGS 5.6 using OpenWatcom 1.6 and above
#
#     Michael Greene <os2@mgreene.org>   16 December 2006
#
#----------------------------------------------------------------------------

# uncomment for debug version
#DEBUG = 1

# defaults
COMSYSTEM = os2
LNKSYSTEM = os2v2

!ifdef %WATCTAGS
COMSYSTEM = $(%WATCTAGS)
!endif

!ifeq COMSYSTEM OS2
LNKSYSTEM = os2v2
!endif

!ifeq COMSYSTEM NT
LNKSYSTEM = nt
!endif

!ifdef %WATDEBUG
DEBUG = 1
!endif

# Machine type -5r Pent -6r Pent Pro
MACHINE= -6r -fp6

#Optimization None -od  - Fastest possible -otexan
OPT= -otexan

CC = wcc386
CL = wcl386
LD = wlink
LB = wlib

REGEXDIR = .\watregex\src
REGEXLIB = regex.lib

INCLUDE  = .\;$(REGEXDIR);$(%watcom)\h;$(%watcom)\h\$(COMSYSTEM)

!ifdef DEBUG
CFLAGS   = -i=$(INCLUDE) -za99 -wx -od -d3 -DDEBUG $(MACHINE) -bt=$(COMSYSTEM) -mf
LDFLAGS  =  SYS $(LNKSYSTEM) d all op map,symf
REGEXDEF = -DREDEBUG -DPOSIX_MISTAKE
!else
CFLAGS   = -i=$(INCLUDE) -za99 -d0 -wx -zq $(OPT) $(MACHINE) -bt=$(COMSYSTEM) -mf
LDFLAGS  = SYS $(LNKSYSTEM) op el
REGEXDEF = -wcd302 -wcd202 -DREDEBUG -DPOSIX_MISTAKE
!endif

LIBFLAGS = -b -c -n -p=512

OBJECTS = args.obj asm.obj asp.obj awk.obj beta.obj c.obj cobol.obj eiffel.obj entry.obj &
          erlang.obj fortran.obj get.obj html.obj jscript.obj keyword.obj lisp.obj &
          lregex.obj lua.obj main.obj make.obj options.obj parse.obj pascal.obj &
          perl.obj php.obj python.obj read.obj rexx.obj routines.obj ruby.obj scheme.obj &
          sh.obj slang.obj sml.obj sort.obj sql.obj strlist.obj tcl.obj verilog.obj &
          vim.obj yacc.obj vstring.obj

REGEXSRC = $(REGEXDIR)\regfree.c $(REGEXDIR)\regerror.c $(REGEXDIR)\regexec.c $(REGEXDIR)\regcomp.c
REGEXOBJ = regfree.obj regerror.obj regcomp.obj regexec.obj

TMP = -d0 -wcd302 -otexan -6r -fp6 -w4 -e25 -zq -bt=os2 -bm -mf

.c.obj:
  $(CC) $(CFLAGS) $<

default: .SYMBOLIC
  @echo Targets:
  @echo    os2       build os2 release version
  @echo    os2debug  build os2 debug version
  @echo    nt        build nt release version
  @echo    ntdebug   build nt debug version
  @echo    clean     clean up the build
  @echo    ctagsarc  zip archive
  @echo    .

nt: .SYMBOLIC
  set WATCTAGS=NT
  wmake -f mk_owat.mak all

os2: .SYMBOLIC
  set WATCTAGS=OS2
  wmake -f mk_owat.mak all

ntdebug: .SYMBOLIC
  set WATCTAGS=NT
  set WATDEBUG=1
  wmake -f mk_owat.mak all

os2debug: .SYMBOLIC
  set WATCTAGS=OS2
  set WATDEBUG=1
  wmake -f mk_owat.mak all

all: ctags.exe readtags.exe readtags.lib

distarc: ctags.exe readtags.exe readtags.lib ctagsarc .SYMBOLIC

ctags.exe: regex.lib $(OBJECTS)
  $(LD) NAME ctags $(LDFLAGS) LIB $(REGEXLIB) FILE {$(OBJECTS)}

etags.exe: ctags.exe
  @copy $< $@

readtags.exe:
  if exist readtags.obj -@rm readtags.obj
  $(CC) $(CFLAGS) -DREADTAGS_MAIN readtags.c
  $(LD) NAME readtags $(LDFLAGS) FILE readtags.obj

readtags.lib:
  if exist readtags.obj -@rm readtags.obj
  $(CC) $(CFLAGS) readtags.c
  $(LB) $(LIBFLAGS) readtags.lib $(LIBOBJS)

regex.lib:
  $(CL) -c $(CFLAGS) $(REGEXDEF) $(REGEXSRC)
  $(LB) $(LIBFLAGS) regex.lib $(REGEXOBJ)

ctagsarc: .SYMBOLIC
  zip -9 ctags-5_6_ow.zip *.exe readtags.lib &
                                NEWS &
                                COPYING &
                                ctags.html &
                                watcom.readme

clean : .SYMBOLIC
  -@rm *.exe
  -@rm *.lib
  @%make cleanrel

cleanrel : .PROCEDURE
  -@rm *.obj
  -@rm *.sym
  -@rm *.err
  -@rm *.lst
  -@rm *.map
  -@rm *.err
  -@rm *.zip



