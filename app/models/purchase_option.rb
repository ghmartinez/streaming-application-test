class PurchaseOption < ApplicationRecord
  belongs_to :content, polymorphic: true
  has_many :purchases

  HD = "HD"
  SD = "SD"
end
