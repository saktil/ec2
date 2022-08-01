resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {

    yor_trace = "0a5317fc-1cfd-4542-b63c-2aa78ac22224"
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
    yor_trace            = "e025ae82-5c1d-4a14-8fe3-8081ce3234f3"
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
    yor_trace            = "710ac421-e18d-4579-9af5-f00f6bd842a9"
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
    yor_trace            = "6e0905d7-1ca5-4d5a-9552-85e879e9e715"
  }

}

