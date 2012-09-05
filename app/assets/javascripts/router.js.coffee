class App.Router extends Backbone.Router
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
      friend = new App.Friend id: id
      friend.fetch success: ->
        window.friendDetailsView.model = friend
        window.friendDetailsView.render()

  login: ->
    @loggedIn =>
      @navigate('friends',{replace: true,trigger: true})

  logout: ->
    window.backend.logout =>
      @navigate('',{replace:true, trigger: true})

  start: ->
    window.startView.render()

  loggedIn: (action) ->
    window.backend.login action, => @navigate('',{trigger: true})

