class Blog < ApplicationRecord

  has_rich_text :content
  has_one_attached :avatar
  has_one_attached :video_file
  belongs_to :user
  belongs_to :genre

  is_impressionable

  validates :title, presence: true,  length: { minimum: 1, maximum: 25 }
  validates :genre, presence: true
  validates :content, presence: true

end
