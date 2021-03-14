resource "null_resource" "cluster" {
    count = "${var.env == "Prod" ? 3 : 1 }"
    provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
    connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = "${file("AWSB27.pem")}"
    #host     = "${aws_instance.web-1.*.public_ip}"
    host     = "${element(aws_instance.web-1.*.public_ip, count.index)}"
 }
}
# Remote-Exec Provisioner
    provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh",
      "sudo apt update -y",
      "sudo apt install -y cowsay unzip && rm -f terraform",
      "cowsay 'Welcome To DevOps Training.. Mooooooooo'",
      "wget https://releases.hashicorp.com/terraform/0.14.7/terraform_0.14.7_linux_amd64.zip",
      "unzip terraform_0.14.7_linux_amd64.zip && rm -f terraform_0.14.7_linux_amd64.zip && ./terraform version"
      ]
    connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = "${file("AWSB27.pem")}"
    host     = "${element(aws_instance.web-1.*.public_ip, count.index)}"
    }
    }

    # provisioner "local-exec" {
    #     command = "echo ${element(aws_instance.web-1.*.tags.Name, count.index)} >> public_ips.txt"
    # }
    provisioner "local-exec" {
        command = "echo ${element(aws_instance.web-1.*.public_ip, count.index)} >> public_ips.txt"
    }
    # provisioner "local-exec" {
    #     command = "echo ${element(aws_instance.web-1.*.tags.Name, count.index)} >> private_ips.txt"
    # }
    provisioner "local-exec" {
        command = "echo ${element(aws_instance.web-1.*.private_ip, count.index)} >> private_ips.txt"
    }
}