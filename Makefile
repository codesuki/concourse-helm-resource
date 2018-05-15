.PHONY: upgrade-k8s upgrade-helm

K8S_VERSION=1.9.6
HELM_VERSION=2.9.0

upgrade-k8s:
	sed -i "" "s/^ARG KUBERNETES_VERSION=.*$$/ARG KUBERNETES_VERSION=$$K8S_VERSION/" Dockerfile
	sed -i "" "s/^K8S_VERSION=.*$$/K8S_VERSION=$$K8S_VERSION/" Makefile
	git add Dockerfile Makefile
	git commit -m "chore: upgrade kubernetes to $$K8S_VERSION"

upgrade-helm:
	sed -i "" "s/^FROM codesuki\/docker-helm:.*$$/FROM codesuki\/docker-helm:$$HELM_VERSION/" Dockerfile
	sed -i "" "s/^HELM_VERSION=.*$$/HELM_VERSION=$$HELM_VERSION/" Makefile
	git add Dockerfile Makefile
	git commit -m "chore: upgrade helm to $$HELM_VERSION"

build: Dockerfile
	docker build . -t codesuki/helm
