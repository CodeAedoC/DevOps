# Session 06 & 07: Docker Containerization & Multi-Stage Builds

**Student Name:** Jatin  
**Enrollment Number:** 24BCS10118  
**Course:** DevOps Engineering  

---

## 📌 Part 1: Hello World Multi-Stack Web Applications

All six applications run on designated ports. Each has its own application code, `Dockerfile`, and verification logs.

| Folder | Application Stack | Host Port |
| :--- | :--- | :--- |
| `nodejs-app` | Node.js + Express | 3000 |
| `python-app` | Python 3.11 + Flask | 5000 |
| `java-app` | Java 17 OpenJDK Server | 8082 |
| `Apache-app` | Apache HTTPD 2.4 | 8083 |
| `React-app` | React 18 Web App + Nginx | 8084 |
| `nginx-app` | Nginx Alpine | 8085 |
| `multistage-app` | Go Multi-Stage Minimal Container | 8080 |

- 📖 [Docker Build & Run Execution Evidence Log](evidence/session6-7.log)

---

## 📷 Screenshots & Evidences

### 1. Node.js Application
![Node.js Output](screenshots/nodejs_output.png)

### 2. Python Flask Application
![Python Output](screenshots/python_output.png)

### 3. Java Application
![Java Output](screenshots/java_output.png)

### 4. Apache Web Server
![Apache Output](screenshots/apache_output.png)

### 5. React Application
![React Output](screenshots/react_output.png)

### 6. Nginx Web Server
![Nginx Output](screenshots/nginx_output.png)

### 7. Multi-Stage Application (Port 8080)
![Multi-Stage App](screenshots/multistage_running.png)

### 8. Docker PS Status for Port 8080
![Docker PS](screenshots/docker_ps_8080.png)
