= Sherbrooke.info Docker

This repository is my work in progress to present Docker at the October 21st, 2013, meetup of Sherbrooke.info.

= Commands (single container)

1. `IMAGE_ID=$( docker build . )`
2. `docker -i -t ${IMAGE_ID}`
3. `PORT=$( docker ps | awk '/'${IMAGE_ID}'/ { print $NF }' | awk -F - '{ print $1 }' )`
4. `sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port ${PORT}`
5. From browser, connect to host, port 80: http://54.237.59.117/hello?name=Francois

= Commands (two containers)
