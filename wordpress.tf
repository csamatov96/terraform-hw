resource "aws_instance" "wordpress" { 
  ami             = "ami-00068cd7555f543d5" #
  instance_type   = "t2.micro"
  associate_public_ip_address = "true"
  key_name = aws_key_pair.key_resource.key_name
  security_groups = ["sg"] #refer only by its name not resource name
  user_data = file("userdata_file")

  #terraform side 
  provisioner "local-exec" { 
    command = "wget https://wordpress.org/latest.zip"
  }
  provisioner "local-exec" { # 
    command = "sudo yum install unzip -y"
  }
  provisioner "local-exec" { # 
    command = "sudo unzip latest.zip" #/root/terraform-hw/wordpress
  }

  provisioner "file" { 
      source      = "/root/terraform-hw/FOLDER" 
      destination = "/tmp" 
      connection { 
         host        = "${self.public_ip}" 
         type        = "ssh" 
         user        = "${var.user}" 
         private_key = "${file(var.ssh_key_location)}"

      } 
 }
  



}
