class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list # my_bookmark.list
  validates :comment, length: { minimum: 6 }
  validates_uniqueness_of :movie, scope: :list
end
