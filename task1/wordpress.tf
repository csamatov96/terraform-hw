resource "aws_instance" "wordpress" { 
  ami             = var.ami #
  instance_type   = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  key_name = aws_key_pair.key_resource.key_name
  security_groups = ["sg"] #refer only by its name not resource name
  user_data = file("userdata_file.sh")

  #terraform side 
  provisioner "local-exec" { 
    command = "wget https://wordpress.org/latest.zip"
  }
  #move from local to remote 
  provisioner "file" {
    source      = "/root/terraform-hw/latest.zip"
    destination = "/var/www/latest.zip"

    connection  {
            host = "${self.public_ip}" 
            type = "ssh" 
            user = "${var.user}" 
            private_key = "${file(var.ssh_key_location)}" #use that key, whenever it creates an instance 
    }
  }
  #do tasks on remote 
  provisioner "remote-exec" {
    connection {
      host        = "${self.public_ip}"
      type        = "ssh"
      user        = "${var.user}"
      private_key = "${file(var.ssh_key_location)}"
    }

    inline = ["sudo cd /var/www/",
              "sudo unzip latest.zip",
              "sudo rsync -avP wordpress/ /var/www/html/",
              "sudo mkdir /var/www/html/wp-content/uploads",
              "sudo chown -R apache:apache /var/www/html/*"
              
    
    ]
  }


}
