#= require models/friend

class window.Friends extends Backbone.Collection
  model: window.Friend

  fetch: ->
      FB.api '/me/friends', (r) =>
        @reset(r.data)
