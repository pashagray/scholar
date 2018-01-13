ThinkingSphinx::Index.define :user, with: :active_record do
  #fields
  indexes last_name
  indexes first_name
  indexes middle_name
  indexes email
  indexes iin

  # attribute
  has created_at, updated_at
end