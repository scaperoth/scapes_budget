
(function() {
  $(document).on('ready page:load turbolinks:load', function() {
    $('html').css('margin-top','0px')
    $('[data-uk-sticky]').each(function(){
      element = $(this)
      var sticky = UIkit.sticky(element, UIkit.Utils.options(element.attr('data-uk-sticky')));
    })
    
    
    $('[data-uk-scrollspy]').each(function(){
      element = $(this)
      var scrollspy = UIkit.scrollspy(element, UIkit.Utils.options(element.attr('data-uk-scrollspy')));
    })
  });

}).call(this);