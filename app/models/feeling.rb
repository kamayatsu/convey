class Feeling < ApplicationRecord
  Gutentag::ActiveRecord.call self
  include TagExtensions

  has_rich_text :detail
  belongs_to :user
end
