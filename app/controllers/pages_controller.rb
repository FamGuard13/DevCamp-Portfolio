class PagesController < ApplicationController
  def home
    @posts = Blog.all
    @skills = Skill.all
  end

  def about
  end

  def contact
    @skills = Skill.all
  end
  
  def tech_news
    @tweets = SocialTool.twitter_search
  end
end