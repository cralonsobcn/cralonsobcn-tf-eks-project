## ( -- AWS Config -- )
variable "aws_region" {
  type        = string
  default     = "us-east-1"
  sensitive   = false
  description = "Default AWS region to deploy resources"
}

variable "eks-cluster-name" {
  type        = string
  default     = "eks-demo"
  description = "Name of the EKS Cluster Role"
}

data "aws_caller_identity" "account_id" {
}

## ( -- EKS Controlplane -- )
variable "vpc-controlplane-name" {
  type = string
  default = "vpc-controlplane"
  description = "Name of the VPC assigned to the EKS controlplane"
}

variable "vpc-controlplane-cidr" {
  type        = string
  default     = "192.168.0.0/24"
  description = "CIDR block assigned to the dataplane VPC"
   
}

variable "controlplane-subnet-a-cidr" {
  type        = string
  default     = "192.168.0.0/26"
  description = "CIDR block assigned to the subnet aws-vpc-controlplane-subnet-a"
}

variable "controlplane-subnet-b-cidr" {
  type        = string
  default     = "192.168.0.64/26"
  description = "CIDR block assigned to the subnet aws-vpc-controlplane-subnet-b"
}

variable "controlplane-kubernetes-version" {
  type = string
  default = "1.32"
  description = "Kubernetes version to be used by the EKS controlplane"
}

## ( -- EKS Dataplane -- )
variable "vpc-dataplane-name" { 
  type        = string
  default     = "vpc-dataplane"
  description = "Name of the VPC assigned to the EKS dataplane"
}

variable "vpc-dataplane-cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block assigned to the dataplane VPC"
}

variable "dataplane-subnet-a-cidr" {
  type        = string
  default     = "10.0.1.0/24"
  description = "CIDR block assigned to the subnet aws-vpc-dataplane-subnet-a"
}

variable "dataplane-subnet-b-cidr" {
  type        = string
  default     = "10.0.2.0/24"
  description = "CIDR block assigned to the subnet aws-vpc-dataplane-subnet-b"
}

variable "dataplane-subnet-c-cidr" {
  type        = string
  default     = "10.0.3.0/24"
  description = "CIDR block assigned to the subnet aws-vpc-dataplane-subnet-c"
}

variable "dataplane_template_name" {
  type = string
  default = "dataplane-node-template"
  description = "Name of the dataplane worker node template"
}

variable "dataplane_instance_type" {
  type = string
  default = "t2.micro" # Restricted to t2.micro
  description = "Instance type that will be used to deploy the EC2 instances of the Autoscaling group"
}

data "aws_ssm_parameter" "node_ami" {
  name = "/aws/service/eks/optimized-ami/1.31/amazon-linux-2/recommended/image_id" # Maps to an EKS ready ami with bootstrap.sh and dockerd installed
}

variable "dataplane_public_key" {
  type = string
  description = "Public key for the dataplane key pair"
  sensitive = true
}