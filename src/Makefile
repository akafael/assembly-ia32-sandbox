##
#
##

NAME = test

.PHONY:ALL
ALL: $(NAME)

$(NAME).o: $(NAME).s
	nasm -f elf $(NAME).s -o $(NAME).o

$(NAME): $(NAME).o
	ld -o $(NAME) $(NAME).o -m elf_i386

.PHONY:clear

clear:
	rm -v $(NAME) $(NAME).o
