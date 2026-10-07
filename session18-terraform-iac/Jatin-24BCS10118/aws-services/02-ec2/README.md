# AWS Service Deep-Dive: EC2 (Elastic Compute Cloud)

**Student Name:** Jatin (24BCS10118)  
**Session:** 18 - AWS Services  

---

## 📌 1. What is EC2?
**Amazon Elastic Compute Cloud (Amazon EC2)** provides scalable on-demand computing capacity in the AWS cloud, allowing rapid provisioning of virtual servers (instances) with custom CPU, memory, storage, and networking.

---

## 📌 2. Key Components & Concepts

* **AMI (Amazon Machine Image):** Pre-configured template containing OS, application server, and initial applications (e.g. Ubuntu 22.04 LTS, Amazon Linux 2023).
* **Instance Types:** Optimized for varying workloads:
  * `t3/t4g` (General purpose / burstable)
  * `c6g/c7i` (Compute optimized)
  * `r6g/r7i` (Memory optimized)
  * `g5/p4d` (GPU / AI / Machine Learning)
* **Key Pairs:** Uses asymmetric public-key cryptography (RSA/ED25519) to securely SSH into Linux instances.
* **Security Groups:** Stateful virtual firewalls controlling inbound and outbound traffic at the instance level.
* **EBS (Elastic Block Store):** High-performance network-attached block storage volumes attached to EC2 instances.
* **Public vs Private IP:**
  * Public IP / Elastic IP (EIP): Internet-routable address.
  * Private IP: Non-routable internal VPC address retained for the lifecycle of the instance.
* **Instance Lifecycle:** `Pending` -> `Running` -> `Stopping` -> `Stopped` -> `Shutting-Down` -> `Terminated`.
