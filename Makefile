########################################################################
#                                                                      #
#              --- CAEN SpA - Computing Division ---                   #
#                                                                      #
#   CAENHVWRAPPER Software Project                                     #
#                                                                      #
#   Makefile: it installs shared library and HVWrapperdemo             #
#                                                                      #
#   Created: January 2010                                              #
#   Last mod: June  2016					                           #
#                                                                      #
#   Auth: A. Lucchesi                                                  #
#                                                                      #
########################################################################

GLOBALDIR= ./

PROGRAM=	$(GLOBALDIR)GRSIHVControl

CC=		gcc

FLAGS=		-DUNIX -DLINUX -Wall

LFLAGS=

LIBS=		-lcaenhvwrapper -lncurses -lpthread -ldl -lm


INCLUDEDIR=	-I./$(GLOBALDIR) -I./include/

SOURCES=	$(GLOBALDIR)GRSIVoltageControl.c $(GLOBALDIR)CrateCommands.c $(GLOBALDIR)CommandParser.c

OBJECTS=	$(GLOBALDIR)GRSIVoltageControl.o $(GLOBALDIR)CrateCommands.o $(GLOBALDIR)CommandParser.o

INCLUDES=	GRSIVoltageControl.h CAENHVWrapper.h

########################################################################

ARFLAGS=		r

CFLAGS=			$(FLAGS)

all:			$(PROGRAM)

$(PROGRAM):		$(OBJECTS)
			$(CC) $(CFLAGS) $(LFLAGS) -o $(PROGRAM) $(OBJECTS)\
			$(LIBS)

$(OBJECTS):		$(SOURCES)

$(GLOBALDIR)%.o:	$(GLOBALDIR)%.c
			$(CC) $(CFLAGS) $(INCLUDEDIR) -o $@ -c $<

clean:
			rm -f $(OBJECTS) $(PROGRAM)
