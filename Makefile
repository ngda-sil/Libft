# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ngda-sil <marvin@42lausanne.ch>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/11/18 19:21:55 by ngda-sil          #+#    #+#              #
#    Updated: 2022/04/13 17:13:33 by ngda-sil         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
					
# ------------------------------------------------------------------------------

NAME			= libft.a
CC				= gcc
CFLAGS 			= -Wall -Wextra -Werror
DIRS			= libft lst ft_printf gnl
SRCS			= $(foreach dir, $(DIRS), $(wildcard $(dir)/*.c))
OBJ				= $(SRCS:.c=.o)

# ==============================================================================


all: $(NAME)

$(NAME): ${OBJ}
	ar rc $(NAME) $(OBJ)

clean:
	rm -f ${OBJ}

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
