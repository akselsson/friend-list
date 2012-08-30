class Router extends Backbone.Router
  routes:
    "friends": "friends",
    "friends/:id": "friend"
    "": "start",
    "login": "login",
    "logout": "logout"

  friends: ->
    @loggedIn ->
      window.friendsView.fetch()
      window.friendsView.render()

  friend: (id) ->
    alert(id)

  login: ->
    @navigate('friends',{replace: true,trigger: true})

  logout: ->
    FB.logout =>
      @navigate('',{replace:true, trigger: true})

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
