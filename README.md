= Sherbrooke.info Docker

This repository is my work in progress to present Docker at the October 21st 2013, meetup of Sherbrooke.info.

= Commands (single container)

1. `docker build . # 75c969de0b33`
2. `export IMAGE_ID=...`
3. `JOB_ID=$( docker run -d ${IMAGE_ID} )`
4. `docker attach $JOB_ID`
5. `docker ps`
6. `export PORT=......`
7. `sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port ${PORT}`
8. From browser, connect to host, port 80: http://54.237.59.117/hello?name=Francois
9. `docker stop $JOB_ID`

= Commands (two containers)

1. `docker run -p 6379 -d vijaysamanuri/redis:latest redis-server`
2. Uncomment
3. `docker build . # aef61dd8ae8f`
4. `export IMAGE_ID=...`
5. `docker ps`
6. `export RPORT_ID=......`
7. `JOB_ID=$( docker run -e REDIS_URL=redis://$(hostname -i):${RPORT}/0 -d ${IMAGE_ID} )`
8. `docker attach ${JOB_ID}`
9. `sudo iptables -t nat -A PREROUTING -p tcp --dport 81 -j REDIRECT --to-port`

Host: ec2-54-237-59-117.compute-1.amazonaws.com
