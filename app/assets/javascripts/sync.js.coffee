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

  sync: (method,model,options) ->
    return options.error("Method " + method + " is not supported") unless method == "read"
    FB.api model.url(), (response) =>
      options.success(if response.data then _.values(response.data) else response)

window.server = new Server

Backbone.sync = window.server.sync
