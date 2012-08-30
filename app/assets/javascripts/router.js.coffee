class Router extends Backbone.Router
  routes:
    "friends": "friends",
    "": "start"

  friends: ->
    window.friendsView.fetch()
    window.friendsView.render()

  start: ->
    window.startView.render()

window.applicationRouter = new Router
