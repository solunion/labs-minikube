PROFILE = solunion
export PROFILE

start:
	minikube start -p $(PROFILE) \
		--driver=docker --container-runtime=containerd \
		--addons=ingress,ingress-dns,metrics-server,registry \
		--cpus 10 \
		--memory 32g \
		--subnet='192.168.50.0' \
		--extra-config=apiserver.service-node-port-range=1-65535

stop:
	minikube stop -p $(PROFILE)

install:
	@echo "Start PostgreSQL..."
	@(cd services/postgresql && make install)
	@echo "Installation completed!!!"

start-tunnel:
	@echo 'Start tunnel for PostgreSQL...'
	@(cd services/postgresql && make start-tunnel)
	
stop-tunnel:
	@echo 'Stop tunnel for PostgreSQL...'
	@(cd services/postgresql && make stop-tunnel)