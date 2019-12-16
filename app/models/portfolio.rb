class Portfolio < ApplicationRecord
  has_many :technologies
  has_many :features

  accepts_nested_attributes_for :technologies,
                                allow_destroy: true,
                                reject_if: lambda { |attrs| attrs['name'].blank?}

  accepts_nested_attributes_for :features,
                                allow_destroy: true,
                                reject_if: lambda { |attrs| 
                                  attrs['title'].blank? ||
                                  attrs['overview'].blank?
                                  }
  
  validates_presence_of :title, :body, :body_img, :main_image, :thumb_image, :tech_overview
  
  mount_uploader :thumb_image, ImageUploader
  mount_uploader :main_image, ImageUploader
  mount_uploader :body_img, ImageUploader
  
  def self.by_position
    order("position ASC")
  end
  
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails')}
end