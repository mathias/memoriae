Memoriae.ApplicationRoute = Ember.Route.extend(
  events:
    goToIndex: ->
      @transitionTo('articles')
)
