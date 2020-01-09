# DrJohnson Backend

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

## Tasks

- [x] Scaffold Rails and React
- [ ] Models and Controllers
- [ ] Authentication and Roles
- [ ] Seed data
- [ ] ICD-10 Lookup/Download
- [ ] Photo for Profile
- [ ] Alexa Skill (?)

## Notes

- Planning to use amazon s3, research Active Storage in Rails.
