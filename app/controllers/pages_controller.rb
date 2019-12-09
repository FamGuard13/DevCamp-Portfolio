class PagesController < ApplicationController
  def home
    @skills = Skill.all
  end

  def about
  end

  def contact
  end
  
  def qualifications
    @skills = Skill.all
    @jobs = Job.order('start_date ASC')
    @schools = School.order('end_date ASC')
  end
end