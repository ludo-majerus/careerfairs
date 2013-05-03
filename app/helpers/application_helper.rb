module ApplicationHelper
  
  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def keys_companyid_and_eventid 
        #@keys = Companytoevent.where("company_id = ? and event_id = ?", Contact.find(session[:current_user_authenticated]).company_id, session[:current_event]).first.id
        @key = 1
  end
  
end