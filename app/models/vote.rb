class Vote < ApplicationRecord
  belongs_to :candidate
  accepts_nested_attributes_for :candidate
  validates :voter_id, uniqueness: true
end
