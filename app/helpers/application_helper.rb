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
        title: 'Tanner Harman',
        data_tag: '.intro'
      }
    ]
  end

  def nav_items
    [
      {
        url: about_me_path,
        title: 'About Me',
        data_tag: '.about'
      },

      {
        url: qualifications_path,
        title: 'Qualifications',
        data_tag: '.qualifications'
      },

      {
        url: portfolios_path,
        title: 'Portfolio',
        data_tag: '.portfolio'
      },

      {
        url: contact_path,
        title: 'Contact',
        data_tag: '.contact'
      }
    ]
  end

  def nav_helper(tag_type, links, style)
    nav_links = ''

    links.each do |item|
      nav_links << "<#{tag_type} class='#{style}' data-tag='#{item[:data_tag]}'><a href='#{item[:url]}' class='#{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
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

  def admin_links(link_path, styles = nil)
    if logged_in?(:site_admin)
      content_tag(:div, 
                  link_to('Edit', eval('edit_' + link_path), class: styles) + 
                  link_to('Delete', eval(link_path), method: :delete, data: { confirm: 'Are you sure?'}, class: styles))
    end
  end

  def img(image)
    if image.model.img? || image.model.logo?
      img
    else
      'https://source.unsplash.com/random'
    end
  end
end