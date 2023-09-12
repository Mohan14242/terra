variable "ins" {
    type=map
    default = {
        mongodb="t2.micro"
        cart="t2.micro"
        web="t2.micro"
        db="t2.micro"
    }
  
}

variable "ami_id" {
    type=string
    default = "ami-081609eef2e3cc958"
  
}

variable "zone" {
    default = "Z02751713ILATZT272QPK"
  
}

variable "domain" {
    default = "roboshop.com"
  
}

variable "ingress" {
    type=list
    default = [{
        from_port=80
        to_port=80
        protocol="tcp"
        description="allowing the public"
        cidr_blocks=["0.0.0.0/0"]

    },{
        from_port=443
        to_port=443
        description="allowing https"
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"]

    },{
        description="this is for ssh"
        from_port=22
        to_port=22
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"]
    }]
  
}