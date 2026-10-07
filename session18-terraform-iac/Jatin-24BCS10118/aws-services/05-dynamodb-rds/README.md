# AWS Database Services: DynamoDB vs Amazon RDS

**Student Name:** Jatin (24BCS10118)  
**Session:** 18 - AWS Services  

---

## 📌 1. Comparison Matrix: DynamoDB vs RDS

| Parameter | Amazon DynamoDB | Amazon RDS |
| :--- | :--- | :--- |
| **Model Type** | Fully Managed NoSQL (Key-Value & Document). | Managed Relational Database (SQL). |
| **Supported Engines** | Proprietary DynamoDB Engine. | PostgreSQL, MySQL, MariaDB, Oracle, SQL Server. |
| **Data Schema** | Dynamic, schemaless. | Rigid, tabular relational schema. |
| **Scaling** | Seamless, instantaneous auto-scaling to millions of requests/sec with single-digit millisecond latency. | Vertical compute scaling (scale-up instance type) + Read Replicas (scale-out reads). |
| **Partition Key / Keys** | Uses **Partition Key (PK)** + optional **Sort Key (SK)**. | Uses Primary Keys, Foreign Keys, Unique constraints. |
| **High Availability** | Multi-AZ replication enabled by default automatically. | Optional **Multi-AZ synchronous replication** with automatic failover. |
| **Best For** | High-velocity IoT data, gaming leaderboards, real-time caching, mobile backend sessions. | Complex JOIN queries, transactional ERP/CRM systems, ACID compliance workflows. |

---

## 📌 2. RDS High Availability & Read Scaling
* **Multi-AZ Deployments:** Creates a synchronous standby replica in a distinct Availability Zone. In case of primary failure, automated DNS failover switches traffic to the standby with zero data loss.
* **Read Replicas:** Up to 15 asynchronous read-only instances deployed in same or different regions to offload heavy read queries from the primary master database.
