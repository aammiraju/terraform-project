resource "aws_instance" "public_ec2" {
    ami = "ami-047a51fa27710816e"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
    subnet_id = aws_subnet.public_subnet.id
    key_name = "AMMI_KEYPAIR"
    tags = {
        Name = "Public-Server1"
    }
}

resource "aws_instance" "private_ec2" {
    ami = "ami-047a51fa27710816e"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
    subnet_id = aws_subnet.private_subnet.id
    key_name = "AMMI_KEYPAIR"
    tags = {
        Name = "Private-Server1"
    }
}