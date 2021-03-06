class Service < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :tags, as: :tagable
  has_many :reviews

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
