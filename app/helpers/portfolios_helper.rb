module PortfoliosHelper
  def portfolio_img(img)
    if img.model.main_image? || img.model.thumb_image?
      img
    else
      'https://source.unsplash.com/random'
    end
  end
end