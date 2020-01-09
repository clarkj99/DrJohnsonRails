# DrJohnson Rails

DrJohnson is an Electronic Medical Records application (scaled down). It was written to showcase technologies learned from my Flatiron school coding bootcamp experience, using Ruby on Rails api for model and controller, and React for the views.

## Configuration

- Ruby Version 2.6.1
- Rails Version 6.0.2

## Rails Project Creation

```bash
rails new backend --api -—database=postgresql --skip-action-mailer --skip-action-mailbox
```

## Models

### User (Patient, Provider)

- Email
- Name
- Role

### Profile

- PatientId
- Address
- Photo
- Pharmacy Address
- InsuranceId
- Insurance Type

### History

- PatientId
- …details

### Encounter

- patientId
- providerId
- …details

### Generators

```
rails g model users email first_name last_name role:integer password_digest

rails g controller api/v1/users profile create

rails g controller api/v1/auth create
```

## Tasks

- [x] Scaffold Rails and React
- [ ] Models and Controllers
- [ ] Authentication and Roles
- [ ] Seed data
- [ ] ICD-10 Lookup/Download
- [ ] Photo for Profile
- [ ] Alexa Skill (?)

## Notes

2020-01-08

- Planning to use amazon s3, research Active Storage in Rails.
- Authorization: JWT and Bcrypt. Add roles attribute to Users model.

2020-01-09

- enum type in Ruby model adds '?' and other methods: https://api.rubyonrails.org/v5.2.4.1/classes/ActiveRecord/Enum.html
  -trouble using enum with validates inclusion: {in:}
