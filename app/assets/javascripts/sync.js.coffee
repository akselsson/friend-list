class Sync
  constructor: ->
    @actions = []
    @connected = false

  connect: ->
    _.each @actions, (action) -> action()
    @actions = []
    @connected = true

  whenConnected: (action) ->
    return action() if @connected
    @actions.push(action)

  sync: (method,model,options) ->
    return options.error("Not connected") unless window.sync.connected
    return options.error("Method " + method + " is not supported") unless method == "read"
    FB.api model.url, (response) =>
      options.success(_.values(response.data))

window.sync = new Sync

Backbone.sync = window.sync.sync
