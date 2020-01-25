.PHONY: build, release

build:
	@rm -f kubeadm.box
	@vagrant package --output kubeadm.box

release:
	@curl -X PUT --upload-file kubeadm.box "$(curl -s 'https://vagrantcloud.com/api/v1/box/huazhihao/kubeadm/version/1.17/provider/virtualbox/upload?access_token='${access_token} | jq -r .upload_path)"

cache:
	@vagrant box add kubeadm kubeadm.box --force
