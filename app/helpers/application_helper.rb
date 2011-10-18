module ApplicationHelper
  
  def render_flash
    flash.map do |type, message|
      %(<div class="flash #{ type }">#{ message }</div>)
    end.join($/).html_safe
  end
end
