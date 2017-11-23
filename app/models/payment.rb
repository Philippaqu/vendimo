class Payment < ApplicationRecord
  belongs_to :user
  monetize :value_cents
end
