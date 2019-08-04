# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
schedule = Schedule.create(name: "Schedule 1")
schedule.appointments.create(start_time: 1, end_time: 3)
schedule.appointments.create(start_time: 4, end_time: 5)
schedule.appointments.create(start_time: 6, end_time: 9)
schedule.appointments.create(start_time: 11, end_time: 14)

schedule_2 = Schedule.create(name: "Schedule 2")
schedule_2.appointments.create(start_time: 4, end_time: 5)
schedule_2.appointments.create(start_time: 15, end_time: 19)
schedule_2.appointments.create(start_time: 6, end_time: 7)
schedule_2.appointments.create(start_time: 1, end_time: 3)
