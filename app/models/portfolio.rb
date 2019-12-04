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
                                  attrs['img'].blank? ||
                                  attrs['overview'].blank?
                                  }
  
  validates_presence_of :title, :body
  
  mount_uploader :thumb_image, ImageUploader
  mount_uploader :main_image, ImageUploader
  
  def self.by_position
    order("position ASC")
  end
  
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails')}
end
# , :main_image, :thumb_image