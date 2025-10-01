NAME = client
NAME_SERVER = server
CC = cc
CFLAGS = -Wall -Wextra -Werror
CLIENT_SRC = client.c
SERVER_SRC = server.c

LIBFT_DIR = ../libft
LIBFT_A = $(LIBFT_DIR)/libft.a

FTPRINTF_DIR = ../ft_printf
FTPRINTF_A = $(FTPRINTF_DIR)/ft_printf.a

OBJ = $(CLIENT_SRC:.c=.o) $(SERVER_SRC.c=.o)

all: $(LIBFT_A) $(FTPRINTF_A) $(NAME) $(NAME_SERVER)

$(LIBFT_A):
	$(MAKE) -C $(LIBFT_DIR)

$(FTPRINTF_A):
	$(MAKE) -C $(FTPRINTF_DIR)

$(NAME): $(OBJ) $(LIBFT_A) $(FTPRINTF_A)
	$(CC) $(CFLAGS) $(OBJ) $(LIBFT_A) $(FTPRINTF_A) -o $(NAME)

$(NAME_SERVER): $(OBJ) $(LIBFT_A) $(FTPRINTF_A)
	$(CC) $(CFLAGS) $(OBJ) $(LIBFT_A) $(FTPRINTF_A) -o $(NAME_SERVER)

clean:
	rm -f $(OBJ)
	$(MAKE) -C $(LIBFT_DIR) clean
	$(MAKE) -C $(LIBFT_DIR) clean

fclean: clean
	rm -f $(NAME) $(NAME_SERVER)
	$(MAKE) -C $(LIBFT_DIR) fclean
	$(MAKE) -C $(FTPRINTF_DIR) fclean

re: fclean all

.PHONY: all clean fclean re
