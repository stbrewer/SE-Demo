/*
resource "aws_instance" "AWS_Prod_Instance_1" {
  ami = "ami-08a52ddb321b32a8c"
  instance_type          = "t2.micro"
  key_name               = "Kali_key_pair"
  monitoring             = true
  subnet_id              = aws_subnet.AWS_Spoke_1_Private_SN_A.id

  tags = {
    Name = "Prod_Instance"
    Terraform   = "true"
    Environment = "Production"
  }
}

resource "aws_instance" "AWS_Dev_Instance_1" {
  ami = "ami-08a52ddb321b32a8c"
  instance_type          = "t2.micro"
  key_name               = "Kali_key_pair"
  monitoring             = true
  subnet_id              = aws_subnet.AWS_Spoke_1_Private_SN_B.id

  tags = {
    Name = "Dev_Instance"
    Terraform   = "true"
    Environment = "Development"
  }
}

resource "aws_instance" "AWS_QA_Instance_1" {
  ami = "ami-08a52ddb321b32a8c"
  instance_type          = "t2.micro"
  key_name               = "Kali_key_pair"
  monitoring             = true
  subnet_id              = aws_subnet.AWS_Spoke_2_Private_SN_A.id

  tags = {
    Name = "QA_Instance"
    Terraform   = "true"
    Environment = "QA"
  }
}
*/