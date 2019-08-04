# ScheduleManagerAPI

## Unusual Design Choices
There are a few things I've attempted to adhere to that have made this code a little different than some Rails apps I've made in the past. In particular are the private helper methods I've included in the controllers as well as the Appointment model. I wanted to make sure each method adhered to a single-responsibility principle, and additionally I attempted to keep the code as readable as possible. I was able to keep most methods between 1-2 lines this way but it involved in many cases adding additional helper methods. The Appointment instance methods ended up being written in an unusual way that tested if it violated specific issues. It caused more code to be written, but it gave feedback to the user on what exactly went wrong. I had difficulty deciding how to nest the urls. I ultimately decided that schedule needed to be included in order to add or remove appointments (it seemed more in line with security if this were to be built out more to include authorization), but that it did not seem necessary to include the schedule id to see a single appointment, especially since I opted to return that id in the JSON object.

I worked for a really long time with the schedule not having any additional attributes beyond the appointments (this was the Minimum Viable Product with the given prompts), but this ultimately made me feel strange, so I ended up including a schedule name at the very end.

I was not completely clear on the prompt regarding server time being frozen at integer 0. I just assumed this meant that appointment times would be scheduled as integers, but that real time had nothing to do the scheduling of appointments. Therefore, no timestamps were necessary. Hopefully, this is not some glaring missing piece.

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

#### In order to read a schedule, make a POST request to the following URI with a name in a body:

```
POST /api/v1/schedules
```

#### Request Body:

```
{
  "name": <STRING>
}
```

#### Example Request:

```
{
  "name": "My Schedule"
}
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
