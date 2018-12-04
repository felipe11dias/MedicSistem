class Client < ApplicationRecord
  has_many :surgeries
  belongs_to :doctor
end
