resource "aws_instance" "wordpress" { 
  ami             = "ami-4bf3d731" #centos
  instance_type   = "t2.micro"
  associate_public_ip_address = "true"
  key_name = aws_key_pair.key_resource.key_name
  security_groups = ["sg"] #refer only by its name not resource name
  #user_data = file("userdata_file")

provisioner "local-exec" { #it'll download locally 
    command = "echo ${aws_instance.wordpress.private_ip} >> private_ips.txt"
}


}
