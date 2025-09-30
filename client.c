/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ptavares <ptavares@student.42porto.com>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/09/29 15:32:44 by ptavares          #+#    #+#             */
/*   Updated: 2025/09/30 13:27:07 by ptavares         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	send_signal(int pid, unsigned char character)
{
	int				i;
	unsigned char	tmp_char;

	i = 7;
	tmp_char = character;
	while (i > 0)
	{
		tmp_char = character >> i;
		if (tmp_char % 2 == 0)
			kill(pid, SIGUSR2);
		else
			kill(pid, SIGUSR1);
		usleep(42);
		i--;
	}
}

int	main(int ac, char **av)
{
	__pid_t		server_pid;
	const char	*msg;
	int			i;

	if (ac != 3)
	{
		ft_printf("Usage: %s <pid> <msg>\n", av[0]);
		exit(0);
	}
	server_pid = ft_atoi(av[1]);
	msg = av[2];
	i = 0;
	while (msg[i])
		send_signal(server_pid, msg[i++]);
	send_signal(server_pid, '\0');
	return (0);
}
