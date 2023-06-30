# Microservice Starter Template

This repository contains a starter template for developing a microservice in Go. It provides a basic structure and functionality to get started with building a microservice from scratch.

## Features

- HTTP server implementation with customizable endpoints
- Key-value store functionality for storing and retrieving data
- Graceful shutdown handling
- Logging middleware for request logging
- Health and readiness probe endpoints

## Dependencies

This starter template does not have any external dependencies. It is built using standard packages provided by Go.

## Getting Started

To use this starter template, follow the steps below:

1. Clone this repository to your local machine.
2. Navigate to the project directory.
3. Build the project using the following command:
   ```
   go build -ldflags "-X main.version=1.5.0" -o main service.go
   ```
4. Run the built executable:
   ```
   ./main
   ```
5. The microservice will start running on the specified server address (default is `localhost:8080`).
6. You can now access the endpoints using HTTP requests.

## Usage

## Benchmark
 ```
go test -bench=. -benchmem
 ```
## Unit Tests
 ```
go test -v ./...
 ```
### Endpoints

- `GET /healthz`: Health probe endpoint that returns HTTP 200 OK to indicate that the service is alive.
- `GET /readyz`: Readiness probe endpoint that returns HTTP 200 OK to indicate that the service is ready to serve requests.
- `POST /set`: Endpoint for setting key-value pairs. The request should include a JSON payload with `key` and `value` fields.
- `POST /get`: Endpoint for retrieving values by key. The request should include a JSON payload with the `key` field.

### Example Requests

To set a key-value pair:
```
curl -X POST -H "Content-Type: application/json" -d '{"key": "key1", "value": "value1"}' http://localhost:8080/set
```

To retrieve a value by key:
```
curl -X POST -H "Content-Type: application/json" -d '{"key": "key1"}' http://localhost:8080/get
```

## Configuration

The starter template uses command-line flags and environment variables for configuration. The following options are available:

- `address` (flag) or `SERVER_ADDRESS` (environment variable): Specifies the server address to listen on. Default is `localhost:8080`.
- `shutdown-timeout` (flag) or `SHUTDOWN_TIMEOUT` (environment variable): Specifies the timeout duration for graceful shutdown. Default is 10 seconds.
- `enable-logging-middleware` (flag) or `ENABLE_LOGGING_MIDDLEWARE` (environment variable): Enables or disables the logging middleware for request logging. Default is `false`.

The values of flags take precedence over environment variables. If a flag is not provided, the corresponding environment variable will be used. If neither is set, a default value will be used.

## License

This starter template is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributions

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.


