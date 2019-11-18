class Job < ApplicationRecord
  def index
    @jobs = Job.all
  end
end