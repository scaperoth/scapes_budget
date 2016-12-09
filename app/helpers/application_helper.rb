module ApplicationHelper
    def active_class(link_path)
        current_page?(link_path) ? 'uk-active' : ''
   end
end
