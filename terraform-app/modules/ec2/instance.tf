resource "aws_instance" "web" {
  count          = "${var.ec2_count}"
  ami            = "${var.ami_id}"
  instance_type  = "${var.instance_type}"
  subnet_id      = "${var.subnet_id}"

  tags = {
    Name = "HelloWorld"
  }
}
// Folder named EC2 has two files (instance.tf and vars.tf)
// Instance.tf are key value pairs with different argurmnets defined by terraform aws EC2 instance resources docs  
// Variable files are things that changes with the resouces e.g. t2 micro upon depolyment.  
// Taggs are tagged to the resources on this needed. 