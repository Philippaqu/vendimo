class Order < ApplicationRecord
  belongs_to :payment
  monetize :value_cents
end
