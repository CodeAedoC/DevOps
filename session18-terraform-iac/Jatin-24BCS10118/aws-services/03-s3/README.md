# AWS Service Deep-Dive: S3 (Simple Storage Service)

**Student Name:** Jatin (24BCS10118)  
**Session:** 18 - AWS Services  

---

## 📌 1. What is Amazon S3?
**Amazon Simple Storage Service (Amazon S3)** is an object storage service offering industry-leading scalability, data availability, security, and performance with **99.999999999% (11 9's)** of durability.

---

## 📌 2. Core Concepts
* **Buckets:** Globally unique top-level containers for storing objects.
* **Objects:** Fundamental entities stored in S3, consisting of data, key (name), and metadata (max object size: 5TB).
* **Storage Tiers:**
  * `S3 Standard`: High frequency access, low latency.
  * `S3 Intelligent-Tiering`: Automatic cost savings by moving objects between access tiers.
  * `S3 Standard-IA / One Zone-IA`: Infrequent access with lower storage fees.
  * `S3 Glacier Flexible / Deep Archive`: Long-term archive with retrieval times from minutes to 12 hours.
* **Versioning:** Protects against accidental overwrites and deletions by retaining historical object iterations.
* **Lifecycle Rules:** Automated policies to transition objects to cheaper tiers or delete them after $N$ days.
* **Encryption:** SSE-S3 (AES-256 managed keys), SSE-KMS (Customer Master Keys), SSE-C (Customer-provided keys).
* **Bucket Policies:** Resource-based IAM JSON policies attached directly to the S3 bucket to control public access and enforce TLS/SSL.
