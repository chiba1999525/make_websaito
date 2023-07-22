class Inquiry < ApplicationRecord

  has_rich_text :content
  validates :name, presence: true
  validates :number, presence: true
  validates :content, presence: true
end
