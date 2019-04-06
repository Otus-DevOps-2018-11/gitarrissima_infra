#!/usr/bin/bash

cp packer/variables.json.example packer/variables.json

find packer/ -name "*.json" | grep -v variables | xargs -n 1 -I {} bash -c 'packer validate -var-file=packer/variables.json {}' || exit 1


cd terraform/stage
terraform validate || exit 1

cd ../prod
terraform validate || exit 1



