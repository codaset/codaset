# Codaset

> Project management for software developers, that's closer to your code

## IDEAS
- Found in BRANCH X, fixed in BRANCH Y
- Environment aware
- Bugs handled separately
- Individual issues can be QA'd with bugs being associated
- Organisations
- Optional projects

## Structure

/users/...
/organisations/...
/cards/...

### Account

### User
  - Inherits from Account
  - has_many created_cards

### Organisation
  - Inherits from Account

### Card
  - Scoped to an Account (`belongs_to :accountable`)
  - Created by creator (`belongs_to :user`)

## Authorization

A User can belong to an Organisation