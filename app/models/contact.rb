class Contact < ApplicationRecord
  acts_as_taggable
  validates :name, presence: true
end
