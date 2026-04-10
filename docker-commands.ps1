# image builds
docker build --file Dockerfile --tag homework-backapp:1.0.0 backapp
docker build --file Dockerfile --tag homework-frontapp:1.0.0 frontapp

# image inspect
docker inspect homework-backapp:1.0.0
docker inspect homework-frontapp:1.0.0

# run containers manually
docker network create nw-homework
docker run --rm --detach --name backapp-container --network nw-homework homework-backapp:1.0.0
docker run --rm --detach --name frontapp-container --network nw-homework --env BACK_URL=http://backapp-container:8080 --publish 8080:8080 homework-frontapp:1.0.0
# cleanup
docker stop frontapp-container
docker stop backapp-container
docker network rm nw-homework

# run containers with compose (should cleanup manual run objects)
docker compose up
