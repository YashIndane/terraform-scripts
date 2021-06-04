provider "aws"{

  region = "ap-south-1"
  profile=""

}

resource "aws_dynamodb_table" "basic-dynamodb-table"{

 name = "tfstate-lock-table"

 read_capacity = 5
 write_capacity = 5
 hash_key = "LockID"

 attribute{
   name = "LockID"
   type = "S"
  }
}



terraform {
  backend "s3" {
    bucket = "<bucket-name>"
    key    = "mystate.tfstate"
    region = "ap-south-1"
    profile = ""
    
    dynamodb_table = "tfstate-lock-table"
  
  }
}


resource "aws_instance" "os34"{

 ami = "ami-0de1d9ec99cd6630c"
 instance_type = "t2.small"
 tags = {
     Name = "hadoop-os-20"

   }
}
