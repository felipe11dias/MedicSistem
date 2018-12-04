class Surgery < ApplicationRecord
  belongs_to :doctor
  belongs_to :room
  belongs_to :client
end
