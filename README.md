start kubernetes, in a toy environment like so:

```bash
$ minikube start
$ minikube dashboard
```

add certificate to minikube so that it can access images from the local docker registry:

```bash
$ docker exec -it <minikube-container> bash
# mkdir -p /etc/docker/certs.d/troi.fritz.box
# vi /etc/docker/certs.d/troi.fritz.box/ca.crt
.. copy & paste the certificate ..
```

build and publish the docker image and start it

```bash
$ ./build.sh
$ docker push troi.fritz.box/ssh-server-with-docker:latest
$ kubectl apply -f deploy.yaml
$ kubectl expose deployment jenkins-agent --type=LoadBalancer --name=jenkins-service --port=7080
$ kubectl port-forward service/jenkins-service 7080:7080
```

you should now be able to connect to ssh
```bash
$ ssh -p 7080 localhost
```
