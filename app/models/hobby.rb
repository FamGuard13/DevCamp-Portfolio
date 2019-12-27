class Hobby < ApplicationRecord
  validates_presence_of :title, :icon
end
