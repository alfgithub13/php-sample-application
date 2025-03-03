# PHP 7.1 Sample Application - Containerized

This is a containerized version of the PHP sample application with:
* Dependency Injection
* Apache routing
* Composer (aka: Not reinventing the wheel)
* Docker containers for both web application and database

## Requirements

* Unix-like operating systems
* Apache
* MariaDB/MySQL
* PHP >= 7.1
* Command line tools `make` & `wget`

## Docker Setup (Recommended)

### Prerequisites
* Docker
* Docker Compose

### Quick Start (Development)
1. Clone this repository:
   ```bash
   git clone https://github.com/YOUR_GITHUB_USERNAME/php-sample-application.git
   cd php-sample-application
   ```

2. Launch the application with Docker Compose:
   ```bash
   docker-compose up -d
   ```

3. Access the application at http://localhost:8080/

### Using Pre-built Images (Production)
Pre-built Docker images are available on Docker Hub:
* Web Application: [andresdockerdev/php-sample-web](https://hub.docker.com/r/andresdockerdev/php-sample-web)
* Database: [andresdockerdev/php-sample-db](https://hub.docker.com/r/andresdockerdev/php-sample-db)

To use these images directly:
```bash
docker-compose -f docker-compose.prod.yml up -d
```

## Environment Variables

### Web Application Container
| Variable | Description | Default |
|----------|-------------|---------|
| DB_HOST | Database hostname | db |
| DB_NAME | Database name | sample |
| DB_USER | Database username | sampleuser |
| DB_PASSWORD | Database password | samplepass |

### Database Container
| Variable | Description | Default |
|----------|-------------|---------|
| MYSQL_ROOT_PASSWORD | Root password | rootpassword |
| MYSQL_DATABASE | Database name | sample |
| MYSQL_USER | Username | sampleuser |
| MYSQL_PASSWORD | Password | samplepass |

## Troubleshooting

### Database Connection Issues
If you encounter database connection issues:
- Ensure the database container is running: `docker ps`
- Check database logs: `docker logs php-sample-db`
- Verify environment variables match between services

### Web Server Issues
- Check web server logs: `docker logs php-sample-web`
- Ensure ports are correctly mapped in docker-compose.yml
