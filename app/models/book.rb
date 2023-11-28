class Book < ActiveRecord::Base
  belongs_to :person

  has_and_belongs_to_many :libraries


  validates :title, length: { in: 1..250 } #seems like a good length
  validates :person, presence: true
  validates_format_of :isbn, with: /\AISBN \d{3}-\d-\d{3}-\d{5}-\d\z/, message: "must be in the format ISBN 000-0-000-0000-0"
end
