force-stop:
	kubectl delete deployment --all
	kubectl delete service --all

default-ns:
	kubectl config \
		set-context $(shell kubectl config current-context) \
		--namespace="lne"

create-secrets:
	kubectl create secret generic gcs-creds \
		-n lne \
		--from-file=./secrets/mdtn.json

	kubectl create secret generic aws-creds \
		-n lne \
		--from-file=./secrets/credentials

kubectl:
	gcloud container clusters get-credentials test-vcluster \
		--zone europe-west1-b \
		--project lne-europe

create-cluster:
	gcloud container clusters create test-vcluster \
      --zone europe-west1-b \
      --num-nodes 1 \
      --cluster-version 1.14 \
      --disk-size 100 \
      --machine-type n1-standard-8

create-test-cluster:
	gcloud container clusters create test-vcluster \
      --zone europe-west1-b \
      --num-nodes 1 \
      --cluster-version 1.14 \
      --disk-size 100 \
      --machine-type n1-standard-8