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
        unless flash.empty?
            flash.each do |name, msg|
                case name
                when 'error'
                    display_class = 'danger'
                    display_icon = '<i class="uk-icon-exclamation-circle"></i>'
                when 'alert'
                    display_class = 'warning'
                    display_icon = '<i class="uk-icon-exclamation-circle"></i>'
                else
                    display_class = 'success'
                    display_icon = '<i class="uk-icon-check"></i>'
                end
                flash.delete(name.to_sym)
                output += javascript_tag("UIkit.notify('#{display_icon} #{msg}', {status: '#{display_class}'});")
            end
            # clear remaining flash messages
            output.html_safe
        end
    end

    def background_image
        'leaf_maze.jpg'
    end

    def plaid_user
        user_session['plaid_user'] if user_session['plaid_user'].present?
    end
end
