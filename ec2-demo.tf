resource "aws_instance" "web" {
  ami  = "ami-04893cdb768d0f9ee"
  instance_type = "t2.micro"
  subnet_id     = "subnet-02e70ebeb32953095"
  key_name      = "2marchkey"
  tags = {
    Name = "Terraform_26marchDemo"
    quality = "cerated by user"
  }
  vpc_security_group_ids = [aws_security_group.allow_http.id]
  user_data              = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd.service
              systemctl enable httpd.service
              echo "Welcome to Terraform Demo!!!, I am $(hostname -f) hosted by Terraform" > /var/www/html/index.html
              EOF
}
