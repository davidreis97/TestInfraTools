sudo docker stop $(docker ps -q)
sudo docker system prune -a -f
sudo docker volume rm $(docker volume ls -q)