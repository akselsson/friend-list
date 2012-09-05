class App.UserView extends Backbone.View
  el: $ '#current-user'
  model: new App.User
  initialize: ->
    @loggedout()
    App.dispatcher.on('loggedin',@loggedin,this)
    App.dispatcher.on('loggedout',@loggedout,this)

  render: ->
    template = _.template $('#user-template').html(), @model
    @$el.html(template).show()

  loggedin: ->
    @model.fetch({ success: => @render() })

  loggedout: ->
    @$el.hide()

