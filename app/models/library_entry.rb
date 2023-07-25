class LibraryEntry < ApplicationRecord
  belongs_to :user
  belongs_to :content, polymorphic: true
end
