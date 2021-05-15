
resource "aws_instance" "web" {
  #   count                  = 4
  ami                    = var.ami[var.region]
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.ec2.id]
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = var.key_name
  user_data              = <<-EOF
                 #!/bin/bash
                  sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
                  sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
                  sudo yum upgrade
                  sudo yum install jenkins java-1.8.0-openjdk-devel -y
                  sudo systemctl daemon-reload
                  sudo systemctl start jenkins
                  sudo systemctl enable jenkins
                  sudo amazon-linux-extras install docker -y
                  sudo yum install docker -y
                  sudo service docker start
                  sudo usermod -a -G docker ec2-user
                  sudo usermod -a -G docker jenkins
                  sudo usermod -a -G wheel jenkins
                  sudo chmod 666 /var/run/docker.sock
                  sudo echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
                  sudo yum install git -y
                  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
                  unzip awscliv2.zip
                  sudo ./aws/install
                  sudo wget https://releases.hashicorp.com/terraform/0.15.3/terraform_0.15.3_linux_amd64.zip
                  sudo unzip terraform_0.15.3_linux_amd64.zip
                  sudo mv terraform /usr/bin/
              EOF

  root_block_device {
    volume_size           = 16
    volume_type           = "gp2"
    delete_on_termination = true
    tags = {
      Name = "Root Volume"
    }
  }

  tags = {
    Name = "${var.prefix}-My_ec2"
  }

}

# resource "aws_ebs_volume" "extra_ebs_volume" {

#   availability_zone = "us-east-1e"
#   size              = 20
#   type              = "gp2"

#   tags = {
#     Name = "extra ebs volume"
#   }

# }

# resource "aws_volume_attachment" "ebs_attachment" {
#   device_name = "/dev/sdh" #"/dev/xvdh"
#   volume_id   = aws_ebs_volume.extra_ebs_volume.id
#   instance_id = aws_instance.web.id
# }
