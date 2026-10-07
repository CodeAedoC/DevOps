# Kubernetes Fully Qualified Domain Names (FQDN)

**Student Name:** Jatin (24BCS10118)  
**Session:** 11 - Kubernetes Networking & Services  

---

## 📌 1. What is an FQDN?
A **Fully Qualified Domain Name (FQDN)** is an unambiguous, complete domain name that specifies its exact position in the absolute hierarchy of the Domain Name System (DNS).

---

## 📌 2. Kubernetes Service DNS & Naming Convention

Every Service created inside a Kubernetes cluster automatically receives a deterministic DNS A/AAAA record formatted as:

$$\mathbf{<service-name>.<namespace>.svc.cluster.local}$$

### Component Breakdown:
* `<service-name>`: Name of the Service resource (e.g. `service-clusterip`).
* `<namespace>`: Kubernetes namespace where the service resides (e.g. `default`, `prod`).
* `svc`: Denotes the resource type is a Service.
* `cluster.local`: Default cluster DNS domain suffix.

---

## 📌 3. Pod-to-Service Communication Scenarios

### Case 1: Same Namespace Communication
Pods residing in the **same namespace** can resolve the service using just the short service name:
```bash
curl http://service-clusterip/
```

### Case 2: Cross-Namespace Communication
Pods communicating across **different namespaces** (e.g., from `frontend` namespace to `backend` namespace) must specify the namespace:
```bash
curl http://service-clusterip.backend/
# Or using full FQDN:
curl http://service-clusterip.backend.svc.cluster.local:80/
```

### Case 3: Headless Service & Individual Pod FQDNs
For StatefulSets connected to a Headless Service (`clusterIP: None`), individual pods receive deterministic FQDNs:
$$\mathbf{<pod-name>.<service-name>.<namespace>.svc.cluster.local}$$
*Example:* `database-0.db-service.prod.svc.cluster.local`
