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

### GET An Appointment

#### In order to read an appointment, make a GET request to the following URI with the appointment id:

```
GET /api/v1/appointments/:id
```

#### This will return a Fast JSON object that has the appointment and all its attributes including the schedule id

### CREATE An Appointment

#### In order to create an appointment, make a POST request to the following URI with the schedule id:

```
POST /api/v1/schedule/:id/appointments
```

##### Note: An appointment MUST contain a request body that has a start time and end time that do not overlap with an existing appointment on that schedule or overlap with each other

#### Request Body:

```
{
  "start_time": <INT>,
  "end_time": <INT>
}
```

#### Example Request:

```
{
  "start_time": 2,
  "end_time": 4
}
```

#### This will return a Fast JSON object that has the appointment and all its attributes including the schedule id

### DELETE An Appointment

#### In order to delete an appointment, make a POST request to the following URI with the schedule id and the appt id:

```
POST /api/v1/schedule/:schedule_id/appointments/:id
```

#### This will delete the appt and return a 204 status

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
