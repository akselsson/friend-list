class App.FacebookBackend
  constructor: (@dispatcher) ->
    @actions = []
    @initialized = false

    @dispatcher.on 'facebook:initialized', => @initialize()
    @dispatcher.on 'loggedin', => @loggedin = true
    @dispatcher.on 'loggedout', => @loggedin = false

  whenInitialized: (action) ->
    return action() if @initialized
    @actions.push(action)

  login: (success,fail) ->
    @whenInitialized =>
      return success() if @loggedin
      FB.login( (response) =>
        if response.status == "connected"
          success()
        else
          fail()
      , scope: 'friends_birthday,friends_about_me')

  logout: (success) ->
    @whenInitialized ->
      FB.logout ->
        success()

  initialize: ->
    @initialized = true
    _.each @actions, (action) -> action()
    @actions = []

  sync: (method,model,options) ->
    return options.error("Method " + method + " is not supported") unless method == "read"
    FB.api model.url(), (response) =>
      options.success(if response.data then _.values(response.data) else response)


