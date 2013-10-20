module ApplicationHelper

  def controller_stylesheet_link_tag
    return "" if params[:controller].blank?
    begin
      stylesheet_link_tag params[:controller].downcase, :media => "all"
    rescue Exception => e
      e.message
    end
  end

end
