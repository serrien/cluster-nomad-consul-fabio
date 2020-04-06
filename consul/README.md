- ### How to deploy:

  - **Build Consul AMI**: Firstly, you have to build AMI from packer template. Then take a note for AMI ID, you'll need it in later steps
    ```bash
    packer build packer-consul.json
    ...
    ==> Builds finished. The artifacts of successful builds are:
    --> amazon-ebs: AMIs were created:
    eu-west-3: ami-035e1bdc6f1039965
    ```


  - **Create stack**:
    ```bash
    aws cloudformation create-stack --stack-name consul-server-cluster --template-body file://hashicorp-consul-master-cluster-template --capabilities CAPABILITY_IAM --parameters ParameterKey=BaseImageId,ParameterValue=<ami-consul-id> ParameterKey=KeyName,ParameterValue=<existing-ec2-key-pair-name>
    ```

  - **Update stack**:
    ```bash
    aws cloudformation update-stack --stack-name consul-server-cluster --template-body file://hashicorp-consul-master-cluster-template.yaml --parameters ParameterKey=BaseImageId,ParameterValue=<ami-consul-id> ParameterKey=KeyName,ParameterValue=<existing-ec2-key-pair-name>
    ```

  - **Delete stack**:
    ```bash
    aws cloudformation delete-stack --stack-name consul-server-cluster
    ```

  - **Describe stack**:
    ```bash
    aws cloudformation describe-stacks --stack-name consul-server-cluster
    ```


https://rancher.com/docs/rancher/v2.x/en/installation/ha/create-nodes-lb/nlb/
https://rancher.com/docs/rke/latest/en/config-options/bastion-host/
https://rancher.com/docs/rancher/v2.x/en/installation/ha/helm-rancher/chart-options/#external-tls-termination
https://rancher.com/docs/rancher/v2.x/en/installation/ha/kubernetes-rke/
https://rancher.com/docs/rancher/v2.x/en/installation/references/

export KUBECONFIG=$(pwd)/kube_config_rancher-cluster.yml

kubectl create namespace cattle-system

helm install rancher-stable/rancher \
  --name rancher \
  --namespace cattle-system \
  --set hostname=rancher-ser.cbp-sandbox.com \
  --set tls=external
  
  
