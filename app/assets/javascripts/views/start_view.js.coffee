class StartView extends Backbone.View
  el: $ ".main"

  render: ->
    template = _.template $("#start-template").html(), {}
    $(@el).html(template)

  events: ->
    "click #login": "login"

  login: ->
    window.applicationRouter.navigate('friends',{trigger:true})

window.startView = new StartView
