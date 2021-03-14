# resource "aws_instance" "web-10" {
#     ami = "ami-042e8287309f5df03"
#     instance_type = "t2.micro"
#     key_name = "LaptopKey"
#     subnet_id = "subnet-0e33410dd8704a9de"
#     vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
#     associate_public_ip_address = true	
#     tags = {
#         Name = "Server-10"
#     }
# }