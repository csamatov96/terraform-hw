resource "aws_instance" "wordpress" { 
  ami             = "ami-00068cd7555f543d5" #
  instance_type   = "t2.micro"
  associate_public_ip_address = "true"
  key_name = aws_key_pair.key_resource.key_name
  security_groups = ["sg"] #refer only by its name not resource name
  user_data = file("userdata_file")

provisioner "local-exec" { #it'll download locally 
    command = "wget https://wordpress.org/latest.tar.gz"
}


}
