data "aws_ami" "centos" {
    most_recent = true
    owners = ["aws-marketplace"]
    filter {
        name   = "name"
        values = ["CentOS Linux 7 x86_64 HVM EBS ENA 1901_01*"]
    }
    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }
    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}

resource "aws_instance" "default" {
    ami                         = data.aws_ami.centos.id
    instance_type               = var.instance_type
    ebs_optimized               = true
    key_name                    = var.default_key
    associate_public_ip_address = var.publicly_accessible
    tags = merge(
            var.tags, 
            {
                "Name" = format("%s.%s", var.name, var.aws_region),
            })
}
