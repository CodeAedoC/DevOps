# CoreDNS in Kubernetes: Architecture, Discovery & Troubleshooting

**Student Name:** Jatin (24BCS10118)  
**Session:** 11 - Kubernetes Networking & Services  

---

## 📌 1. What is CoreDNS?
**CoreDNS** is a flexible, extensible, and CNCF-graduated DNS server that serves as the default in-cluster DNS service for Kubernetes (replacing kube-dns since v1.13). It runs as a Deployment (typically 2 replicas) in the `kube-system` namespace.

---

## 📌 2. Why Kubernetes Uses CoreDNS
* **Automated Service Discovery:** Automatically watches Kubernetes API resources (Services, Endpoints, Pods) and updates in-memory DNS records dynamically.
* **Plugin Architecture:** CoreDNS operates as a pipeline of plugins (e.g. `kubernetes`, `forward`, `cache`, `errors`, `health`, `prometheus`).
* **Zero Downtime Updates:** High performance and minimal memory footprint.

---

## 📌 3. How DNS Resolution Works in Kubernetes

1. A Pod attempts to connect to `backend-service`.
2. The Pod's `/etc/resolv.conf` is populated by kubelet:
   ```text
   nameserver 10.96.0.10
   search default.svc.cluster.local svc.cluster.local cluster.local
   options ndots:5
   ```
3. The resolver sends a query for `backend-service.default.svc.cluster.local` to CoreDNS at `10.96.0.10`.
4. CoreDNS queries its Kubernetes plugin, finds the Service's ClusterIP (`10.104.142.90`), and returns the DNS response.
5. External domain queries (e.g. `google.com`) are forwarded to the host's upstream DNS via the `forward . /etc/resolv.conf` plugin.

---

## 📌 4. CoreDNS Configuration (`Corefile`)
The configuration is stored in a ConfigMap named `coredns` in `kube-system`:
```text
.:53 {
    errors
    health {
       lameduck 5s
    }
    ready
    kubernetes cluster.local in-addr.arpa ip6.arpa {
       pods insecure
       fallthrough in-addr.arpa ip6.arpa
       ttl 30
    }
    prometheus :9153
    forward . /etc/resolv.conf
    cache 30
    loop
    reload
    loadbalance
}
```

---

## 📌 5. Troubleshooting Kubernetes DNS Issues

### Diagnostic Step 1: Deploy a DNS Utility Pod
```bash
kubectl run dnsutils --image=tutum/dnsutils -- sleep infinity
```

### Diagnostic Step 2: Query CoreDNS and In-Cluster Services
```bash
kubectl exec -it dnsutils -- nslookup service-clusterip
```
**Output:**
```text
Server:		10.96.0.10
Address:	10.96.0.10#53

Name:	service-clusterip.default.svc.cluster.local
Address: 10.104.142.90
```

### Diagnostic Step 3: Inspect CoreDNS Logs
```bash
kubectl logs -n kube-system -l k8s-app=kube-dns
```
