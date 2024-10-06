PROFILE ?= solunion

check-updates:
	helm repo update

install: upgrade

upgrade:
	helm upgrade --install postgresql oci://registry-1.docker.io/bitnamicharts/postgresql -f values.yaml

uninstall:
	-helm uninstall postgresql

clean:
	-kubectl delete pvc -l app.kubernetes.io/name=postgresql --force --grace-period 0

start-tunnel:
	tmux new -s $(PROFILE)-postgresql -d 'sudo kubectl port-forward svc/postgresql 5432:5432'

stop-tunnel:
	tmux kill-session -t $(PROFILE)-postgresql