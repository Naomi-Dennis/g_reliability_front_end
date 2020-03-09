provider "aws" {
	region = "us-east-1"
}

resource "aws_s3_bucket" "static_site" {
 	bucket = "gapp-front-end"
}

resource "aws_s3_bucket" "tf_states" {
	bucket = "gapp-front-end-tf-states"
}

resource "aws_s3_bucket_object" "index" {
	source = "../index.html"
	key = "index.html"
	bucket = aws_s3_bucket.static_site.id
	content_type = "text/html"
}

resource "aws_s3_bucket_object" "last_tf_state" {
	source = "terraform.tfstate"
	key = "terraform.tfstate"
	bucket = aws_s3_bucket.tf_states.id
}



