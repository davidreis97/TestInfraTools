sudo docker build ../nodeproject/ -t inspectest
sudo docker run -d --name inspectest inspectest
sudo inspec exec Dockerfile-test.rb -t docker://inspectest
sudo docker kill inspectest
sudo docker container rm inspectest
#sudo docker image rm inspectest