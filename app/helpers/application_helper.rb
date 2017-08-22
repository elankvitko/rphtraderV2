module ApplicationHelper
  def active_class(link_path)
    url = link_path.split( "\">" )[ 1 ][ 0..-5 ]
    current_page?( url ) ? "current" : ""
  end

  def active_class_for_dash( link_path )
    url = link_path.split( "\">" )[ 1 ][ 0..-5 ]
    current_page?( url ) ? "active" : ""
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def check_inputs( day )
    if current_user.fulls.first[ day ] == "active"
      return "status-override"
    else
      return "override-false"
    end
  end
end
