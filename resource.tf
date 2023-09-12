resource "aws_instance" "my" {
    for_each = var.ins
    ami=var.ami_id
    instance_type = each.value
    security_groups = [aws_security_group.group.name]

    tags = {
      Name=each.key
    }
  
}

resource "aws_route53_record" "www" {
    for_each = aws_instance.my
    zone_id = var.zone
    name="${each.key}.${var.domain}"
    type="A"
    ttl = 1
    records = [each.key =="web" ? each.value.public_ip : each.value.private_ip ]
  
}

resource "aws_security_group" "group" {
    name="mohan group"
    description = "this is is maintian by mohan him slef"
    dynamic ingress {
        for_each = var.ingress
        content {
        from_port=ingress.value.from_port
        to_port=ingress.value.to_port
        protocol=ingress.value.protocol
        description=ingress.value.description
        cidr_blocks=ingress.value.cidr_blocks
        }
        
    }
  
}

