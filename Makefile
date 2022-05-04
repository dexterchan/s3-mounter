
build_container:
	docker build -t pigpiggcp/s3-mounter:alpine -f Dockerfile .
	docker push  pigpiggcp/s3-mounter:alpine

deploy_drive:
	./load_secret.sh
	kubectl apply -f kube/daemonset.yaml
	kubectl apply -f kube/example_pod.yaml 

destroy:
	kubectl delete -f kube/example_pod.yaml 
	kubectl delete -f kube/daemonset.yaml
	kubectl delete -f build/secret.yaml