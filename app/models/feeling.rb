class Feeling < ApplicationRecord
  has_rich_text :detail
  belongs_to :user
end
