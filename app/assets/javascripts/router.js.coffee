class Router extends Backbone.Router
  routes:
    "friends": "friends",
    "": "start"

  friends: ->
    @loggedIn ->
      window.friendsView.fetch()
      window.friendsView.render()

  start: ->
    window.startView.render()

  loggedIn: (action) ->
    window.sync.whenConnected ->
      FB.getLoginStatus (response) ->
        if response.status == "connected"
          action()
        else
          FB.login (response) =>
            action() if response.status == connected()

window.applicationRouter = new Router
