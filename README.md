= Sherbrooke.info Docker

This repository is my work in progress to present Docker at the October 21st 2013, meetup of Sherbrooke.info.

= Commands (single container)

1. `docker build . # 75c969de0b33`
2. `IMAGE_ID=...`
3. `JOB_ID=$( docker run -d ${IMAGE_ID} )`
4. `PORT=$( docker ps | awk '/'${JOB_ID}'/ { print $NF }' | awk -F - '{ print $1 }' )`
5. `sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port ${PORT}`
6. From browser, connect to host, port 80: http://54.237.59.117/hello?name=Francois

= Commands (two containers)

1. Uncomment
2. `docker run -p 6379 -d vijaysamanuri/redis:latest redis-server`
3. `docker build . # 5b40034996cb`
4. `IMAGE_ID=...`
5. `docker run -e REDIS_URL=redis://$(hostname -i):${RPORT}/0 -i -t ${IMAGE_ID} )`
7. `sudo iptables -t nat -A PREROUTING -p tcp --dport 6379 -j REDIRECT --to-port`
8. `sudo iptables -t nat -A PREROUTING -p tcp --dport 81 -j REDIRECT --to-port`

Host: ec2-54-237-59-117.compute-1.amazonaws.com
