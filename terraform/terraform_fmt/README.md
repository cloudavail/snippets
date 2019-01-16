# Overview

This snippet serves to aid in the understanding of the `terraform fmt` command. The goals in this are to understand the output when:

- A file is properly formatted
- A file is not properly formatted

With the objective to understand:

- How to enable/disable modification of a file
- How to get return codes if a file is not properly formatted
- How to get textual previews of the _changes_ in a file
- How to get textual previews of the _changed_ file

# Properly Formatted File

## Return Code

```
cjohnson06:tf_format_passing cjohnson$ terraform fmt
cjohnson06:tf_format_passing cjohnson$ echo $?
0
```

# Improperly Formatted File

## Write False

In the example below an improperly formatted file is examined by `terraform fmt` with the option `terraform fmt -write=false` - this option disables destructive writes of the file.

```
cjohnson06:tf_format_failing cjohnson$ cat main.tf 
resource "aws_s3_bucket" "cloudavail_terraform_fmt_test" {
  bucket = "cloudavail-terraform-fmt-test"
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
cjohnson06:tf_format_failing cjohnson$ terraform fmt -write=false
main.tf
cjohnson06:tf_format_failing cjohnson$ cat main.tf 
resource "aws_s3_bucket" "cloudavail_terraform_fmt_test" {
  bucket = "cloudavail-terraform-fmt-test"
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
```

## Return Code

```
cjohnson06:tf_format_failing cjohnson$ terraform fmt
main.tf
cjohnson06:tf_format_failing cjohnson$ echo $?
0
```

## Check True

```
cjohnson06:tf_format_failing cjohnson$ terraform fmt -check=true
main.tf
cjohnson06:tf_format_failing cjohnson$ echo $?
3
```

## Diff True

```
cjohnson06:tf_format_failing cjohnson$ terraform fmt -check=true -diff=true
main.tf
diff a/main.tf b/main.tf
--- /var/folders/r6/szm_q8fs0nd00bsqs9f52_p00000gn/T/731763248	2019-01-15 21:54:19.000000000 -0800
+++ /var/folders/r6/szm_q8fs0nd00bsqs9f52_p00000gn/T/602572239	2019-01-15 21:54:19.000000000 -0800
@@ -1,6 +1,7 @@
 resource "aws_s3_bucket" "cloudavail_terraform_fmt_test" {
   bucket = "cloudavail-terraform-fmt-test"
   acl    = "private"
+
   server_side_encryption_configuration {
     rule {
       apply_server_side_encryption_by_default {
```
