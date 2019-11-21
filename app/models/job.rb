class Job < ApplicationRecord
  validates_presence_of :name, :logo, :img, :link, :location, :description :title, :start_date
end