# AWS Service Deep-Dive: IAM (Identity & Access Management)

**Student Name:** Jatin (24BCS10118)  
**Session:** 18 - AWS Services  

---

## 📌 1. What is IAM?
**AWS Identity and Access Management (IAM)** is a core web service that enables you to securely control access to AWS compute, storage, database, and network resources. IAM is a global service with zero latency and no charge.

---

## 📌 2. Core IAM Entities & Concepts

| Entity | Definition & Characteristics |
| :--- | :--- |
| **IAM User** | An identity representing an individual human or service account with long-term credentials (password, Access Key ID / Secret Key). |
| **IAM Group** | A collection of IAM users used to attach permissions to multiple users simultaneously. |
| **IAM Role** | An identity with specific permissions that is assumed temporarily by trusted entities (e.g. EC2 instances, Lambda, GitHub Actions via OIDC). |
| **IAM Policy** | A JSON document explicitly defining permissions (`Allow` / `Deny`) across Actions, Resources, and Conditions. |

---

## 📌 3. Policy Structure & Principle of Least Privilege

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowS3ReadOnly",
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::devops-hero-bucket",
        "arn:aws:s3:::devops-hero-bucket/*"
      ]
    }
  ]
}
```

* **Principle of Least Privilege:** Users/Services should only be granted the minimum necessary permissions required to perform their specific job tasks.
* **IAM Best Practices:**
  1. Lock down the AWS Root Account and enable Multi-Factor Authentication (MFA).
  2. Use IAM Roles for applications running on EC2 / EKS rather than hardcoding static access keys.
  3. Enforce strong password rotation policies.
  4. Regularly audit credentials using IAM Access Analyzer and credential reports.
