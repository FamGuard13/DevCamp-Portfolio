module PortfoliosHelper
  def portfolio_img(img)
    if img.model.main_image? || img.model.thumb_image?
      img
    else
      'https://source.unsplash.com/random'
    end
  end

  def feature_visual(vid, img)
    if vid
      video_tag(vid,
        autoplay: true,
        loop: true,
        muted: true,
        poster: img,
        class: 'paired-image')
    else
      image_tag(img, class: 'paired-image')
    end
  end
end