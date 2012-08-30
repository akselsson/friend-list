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
    window.server.whenConnected =>
      FB.getLoginStatus (response) =>
        if response.status == "connected"
          action()
        else
          FB.login (response) =>
            if response.status == "connected"
              action()
            else
              @navigate('',{trigger: true})

window.applicationRouter = new Router
