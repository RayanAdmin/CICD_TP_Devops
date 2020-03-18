variable "subnet_ids" {
    description = "The list of subnet id"
}

variable "cluster_size" {
    description "The number of instance you want"
    default = 1
}

variable "instance_type" {
    description = "The type of instance you want"
    default = "t2.micro"
}

variable "ami_id" {
    description = "The AMI to use on these instances"
}
