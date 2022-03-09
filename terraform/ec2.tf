resource "aws_key_pair" "this" {
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCfrDq91MUrdd8KdL5AEom9ZRFSnLz/LrYtrONkbQhxg+7cS+QOL/19Vl30axlPYx0rn/onzaMVpTvgABN9ew+fGYsd4G/4Vg2cuGjpjUC6qgFEEpqybHbRgajnNLV5UbjmrRvFFAbYLtLh55F0KwaumAT0t01/Sj7UshNSEK3IudLbCRMLPD7Gga5gbN1f4WqYmrctPK8Zs/6JKDjm8pnSGO4t1GfxznHFuR4ZoDf2udpXcgvBgChP5O2d5aLT9Z++ZCpPw9r2YghWfvHV8n0zHYt2JMPYcE4qZ8sJToI9Hpz1p2U3kiVqJ9dsS0xSwbIkSLQ33g7KwNFSF9Odqz1wCYUgmCknGxvohd4TERD6SYl9W86ZfBGHp566Wn3t5Lq7YYie7Ep6zc7G2X0ZkV9V5El6ojY6McIaDmcW4R7mDWSegbGeNKBPqEjRVq4geq/l2aWW41vDJFa5EfL2L3mXLeF9ZYmM+uvnNN9jPQyxuKSnHtxkcNNrP936kxM4WFc= weston@Westons-MacBook-Pro-13"
  key_name   = "wgj"
}

resource "aws_security_group" "allow_ssh" {
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "this" {
  ami           = "ami-07747ec74364622ce"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.this.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
}
