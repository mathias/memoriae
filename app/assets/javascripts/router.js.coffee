Memoriae.Router.map ->
  @resource('articles', ->
    @resource('notes')
  )
