provider "aws" {
        region = "${var.aws_region}"
        shared_credentials_file = "/Users/jmorrison/.aws/credentials"
        profile = "terraform"
}

resource "aws_instance" "web" {
	ami = "${var.ami_id}"
	instance_type = "${var.aws_instance_type}"
	security_groups = ["${var.aws_security_groups}"]
	key_name = "${var.aws_key_name}"

	tags = {
		Name = "prod1"
	}

	lifecycle {
		create_before_destroy = true
	}
}
