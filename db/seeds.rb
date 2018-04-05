# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
  {
    name: 'Administrator',
    username: 'admin',
    password: 'password',
    password_confirmation: 'password',
    email: 'admin@example.org',
    admin: true
  },
  {
    name: 'User',
    username: 'user',
    password: 'password',
    password_confirmation: 'password',
    email: 'user@example.org',
    admin: false
  }
])

projects = Project.create([
  {
    name: 'First project',
    description: 'Very first project'
  },
  {
    name: 'Hard project',
    description: 'Very hard project'
  }
])

issues = Issue.create([
  {
    name: 'First issue',
    description: 'Very first issue',
    project_id: 1,
    estimated_time: 62,
    done: false
  },
  {
    name: 'Second issue',
    description: 'A bit harder',
    project_id: 1,
    estimated_time: 123,
    done: true
  },
  {
    name: 'Third issue',
    description: 'It belongs to another project',
    project_id: 2,
    estimated_time: 12,
    done: false
  }
])
