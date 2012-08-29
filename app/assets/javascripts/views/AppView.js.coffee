window.AppView = class AppView extends Backbone.View
  el: $ '#friends'

  initialize: ->
    alert 'init'

  render: ->
    $(@el).append('<li>test</li>')

