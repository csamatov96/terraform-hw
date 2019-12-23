resource "aws_instance" "wordpress" { 
  ami             = var.ami #
  instance_type   = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  key_name = aws_key_pair.key_resource.key_name
  security_groups = ["sg"] #refer only by its name not resource name
  user_data = file("userdata_file")

  #terraform side 
  provisioner "local-exec" { 
    command = "wget https://wordpress.org/latest.zip"
  }
  
  #provisioner "local-exec" { # 
  #  command = "sudo yum install unzip -y"
  #}
  


  provisioner "file" {
    source      = "wordpress"
    destination = "/tmp"

    connection  {
            host = "${self.public_ip}" 
            type = "ssh" 
            user = var.user 
            private_key = file("~/.ssh/id_rsa") #use that key, whenever it creates an instance 
    }
  }

  inline = [ 
      "sudo cd /tmp ",
      "sudo yum install httpd -y ", 
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd", 

] 

}
