class StartView extends Backbone.View
  el: $ ".main"

  render: ->
    template = _.template $("#start-template").html(), {}
    $(@el).html(template)

window.startView = new StartView
