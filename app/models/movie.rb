class Movie < ApplicationRecord
  has_many :bookmarks
  # has_many :lists, throught: :bookmarks
  validates :title, presence: true
  validates :overview, presence: true
end
