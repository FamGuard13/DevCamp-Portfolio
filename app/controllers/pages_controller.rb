class PagesController < ApplicationController
  def home
    @skills = Skill.all
  end

  def about
  end

  def contact
    @skills = Skill.all
  end
  
  def qualifications
    @skills = Skill.all
    @jobs = Job.all
    @schools = School.all
  end
end