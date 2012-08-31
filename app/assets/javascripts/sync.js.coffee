class Server
  constructor: ->
    @actions = []
    @connected = false

  connect: ->
    @connected = true
    _.each @actions, (action) -> action()
    @actions = []

  whenConnected: (action) ->
    return action() if @connected
    @actions.push(action)

  login: (success,fail) ->
    @whenConnected =>
      FB.getLoginStatus (response) =>
        if response.status == "connected"
          success()
        else
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

  sync: (method,model,options) ->
    return options.error("Method " + method + " is not supported") unless method == "read"
    FB.api model.url(), (response) =>
      options.success(if response.data then _.values(response.data) else response)

window.server = new Server

Backbone.sync = window.server.sync
