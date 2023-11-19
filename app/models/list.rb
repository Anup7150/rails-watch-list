class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy # my_list.bookmarks
  has_many :movies, through: :bookmarks
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
end
