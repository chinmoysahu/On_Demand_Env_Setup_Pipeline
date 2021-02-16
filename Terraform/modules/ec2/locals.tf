locals {

  vpc_name = terraform.workspace == "dev" ? "JavaHomeVpc-Dev" : "JavaHomeVpc-Def"

  az_names = data.aws_availability_zones.azs.names

  pub_sub_ids = aws_subnet.public.*.id

  pri_sub_ids = aws_subnet.private.*.id

  num_of_az = length(data.aws_availability_zones.azs.names)
}
