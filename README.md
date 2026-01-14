![CI](https://github.com/Khebe-Dev/expense-sharing-api/actions/workflows/ci.yml/badge.svg)

# Expense Sharing API

A Java (Javalin) REST API for expense sharing, built with Maven, tested with JUnit, and integrated with GitHub Actions CI.

## CI
This project uses GitHub Actions to automatically run `mvn clean test` on every push and pull request to ensure build and test reliability.

## Tech Stack
- Java 17 (Javalin)
- Maven
- JUnit
- Docker
- GitHub Actions

## Running locally
```bash
mvn clean test
mvn exec:java -D"exec.mainClass=weshare.server.WeShareServer"