resource "aws_instance" "bastion" {
 ami           = "ami-0557a15b87f6559cf"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  subnet_id = aws_subnet.pub-sub-1.id
  vpc_security_group_ids = [aws_security_group.pub-secgroup.id]
  key_name = "iti"
  tags = {
    Name = "bastion"
  }
  
}