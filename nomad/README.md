- ### How to deploy:

  - **Build Consul AMI**: Firstly, you have to build AMI from packer template. Then take a note for AMI ID, you'll need it in later steps
    ```bash
    packer build packer-nomad.json
    ...
    ==> Builds finished. The artifacts of successful builds are:
    --> amazon-ebs: AMIs were created:
    eu-west-3: ami-035e1bdc6f1039965
    ```


  - **Create stack**:
    ```bash
    aws cloudformation create-stack --stack-name nomad-server-cluster --template-body file://hashicorp-nomad-master-cluster-template --capabilities CAPABILITY_IAM --parameters ParameterKey=BaseImageId,ParameterValue=<ami-nomad-id> ParameterKey=KeyName,ParameterValue=<existing-ec2-key-pair-name>
    ```

  - **Update stack**:
    ```bash
    aws cloudformation update-stack --stack-name nomad-server-cluster --template-body file://hashicorp-nomad-master-cluster-template.yaml --parameters ParameterKey=BaseImageId,ParameterValue=<ami-nomad-id> ParameterKey=KeyName,ParameterValue=<existing-ec2-key-pair-name>
    ```

  - **Delete stack**:
    ```bash
    aws cloudformation delete-stack --stack-name nomad-server-cluster
    ```

  - **Describe stack**:
    ```bash
    aws cloudformation describe-stacks --stack-name nomad-server-cluster
    ```
