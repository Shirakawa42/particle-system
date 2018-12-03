# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lvasseur <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/02/22 13:30:54 by lvasseur          #+#    #+#              #
#    Updated: 2018/12/03 17:03:28 by lvasseur         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = particle_system
CC = clang++

SRC_PATH = ./src/
OBJ_PATH = ./obj/
LIB_PATH = ./lib/
INC_PATH = ./include/ $(LIB_PATH)glfw/include/

GCC_FLGS = -Werror -Wextra -Wall
GCC_LIBS = -lglfw3 -framework AppKit -framework OpenGL -framework IOKit -framework CoreVideo

SRC_NAME =	main.cpp Window.cpp
OBJ_NAME = $(SRC_NAME:.cpp=.o)
LIB_NAME = glfw/src

SRC = $(addprefix $(SRC_PATH), $(SRC_NAME))
OBJ = $(addprefix $(OBJ_PATH), $(OBJ_NAME))
INC = $(addprefix -I,$(INC_PATH))
LIB = $(addprefix -L$(LIB_PATH),$(LIB_NAME))

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(GCC_FLGS) $(LIB) $(INC) $(OBJ) $(GCC_LIBS) -o $(NAME)

$(OBJ_PATH)%.o: $(SRC_PATH)%.cpp
	mkdir -p $(OBJ_PATH)
	$(CC) $(GCC_FLGS) $(INC) -o $@ -c $<

clean:
	rm -f $(OBJ)
	rm -rf $(OBJ_PATH)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: make all clean fclean re
