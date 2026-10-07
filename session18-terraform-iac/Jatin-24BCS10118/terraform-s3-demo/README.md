# Terraform S3 Bucket Provisioning Workflow

**Student Name:** Jatin (24BCS10118)  
**Session:** 18 - Infrastructure as Code (IaC)  

---

## 🛠️ Step-by-Step Terraform Lifecycle Execution

### 1. `terraform init`
Initializes working directory, downloads AWS provider plugins.
```bash
terraform init
```
**Output:**
```text
Initializing the backend...
Initializing provider plugins...
- Finding hashicorp/aws versions matching "~> 5.0"...
- Installing hashicorp/aws v5.44.0...
- Installed hashicorp/aws v5.44.0 (signed by HashiCorp)
Terraform has been successfully initialized!
```

### 2. `terraform fmt` & `terraform validate`
```bash
terraform fmt -check
terraform validate
```
**Output:**
```text
Success! The configuration is valid.
```

### 3. `terraform plan`
```bash
terraform plan -out=tfplan
```
**Output:**
```text
Terraform will perform the following actions:
  # aws_s3_bucket.demo_bucket will be created
  + resource "aws_s3_bucket" "demo_bucket" {
      + arn                         = (known after apply)
      + bucket                      = (known after apply)
      + id                          = (known after apply)
      + region                      = (known after apply)
      + tags                        = {
          + "Environment" = "development"
          + "ManagedBy"   = "Terraform"
          + "Owner"       = "Jatin-24BCS10118"
        }
    }
Plan: 3 to add, 0 to change, 0 to destroy.
```

### 4. `terraform apply`
```bash
terraform apply tfplan
```
**Output:**
```text
aws_s3_bucket.demo_bucket: Creating...
aws_s3_bucket.demo_bucket: Creation complete after 3s [id=devops-hero-jatin-24bcs10118-8f12a9bc]
aws_s3_bucket_versioning.versioning: Creating...
aws_s3_bucket_server_side_encryption_configuration.encryption: Creating...
Apply complete! Resources: 3 added, 0 changed, 0 destroyed.

Outputs:
s3_bucket_arn = "arn:aws:s3:::devops-hero-jatin-24bcs10118-8f12a9bc"
s3_bucket_id = "devops-hero-jatin-24bcs10118-8f12a9bc"
s3_bucket_region = "us-east-1"
```

### 5. `terraform show` & `terraform output`
```bash
terraform output s3_bucket_id
```
**Output:**
```text
"devops-hero-jatin-24bcs10118-8f12a9bc"
```

### 6. `terraform destroy`
```bash
terraform destroy -auto-approve
```
**Output:**
```text
aws_s3_bucket.demo_bucket: Destroying... [id=devops-hero-jatin-24bcs10118-8f12a9bc]
Destroy complete! Resources: 3 destroyed.
```
