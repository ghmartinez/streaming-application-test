class PurchaseOption < ApplicationRecord
  belongs_to :content, polymorphic: true
end
