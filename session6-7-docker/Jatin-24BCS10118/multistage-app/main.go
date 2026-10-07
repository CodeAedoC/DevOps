package main

import (
	"fmt"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	html := `<!DOCTYPE html>
<html>
<head><title>Docker Multi-Stage Demo</title></head>
<body style="font-family: Arial, sans-serif; background: #111827; color: white; text-align: center; padding: 50px;">
  <h1 style="color: #38bdf8;">Hello World from Docker multi-stage build</h1>
  <p>Student Name: <strong>Jatin</strong></p>
  <p>Enrollment Number: <strong>24BCS10118</strong></p>
  <p>Status: Running securely in an ultra-lean multi-stage container on Port 8080</p>
</body>
</html>`
	fmt.Fprintf(w, html)
}

func main() {
	http.HandleFunc("/", handler)
	fmt.Println("Server starting on port 8080...")
	if err := http.ListenAndServe(":8080", nil); err != nil {
		fmt.Printf("Error starting server: %s\n", err)
	}
}
