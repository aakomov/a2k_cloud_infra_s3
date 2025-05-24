tf_init:
	cd infra && terraform init -upgrade

tf_plan:
	cd infra && terraform plan

tf_apply:
	cd infra && terraform apply -auto-approve

tf_destroy:
	cd infra && terraform destroy -auto-approve