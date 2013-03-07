Memoriae.Router.map ->
  @resource('page')
  @resource('post',
    path: '/posts/:post_id'
  )
