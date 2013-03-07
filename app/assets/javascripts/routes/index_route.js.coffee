Memoriae.IndexRoute = Ember.Route.extend(
  redirect: ->
    @transitionTo('articles')
)
