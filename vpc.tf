resource "aws_vpc" "main_vpc" {
    cidr_block              = "10.10.0.0/16"
    enable_dns_support      = true
    enable_dns_hostnames    = true
    instance_tenancy        = "default"
    tags = {
        Name = "MAIN-TF"
    }
}
resource "aws_security_group" "allow_ssh" {
    name                    = "allow_ssh"
    description             = "Allow ssh inbound traffic / Allow all outbound traffic"
    vpc_id                  = aws_vpc.main_vpc.id
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "Security-Group-TF"
    }
}
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main_vpc.id
    tags = {
        Name = "IGW-TF"
    }
}
resource "aws_eip" "eip" {
    vpc = true
    tags = {
        Name = "EIP-TF"
    }
}
resource "aws_nat_gateway" "ngw" {
    allocation_id   = aws_eip.eip.id
    subnet_id       = aws_subnet.public_subnet.id
    tags = {
        Name = "NAT-TF"
    }
}