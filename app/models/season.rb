class Season < ApplicationRecord
  has_many :episodes, dependent: :destroy
  has_many :purchase_options, as: :content
  has_many :libray_entries, as: :content
end
