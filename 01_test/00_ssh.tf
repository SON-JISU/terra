resource "aws_key_pair" "sonjisu1-key" {
  key_name = "sonjisu1-key"
#  public_key = ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC3qzKR6CMm1TLMOkE3VVgmlCF/4RZhEMW9ivLZcRuOAyllPeO+P2XLPLVFJ/8anfTnlOdnQWQk+hjBeOwLMdR9qaaApOGtBJnXGLnQo2iNpK5xn+Rpob2OlccGMiip9e4e0SkITR4tA/gbJ7JwIjSq6f2Fo2/q0vn9htM5lHFwjcm2MUdYHWZkfdbXRAd9+24TKPbxQcdy9gcSL/8EAUSdl/bjb8Fx9Nvfb+O0970JjeS29KQHSuQowGbDEMGfhRn5e4ixLyZXBRIq732CMXTVppxOJy7b1cteQZmyVJlhHrrqF8G7wXIsAoJTmbw9FfUFUqWuyzUMODnv2o772e4CwBJvbY6tLBQhOU4rlHZ7TSJGtZhOHOxvHaGz4bE3LaBEpw+NGJ0F5PabzY/ZbU0/QRn1/dhumdtB7oB3LoBxidFzN71/wX2W8GYkEXou35i0wTxNfSZvBcQCVskiSc+j6sPfrdF9/pNj7CSu9AN64ySCq8sYprI8Ln/duVZYt2M=
  public_key = file("../../.ssh/sonjisu-key.pub")
}