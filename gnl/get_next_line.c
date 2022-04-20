/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ngda-sil <ngda-sil@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/12/11 09:17:35 by ngda-sil          #+#    #+#             */
/*   Updated: 2022/04/20 15:52:21 by ngda-sil         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../incl/libft.h"

#ifndef BUFFER_SIZE
# define BUFFER_SIZE 10
#endif

static char	*ft_strjoin(char *s1, char *s2)
{
	char	*s;
	int		i;
	int		j;

	if (!s1)
	{
		s1 = (char *)malloc(1 * sizeof(char));
		s1[0] = '\0';
	}
	s = malloc(sizeof(char) * (ft_strlen(s1) + ft_strlen(s2) + 1));
	if (!s)
		return (NULL);
	j = -1;
	while (s1[++j])
		s[j] = s1[j];
	i = 0;
	while (s2[i])
		s[j++] = s2[i++];
	s[j] = '\0';
	free(s1);
	return (s);
}

char	*read_to_buf_copy(int fd, char *buf_copy)
{
	char	*buf;
	int		bytes_read;

	bytes_read = 1;
	buf = (char *)malloc((BUFFER_SIZE + 1) * sizeof(char));
	if (!buf)
		return (NULL);
	while (!ft_strchr(buf_copy, '\n') && bytes_read)
	{
		bytes_read = read(fd, buf, BUFFER_SIZE);
		if (bytes_read == -1)
		{
			free(buf);
			return (NULL);
		}
		buf[bytes_read] = '\0';
		buf_copy = ft_strjoin(buf_copy, buf);
	}
	free (buf);
	return (buf_copy);
}

char	*get_line(char *buf_copy)
{
	int		i;
	char	*line;

	i = 0;
	if (!buf_copy[i])
		return (NULL);
	while (buf_copy[i] && buf_copy[i] != '\n')
		i++;
	line = (char *)malloc((i + 2) * sizeof(char));
	if (!line)
		return (NULL);
	i = 0;
	while (buf_copy[i] && buf_copy[i] != '\n')
	{
		line[i] = buf_copy[i];
		i++;
	}
	if (buf_copy[i] == '\n')
	{
		line[i] = buf_copy[i];
		i++;
	}
	line[i] = '\0';
	return (line);
}

char	*new_buf_copy(char *buf_copy)
{
	char	*new_buf;
	int		i;
	int		j;

	i = 0;
	j = 0;
	while (buf_copy[i] && buf_copy[i] != '\n')
		i++;
	if (!buf_copy[i])
	{
		free (buf_copy);
		return (NULL);
	}
	new_buf = (char *)malloc(((ft_strlen(buf_copy) - i) + 1) * sizeof(char));
	if (!new_buf)
		return (NULL);
	i++;
	while (buf_copy[i])
	{
		new_buf[j++] = buf_copy[i++];
	}
	new_buf[j] = '\0';
	free(buf_copy);
	return (new_buf);
}

char	*get_next_line(int fd)
{
	static char	*buf_copy;
	char		*line;

	if (fd > 0 || BUFFER_SIZE <= 0)
		return (NULL);
	buf_copy = read_to_buf_copy(fd, buf_copy);
	if (!buf_copy)
		return (NULL);
	line = get_line(buf_copy);
	buf_copy = new_buf_copy(buf_copy);
	return (line);
}
