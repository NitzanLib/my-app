# Counter Service
A simple Flask-based counter service the increments a counter on every POST request and returns the count value for every GET request.

Why count yourself when you have the Counter Service?

## Table of Contents
- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)

## Installation

To install the project locally, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/NitzanLib/my-app
   ```
2. Navigate to the project folder:
   ```bash
   cd counter-service
   ```
   ```
3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

4. Run the application:
   ```bash
   python counter-service.py


## Usage

After starting the service, you can interact with it via `POST` and `GET` requests:

- **POST Request**: Increments the counter.
  ```bash
  curl -X POST http://localhost:8080
  ```
  Response: `"Hmm, Plus 1 please"`

- **GET Request**: Returns the current counter value.
  ```bash
  curl http://localhost:8080
  ```
  Response: `"Our counter is: 5"`

## Configuration

You can configure the following environment variables:

- `COUNTER_INCREMENT`: The number by which the counter should increment (default is `1`).