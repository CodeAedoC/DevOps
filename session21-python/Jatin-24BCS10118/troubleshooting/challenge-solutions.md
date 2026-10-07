# Final Troubleshooting Challenge Solutions

**Student Name:** Jatin (24BCS10118)  
**Session:** 21 - Capstone Project  

---

## 🛠️ Scenario 1: CORS & Ingress 404 Route Mismatch
* **Problem:** Frontend client cannot reach `/api/v1/info` and throws CORS / 404 error.
* **Investigation:** Inspected Ingress routes (`kubectl describe ingress capstone-ingress`). Found route was `/api/` but backend expected `/api/v1/info` without strip prefix.
* **Root Cause:** Ingress rewrite-target was stripping the `/api/` path component.
* **Solution:** Configured Flask CORS plugin (`CORS(app)`) and updated Ingress annotations to preserve URI path parameters.
* **Verification:** `curl http://capstone.local/api/v1/info` returns HTTP 200 with JSON payload.

---

## 🛠️ Scenario 2: Memory Limit OOMKilled Error
* **Problem:** Backend Pod repeatedly crashed with `OOMKilled` (Exit Code 137).
* **Investigation:** `kubectl describe pod backend-deployment-xxxx` revealed: `Last State: Terminated - Reason: OOMKilled`.
* **Root Cause:** Memory limit was set to `64Mi`, which was insufficient for Python runtime + Gunicorn worker forks.
* **Solution:** Raised memory requests to `128Mi` and limits to `256Mi`.
* **Verification:** Pods stabilized at 0 restarts and status `Running (1/1)`.
