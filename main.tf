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

data "aws_subnet" "selected" {
    filter {
        name   = "tag:Name"
        values = ["mandrill-tools PublicSubnetA"]
    }
}

resource "aws_instance" "default" {
    ami             = data.aws_ami.centos.id
    instance_type   = var.instance_type
    ebs_optimized   = true
    key_name        = var.default_key
    subnet_id       = data.aws_subnet.selected.id
    tags = merge(
            var.tags, 
            {
                "Name" = format("%s.%s", var.name, var.aws_region),
            })
}
