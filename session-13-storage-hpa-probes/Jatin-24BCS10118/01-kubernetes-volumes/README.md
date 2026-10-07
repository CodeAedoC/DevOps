# Deep Dive into Kubernetes Storage Architecture

**Student Name:** Jatin (24BCS10118)  
**Session:** 13 - Storage, HPA & Probes  

---

## 📌 1. Storage Abstractions in Kubernetes

| Storage Type | Lifecycle | Node Scope | Best Use Case |
| :--- | :--- | :--- | :--- |
| **`emptyDir`** | Ephemeral; tied directly to Pod lifecycle. Erased when Pod terminates. | Single Pod | Temporary scratch space, cache directories, inter-container shared buffer. |
| **`hostPath`** | Mounts a file/directory from the host Node filesystem into the Pod. | Single Node | Accessing Docker socket, system log collectors (`/var/log`). |
| **`PersistentVolume (PV)`** | Cluster-level storage resource provisioned statically by an Admin or dynamically via CSI. | Cluster-wide | Network storage (AWS EBS, NFS, Ceph, Azure Disk). |
| **`PersistentVolumeClaim (PVC)`** | A request for storage by a user/developer specifying size and access modes. | Namespace-bound | Consumed by Deployments / StatefulSets. |
| **`StorageClass (SC)`** | Defines storage tiers and dynamic provisioner parameters. | Cluster-wide | Automatic Just-In-Time PV volume provisioning. |

---

## 📌 2. Persistent Volume Access Modes
* **ReadWriteOnce (RWO):** Volume can be mounted as read-write by a single Node. (e.g. AWS EBS, GCP PD).
* **ReadOnlyMany (ROX):** Volume can be mounted read-only by many Nodes simultaneously.
* **ReadWriteMany (RWX):** Volume can be mounted as read-write by many Nodes simultaneously. (e.g. AWS EFS, NFS).
* **ReadWriteOncePod (RWOP):** Volume can be mounted as read-write by a single Pod across the entire cluster.

---

## 📌 3. Dynamic Provisioning Workflow
1. User creates a `PersistentVolumeClaim` referencing a `StorageClass` (or default SC).
2. The CSI Driver (Container Storage Interface) intercepts the claim and calls Cloud Provider APIs (e.g. `ec2:CreateVolume`).
3. Kubernetes automatically creates the `PersistentVolume` (PV) and binds it (`Status: Bound`) to the `PersistentVolumeClaim` (PVC).
4. When the Pod starts on a node, kubelet automatically attaches and formats the volume into the specified `mountPath`.
