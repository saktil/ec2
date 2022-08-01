resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {

    yor_trace = "9d4d49bd-1775-4656-a25d-b91090803376"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2a"

  tags = {

    git_commit           = "781e74672b7cc4ef66538d8de3d6466f6c943d45"
    git_file             = "main.tf"
    git_last_modified_at = "2022-07-25 02:22:17"
    git_last_modified_by = "leosaragih001@gmil.com"
    git_modifiers        = "leosaragih001"
    git_org              = "saktil"
    git_repo             = "ec2"
    yor_trace            = "19611da7-8af4-4320-87ee-4360b1dc9d9c"
  }
}

resource "aws_network_interface" "foo" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {

    git_commit           = "781e74672b7cc4ef66538d8de3d6466f6c943d45"
    git_file             = "main.tf"
    git_last_modified_at = "2022-07-25 02:22:17"
    git_last_modified_by = "leosaragih001@gmil.com"
    git_modifiers        = "leosaragih001"
    git_org              = "saktil"
    git_repo             = "ec2"
    yor_trace            = "414e4243-528a-45dd-99e6-35faef745810"
  }
}

resource "aws_instance" "foo" {
  ami           = "ami-0d70546e43a941d70" # us-west-2
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.foo.id
    device_index         = 0
  }
  tags = {

    git_commit           = "73f19553827031038c14131855be06b1a50c1265"
    git_file             = "main.tf"
    git_last_modified_at = "2022-07-25 08:03:31"
    git_last_modified_by = "leosaragih001@gmil.com"
    git_modifiers        = "leosaragih001"
    git_org              = "saktil"
    git_repo             = "ec2"
    yor_trace            = "0170ccc8-a05f-427e-b1c5-c27ff50062ad"
  }

}

