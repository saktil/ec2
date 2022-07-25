resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {

    Schedule       = "seattle-office-hours"
    env            = "$${env:GITHUB_HEAD_REF}"
    team_ownership = "sre"
    yor_trace      = "3bac9b6b-bc1e-4002-a017-0d2e162a59d2"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2a"

  tags = {

    Schedule             = "seattle-office-hours"
    git_commit           = "781e74672b7cc4ef66538d8de3d6466f6c943d45"
    git_file             = "main.tf"
    git_last_modified_at = "2022-07-25 02:22:17"
    git_last_modified_by = "leosaragih001@gmil.com"
    git_modifiers        = "leosaragih001"
    git_org              = "saktil"
    git_repo             = "ec2"
    team_ownership       = "sre"
    yor_trace            = "89a8a89c-6280-4275-adf1-6a93132ace1a"
    env                  = "${env:GITHUB_HEAD_REF}"
  }
}

resource "aws_network_interface" "foo" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {

    Schedule             = "seattle-office-hours"
    git_commit           = "781e74672b7cc4ef66538d8de3d6466f6c943d45"
    git_file             = "main.tf"
    git_last_modified_at = "2022-07-25 02:22:17"
    git_last_modified_by = "leosaragih001@gmil.com"
    git_modifiers        = "leosaragih001"
    git_org              = "saktil"
    git_repo             = "ec2"
    team_ownership       = "sre"
    yor_trace            = "2f52e149-fde7-4b74-9bed-ea4e76783b02"
    env                  = "${env:GITHUB_HEAD_REF}"
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

    Schedule             = "seattle-office-hours"
    git_commit           = "73f19553827031038c14131855be06b1a50c1265"
    git_file             = "main.tf"
    git_last_modified_at = "2022-07-25 08:03:31"
    git_last_modified_by = "leosaragih001@gmil.com"
    git_modifiers        = "leosaragih001"
    git_org              = "saktil"
    git_repo             = "ec2"
    team_ownership       = "sre"
    yor_trace            = "2875ce7a-91c4-4d6f-9f76-52a9a13439dd"
    env                  = "$${env:GITHUB_HEAD_REF}"
  }

}

