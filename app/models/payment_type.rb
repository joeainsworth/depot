class PaymentType < ApplicationRecord
  has_many :orders

  def self.names
    all.collect { |payment_type| payment_type.name }
  end
end
