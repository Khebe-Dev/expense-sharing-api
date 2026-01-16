![CI](https://github.com/Khebe-Dev/expense-sharing-api/actions/workflows/ci.yml/badge.svg)

# Expense Sharing API

WeShare is a Java-based expense sharing web application that allows users to track shared expenses and balances.
This project was deployed to production on AWS with a custom domain and HTTPS enabled.

## Live Application
- Web App: https://weshare.khebedev.cloud
- Swagger UI: https://weshare.khebedev.cloud/swagger
- Health Check: https://weshare.khebedev.cloud/health


## Project Overview 
Expense Sharing APi is a Java-based RESTful backend that enables users to:
- Record shared expenses
- Request payments amongst users
- Track settlement and balances
- View expenses and payment history 
The application exposes REST endpoints, includes session handling, and is fully covered by automated unit and integration tests. 

## CI
This project uses GitHub Actions to automatically run `mvn clean test` on every push and pull request to ensure build and test reliability.

## Cloud & Infrastructure
- Cloud Provider: AWS
- Compute: EC2 (Ubuntu 24.04)
- Networking:
    - Elastic IP (static public IP)
    - Custom subdomain via DNS (Hostinger)
- Web Server: Nginx (reverse proxy)
- Backend: Java (Javalin framework)
- Service Management: systemd
- SSL/TLS:
    - Let’s Encrypt (Certbot)
    - Automatic certificate renewal
- Security: 
  -HTTPS enforced
  -Backend port hidden behind Nginx
  -EC2 Security Groups configured for 22 / 80 / 443
  
## Tech Stack
- Java 17 
- Javalin (REST framework)
- Maven
- JUnit5
- Docker (optional)
- GitHub Actions (CI)
- Swagger (OpenAPI Documentation)
- AWS EC2
- Elastic IP
- Linux (Ubuntu)
- Nginx
- systemd
- Certbot (Let's Encrypt)
- DNS & subdomain configuration

## API documentation
Using OpenAPI(Swagger)

## Key API Endpoints 
- GET /api/people - list users
- POST /api/people - create user
- GET /api/expenses - list expenses
- POST /api/expenses - create expense 
- POST /api/paymentrequests - request payment
- POST /api/payments - settle payment

## Deployment 
- Deployed a Java REST API to AWS EC2
- Configured Nginx as a reverse proxy
- Secured the application with HTTPS
- Connected a custom subdomain to a cloud-hosted service
- Verified production readiness using live health checks
