
(function() {
  $(document).on('ready turbolinks:load', function() {
    var scroll_elem = $('[data-uk-scrollspy]');
    var scrollspy = UIkit.scrollspy(scroll_elem, UIkit.Utils.options(scroll_elem.attr('data-uk-scrollspy')));
    
  });

}).call(this);