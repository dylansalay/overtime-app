# Overtime

## Key requirement: company needs documentation that salaried employees did or did not get overtime each week

## Models
- X Post -> date:date rationale:test
- X User -> Devise
- X AdminUser -> STI

## Features:
- Approval Workflow
- SMS Sending -> link to approval or overtime input
- Administrate admin dashboard
- Block non admin and guest users
- Email summary to managers for approval
- Needs to be documented if employee did not log overtime

## UI:
- X Bootstrap -> formatting
- Icons from Font Awesome
- x Update the styles for forms

## Refactor TODOS:
- Refactor user association integration test in post_spec