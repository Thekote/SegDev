# README

## Getting Started
This project uses Ruby on Rails to recieve a payload, process the information and calculate a risk profile for 4 different insurance plans.

```
Ruby version: 3.1.0
Rails version: 7.0.8
```

First, install dependencies:

```bash
bundle install
```

Create, migrate and seed the database:

```bash
bundle exec rails db:create
bundle exec rails db:migrate
```

Start the server
```bash
bundle exec rails s
```

Open Postman or any other way to send requests to try the endpoints.

API Routes:
  ```
  POST http://localhost:3000/api/v1/insurance/calculate -> calculate insurance risk profile
  ```

Payload Example:
  ```
  {
    "age": 35,
    "dependents": 2,
    "house": {"ownership_status": "owned"},
    "income": 10000,
    "marital_status": "married",
    "risk_questions": [0, 1, 0],
    "vehicle": {"year": 2018}
  }
  ```

To run the test suites:
```bash
bundle exec rspec
```
After running the tests, you can find the `index.html` file on the coverage folder and check the project coverage by opening on your browser.
