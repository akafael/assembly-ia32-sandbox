##
# Basic Makefile to Compile assembly ia-32
#
# @author Rafael Lima
##

###############################################################################
# Variables
###############################################################################

NAME = test

CC := nasm
CFLAGS := -f elf

SRC := $(wildcard *.s)
OBJ := $(SRC:.s=.o)
BIN := $(basename ${SRC})

###############################################################################
# Rules
###############################################################################

# One Rule to rule then all
.PHONY:all
all: ${OBJ} ${BIN}

%.o: %.s
	nasm -f elf $< -o $@

%: %.o
	ld -o $@ $< -m elf_i386

# Remove Generated Files
.PHONY:clear
clear:
	-rm -v ${OBJ} ${BIN}

# Compile and Run Program
.PHONY: run
run: $(NAME)
	./$(NAME)
