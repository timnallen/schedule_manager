# ScheduleManagerAPI

## Initial Setup

#### 1. Clone down the repo:
```
git clone git@github.com:timnallen/schedule_manager.git
```
#### 2. Install the dependencies in the Gemfile:

```
bundle install
```

#### Set up the database:

#### 1. Create and migrate:

```
rake db:{create,migrate}
```

#### 2. Seed the db:

```
rake db:seed
```

#### 3. Run the code in development mode:

```
rails s
```

#### 4. Open your browser and visit http://localhost:3000

## Using the API

### GET A Schedule

#### In order to read a schedule, make a GET request to the following URI with that schedule's id:

```
GET /api/v1/schedules/:id
```

#### This will return a Fast JSON object that has the schedule and all its appointments sorted by start time (soonest first)

### CREATE A Schedule

#### In order to read a schedule, make a POST request to the following URI:

```
POST /api/v1/schedules
```

#### This will return a newly created Schedule object with its unique id

### DELETE A Schedule

#### In order to read a schedule, make a DELETE request to the following URI with the id of the schedule you want to delete:

```
DELETE /api/v1/schedules/:id
```

#### This will delete the schedule and send a 204 status

## Running Tests

#### The Application uses [RSPEC](https://rspec.info/) as a testing suite. To run the test suite, after completing the steps from "Initial Set Up" above, simply run:

```
rspec
```

#### To check out test coverage after running the tests, you can run:

```
open coverage/index.html
```

#### This will open a file in your browser that will show details about test coverage.

## Contributors
- [Tim Allen](https://github.com/timnallen)

## Schema Design

![alt text](/DBschema.png)

## Tech Stack List
- Ruby
- Rails
- Postgresql
---
**[Back to Top](https://github.com/timnallen/schedule_manager/blob/master/README.md)**
