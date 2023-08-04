#creating a s3 bucket 
#enter a unique bucket name here
resource "aws_s3_bucket" "project_s3" {
  bucket = "mrtfbucket1"
}

#attaching a bucket policy to give terraform permissions
#resource "aws_s3_bucket_policy" "bucket_policy" {
#  bucket = "mrtfbucket1"
#  policy = file("policy.json")
#}

#enabeling bucket versioning for recovery
#resource "aws_s3_bucket_versioning" "project_versioning" {
#  bucket = "mrtfbucket1"
#  versioning_configuration {
#    status = "Enabled"
#  }
#}

#setting the acl of the bucket to private
#resource "aws_s3_bucket_acl" "project_acl" {
#  bucket = "mrtfbucket1"
#  acl    = "private"
#}