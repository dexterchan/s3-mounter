
build_container:
	docker build -t pigpiggcp/s3-mounter:alpine -f Dockerfile .

deploy_drive:
	./load_secret.sh
	kubectl apply -f kube/daemonset.yaml

destroy:
	kubectl delete -f kube/daemonset.yaml
	kubectl delete -f build/secret.yaml