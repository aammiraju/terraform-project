resource "aws_subnet" "public_subnet" {
    vpc_id                      = aws_vpc.main_vpc.id
    cidr_block                  = "10.10.1.0/24"
    availability_zone           = "us-east-1a"
    map_public_ip_on_launch     = true
    tags = {
        Name = "Public-Subnet-TF"
    }
}

resource "aws_subnet" "private_subnet" {
    vpc_id                      = aws_vpc.main_vpc.id
    cidr_block                  = "10.10.2.0/24"
    availability_zone           = "us-east-1a"
    tags = {
        Name = "Private-Subnet-TF"
    }
}