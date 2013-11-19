window.pageChange = (selector, fn) ->
  wrapped = -> fn() if $(selector).length > 0
  $(wrapped)
  $(window).on 'page:change', wrapped
