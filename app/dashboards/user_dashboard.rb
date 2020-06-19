require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    posts: Field::HasMany.with_options(searchable: false),
    id: Field::Number.with_options(searchable: false),
    email: Field::String.with_options(searchable: true),
    password: Field::String.with_options(searchable: false),
    first_name: Field::String.with_options(searchable: false),
    last_name: Field::String.with_options(searchable: false),
    created_at: Field::DateTime.with_options(searchable: false),
    updated_at: Field::DateTime.with_options(searchable: false),
    type: Field::String.with_options(searchable: false),
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
  posts
  email
  type
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
  posts
  email
  first_name
  last_name
  created_at
  updated_at
  type
  ].freeze

  FORM_ATTRIBUTES = %i[
  email
  password
  first_name
  last_name
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
