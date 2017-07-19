class SearchTerm < ApplicationRecord
  validates :term, presence: true
end
