
(function() {
  $(document).on('ready turbolinks:load', function() {
    var sticky_elem = $('[data-uk-sticky]')
    var sticky = UIkit.sticky(sticky_elem, UIkit.Utils.options(sticky_elem.attr('data-uk-sticky')));
    
    var scroll_elem = $('[data-uk-scrollspy]');
    var scrollspy = UIkit.scrollspy(scroll_elem, UIkit.Utils.options(scroll_elem.attr('data-uk-scrollspy')));
    
  });

}).call(this);