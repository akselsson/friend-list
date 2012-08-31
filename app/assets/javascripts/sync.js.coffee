class FacebookBackend
  constructor: ->
    @actions = []
    @connected = false
    window.dispatcher.on 'facebook:initialized', => @connect()
    window.dispatcher.on 'loggedin', => @loggedin = true
    window.dispatcher.on 'loggedout', => @loggedin = false

  whenConnected: (action) ->
    return action() if @connected
    @actions.push(action)

  login: (success,fail) ->
    @whenConnected =>
      return success() if @loggedin
      FB.login( (response) =>
        if response.status == "connected"
          success()
        else
          fail()
      , scope: 'friends_birthday,friends_about_me')

  logout: (success) ->
    @whenConnected ->
      FB.logout ->
        success()

  connect: ->
    @connected = true
    _.each @actions, (action) -> action()
    @actions = []

  sync: (method,model,options) ->
    return options.error("Method " + method + " is not supported") unless method == "read"
    FB.api model.url(), (response) =>
      options.success(if response.data then _.values(response.data) else response)

window.server = new FacebookBackend

Backbone.sync = window.server.sync
