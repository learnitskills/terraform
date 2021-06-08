resource "aws_eip" "elip" {
  vpc      = true
}

resource "aws_s3_bucket" "buck" {
  bucket = "rajat9828"
 
  tags = {
    Name        = "rajat2091"
   
  }
}

