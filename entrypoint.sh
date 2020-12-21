#!/bin/bash

# Delete all users in movies group
for username in `getent passwd | cut -d':' -f1`
do
	if id -nG "$username" | grep -qw "movies"; then
		deluser --remove-home $username
	fi
done

if [ ! $(getent group sshrp) ]; then
	groupadd movies
fi


for movie in /movies/*.mp4
do
	movie_name="$(basename $movie .mp4)"

	if id -u $movie_name >/dev/null 2>&1; then
		echo "The username $movie_name is already used by system"
		break
	fi

	# Create user
	useradd $movie_name --shell /play.sh
	adduser $movie_name movies
	# Set empty password
	printf '%s\n' "$movie_name:U6aMy0wojraho" | chpasswd -e

	echo "User $movie_name created !"

done

/usr/sbin/sshd -D -e