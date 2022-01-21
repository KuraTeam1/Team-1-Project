provider "aws" {
  region     = "${var.region}"
  access_key = "AKIAQQU53XAEMF2MR26R"
  secret_key = "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"
}
resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = "myKey"       # Create "myKey" to AWS!!
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" { # Create "myKey.pem" to your computer!!
    command = "echo '${tls_private_key.pk.private_key_pem}' > ./kurakey.pem"
  }
}
