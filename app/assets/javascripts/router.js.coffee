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
    @loggedIn ->
      friend = new window.Friend id: id
      friend.fetch success: ->
        window.friendDetailsView.model = friend
        window.friendDetailsView.render()

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
          FB.login( (response) =>
            if response.status == "connected"
              action()
            else
              @navigate('',{trigger: true})
          , scope: 'friends_birthday,friends_about_me')

window.applicationRouter = new Router
