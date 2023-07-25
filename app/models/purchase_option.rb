class PurchaseOption < ApplicationRecord
  belongs_to :content, polymorphic: true
  has_many :purchases
end
