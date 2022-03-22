#! /bin/bash
sudo apt-get update
sudo apt-get install -y docker.io
sudo docker run -d -p 3000:3000 angelestrada14019/repo_prueba:app_ciclo
