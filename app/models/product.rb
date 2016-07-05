class Product < ApplicationRecord
  validates :title, :description, :image_url, presence: true
  validates :title, uniqueness: true, length: { minimum: 10, message: "should be 10 chars or greater!" }
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :image_url, allow_blank: true, format: {
    with:     %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG'
  }

  def self.latest
    order(:updated_at).last
  end
end
