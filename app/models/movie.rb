class Movie < ApplicationRecord
  has_many :purchase_options, as: :content
  has_many :libray_entries, as: :content
end
