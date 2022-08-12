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
#SRCS			= $(foreach dir, $(DIRS), $(wildcard $(dir)/*.c))
SRCS			=		ft_printf/ft_print_hex.c	\
					ft_printf/ft_print_ptr.c	\
					ft_printf/ft_print_unsigned.c	\
					ft_printf/ft_printchar.c	\
					ft_printf/ft_printf.c	\
					ft_printf/ft_printnbr.c	\
					ft_printf/ft_printstr.c	\
					gnl/get_next_line.c	\
					libft/ft_atoi.c \
					libft/ft_bzero.c	\
					libft/ft_calloc.c	\
					libft/ft_double_free.c 	\
					libft/ft_isalnum.c	\
					libft/ft_isalpha.c	\
					libft/ft_isascii.c	\
					libft/ft_isdigit.c	\
					libft/ft_isprint.c	\
					libft/ft_itoa.c	\
					libft/ft_memchr.c	\
					libft/ft_memcmp.c	\
					libft/ft_memcpy.c	\
					libft/ft_memmove.c	\
					libft/ft_memset.c	\
					libft/ft_putchar_fd.c	\
					libft/ft_putendl_fd.c	\
					libft/ft_putnbr_fd.c	\
					libft/ft_putstr_fd.c	\
					libft/ft_split.c	\
					libft/ft_strchr.c	\
					libft/ft_strcmp.c	\
					libft/ft_strdup.c	\
					libft/ft_striteri.c	\
					libft/ft_strjoin.c	\
					libft/ft_strlcat.c	\
					libft/ft_strlcpy.c	\
					libft/ft_strlen.c	\
					libft/ft_strmapi.c	\
					libft/ft_strncmp.c	\
					libft/ft_strnstr.c	\
					libft/ft_strrchr.c	\
					libft/ft_strtrim.c	\
					libft/ft_substr.c	\
					libft/ft_tolower.c	\
					libft/ft_toupper.c	\
					lst/ft_lstadd_back.c	\
					lst/ft_lstadd_front.c	\
					lst/ft_lstclear.c	\
					lst/ft_lstdelone.c	\
					lst/ft_lstiter.c	\
					lst/ft_lstlast.c	\
					lst/ft_lstmap.c	\
					lst/ft_lstnew.c	\
					lst/ft_lstsize.c
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
