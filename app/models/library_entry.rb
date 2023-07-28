class LibraryEntry < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :content, polymorphic: true
end
