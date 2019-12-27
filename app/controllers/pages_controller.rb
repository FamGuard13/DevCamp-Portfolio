class PagesController < ApplicationController
  def home
    @skills = Skill.all
  end

  def about
    @hobbies = Hobby.all
  end

  def contact
  end
  
  def qualifications
    @skills = Skill.all
    @jobs = Job.order('start_date DESC')
    @schools = School.order('end_date ASC')
  end
end