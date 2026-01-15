![CI](https://github.com/Khebe-Dev/expense-sharing-api/actions/workflows/ci.yml/badge.svg)

# Expense Sharing API

A Java-based expense sharing application built with Javalin, exposing RESTful APIs and a web UI for managing shared expenses and payments.
The application is deployed on AWS EC2 and documented using Swagger (OpenAPI).

## Live Demo (AWS EC2)
- Web App: http://13.50.78.119:5050/
- Swagger UI: http://13.50.78.119:5050/swagger
- Health Check: http://13.50.78.119:5050/health


## Project Overview 
Expense Sharing APi is a Java-based RESTful backend that enables users to:
-Record shared expenses
-Request payments amongst users
-Track settlement and balances
-View expenses and payment history 
The application exposes REST endpoints, includes session handling, and is fully covered by automated unit and intergration tests. 

## CI
This project uses GitHub Actions to automatically run `mvn clean test` on every push and pull request to ensure build and test reliability.

## Tech Stack
- Java 17 
- Javalin (REST framework)
- Maven
- JUnit5
- Docker
- GitHub Actions (CI)
- Swagger (OpenAPI Documentation)
- AWS EC2
- Linux (systemd)

## Running locally
```bash
mvn clean test
mvn exec:java -D"exec.mainClass=weshare.server.WeShareServer"
```
The server starts on 

http://localhost:5050


## Health check 
Verify the server is running:

http://localhost:5050/health

Expected response:
```json
{"status":"UP"}
```

## Swagger API Docs 
```bash
Interactive API documentation avaiable at:

http://localhost:5050/swagger
```

## Key API Endpoints 
- GET /api/people - list users
- POST /api/people - create user
- GET /api/expenses - list expenses
- POST /api/expenses - create expense 
- POST /api/paymentrequests - request payment
- POST /api/payments - settle payment

## Deployment (EC2)
This API is deployed on an AWS EC2 instance with fixed Elastic IP for stable public access and runs as a systemd service.
Updates are packaged into a shaded JAR and copied to the server, then the service is restarted.
