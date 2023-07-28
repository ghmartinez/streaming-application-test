class Purchase < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :purchase_option
end
