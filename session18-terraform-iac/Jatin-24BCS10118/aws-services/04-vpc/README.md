# AWS Service Deep-Dive: VPC (Virtual Private Cloud)

**Student Name:** Jatin (24BCS10118)  
**Session:** 18 - AWS Services  

---

## 📌 1. What is Amazon VPC?
**Amazon Virtual Private Cloud (Amazon VPC)** lets you provision a logically isolated section of the AWS Cloud where you can launch AWS resources in a virtual network that you define.

---

## 📌 2. Key VPC Networking Building Blocks

```text
[ AWS Region ]
  └── [ VPC (10.0.0.0/16) ]
        ├── [ Internet Gateway (IGW) ]
        ├── [ Public Subnet (10.0.1.0/24) ] ──> [ Route to IGW (0.0.0.0/0) ]
        │     └── [ NAT Gateway ]
        └── [ Private Subnet (10.0.2.0/24) ] ──> [ Route to NAT Gateway ]
              └── [ Private Database / Backend ]
```

* **CIDR Block:** IPv4 address range allocation (e.g. `10.0.0.0/16` providing 65,536 private IPs).
* **Subnets:** Segments of a VPC's IP range tied to a specific Availability Zone (AZ).
  * **Public Subnet:** Direct route to an Internet Gateway (`0.0.0.0/0 -> igw-xxxx`).
  * **Private Subnet:** No direct route to IGW; routes outbound internet traffic through a **NAT Gateway**.
* **Internet Gateway (IGW):** Horizontally scaled, redundant VPC component allowing bidirectional internet communication.
* **NAT Gateway:** Network Address Translation service allowing outbound internet access for private subnet resources while blocking inbound connections.
* **Security Groups vs Network ACLs (NACLs):**
  * *Security Group:* Stateful virtual firewall operating at the **Instance/ENI level** (Default: Deny all inbound, Allow all outbound).
  * *NACL:* Stateless subnet-level firewall evaluating numbered rules sequentially (Default: Allow all).
