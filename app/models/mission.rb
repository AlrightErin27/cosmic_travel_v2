class Mission < ApplicationRecord
  belongs_to :scientist
  belongs_to :planet

  validates :name, presence: true
  validates :scientist_id, presence: true
  validates :planet_id, presence: true

  # makes sure each scientist can only join each mission once.
  validates :scientist, uniqueness: { scope: :name }
end
