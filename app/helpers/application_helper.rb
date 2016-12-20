module ApplicationHelper
    def active_class(link_path = '')
        return 'uk-active' if link_path == ''
        current_page?(link_path) ? 'uk-active' : ''
   end
   
   def account_page?
     controller.controller_name == 'registrations' && controller.action_name == 'edit'
   end
   
    def uikit_messages
        output = ''
        flash.each do |name, msg|
            display_class = 'notice'
            display_class = 'danger' if name == 'alert' || name == 'error'
            message = content_tag :div, msg, id: "flash_#{name}"
            close_link = link_to '', '', class: 'uk-alert-close uk-close'
            output += content_tag :div, close_link + message, class: 'uk-alert uk-alert-' + display_class
        end

        output.html_safe
    end

    def background_image
        'leaf_maze.jpg'
    end
    
    def plaid_user
      if user_session["plaid_user"].present? 
        return user_session["plaid_user"]
      else 
        return nil
      end
    end 
end
