# frozen_string_literal: true

require 'dry-schema'

NewBookFormSchema = Dry::Schema.Params do
  required(:autor).filled(:string)
  required(:title).filled(:string)
  required(:date).filled(:string, format?: /\d{4}-(0[1-9]|1[0-2])-(0[1-9]|1[0-9]|3[0-1])/)
end
