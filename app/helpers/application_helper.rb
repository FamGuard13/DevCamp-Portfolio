module ApplicationHelper
  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
        CodeRay.scan(code, language).div
    end
  end
      
  def markdown(text)
    coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)
    
    options = {
        fenced_code_blocks: true,
        no_intra_emphasis: true,
        autolink: true,
        lax_html_blocks: true,
    }
    
    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end
  
  def login_helper
    if !current_user.is_a?(GuestUser)
      content_tag(:li, link_to("Logout", destroy_user_session_path, method: :delete))
    end
  end

  def source_helper(styles)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}, please #{link_to('contact me', contact_path)} if you'd like to work together"
      content_tag(:div, greeting.html_safe, class: styles)
    end
  end

  def copyright_generator
    DevcampViewTool::Renderer.copyright 'Tanner Harman', 'All rights reserved'
  end

  def logo_link
    [
      {
        url: root_path,
        title: 'Tanner Harman'
      }
    ]
  end

  def nav_items
    [
      {
        url: about_me_path,
        title: 'About Me'
      },

      {
        url: contact_path,
        title: 'Qualifications'
      },

      {
        url: portfolios_path,
        title: 'Portfolio'
      },

      {
        url: contact_path,
        title: 'Contact'
      }
    ]
  end

  def nav_helper(tag_type, links, style)
    nav_links = ''

    links.each do |item|
      nav_links << "<#{tag_type} class='#{style}'><a href='#{item[:url]}' class='#{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end

    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice] )
    
    if alert
      alert_generator(alert)
    end
  end
  
  def alert_generator(msg)
    js add_gritter(msg, title: "Tanner Harman Portfolio", sticky: false)
  end

  def home_page_menu
    if current_page?('/')
      "class = 'home-nav'".html_safe
    end
  end
end