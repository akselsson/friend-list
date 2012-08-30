class UserView extends Backbone.View
  el: $ '#current-user'
  model: new window.User
  initialize: ->
    @loggedout()
    window.dispatcher.on('loggedin',@loggedin,this)
    window.dispatcher.on('loggedout',@loggedout,this)

  render: ->
    template = _.template $('#user-template').html(), @model.attributes
    @$el.html(template).show()

  loggedin: ->
    @model.fetch({ success: => @render() })

  loggedout: ->
    @$el.hide()

window.userView = new UserView
