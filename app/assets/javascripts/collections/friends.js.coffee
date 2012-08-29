#= require models/friend

class window.Friends extends Backbone.Collection
  model: window.Friend

  search: (query) ->
    @filter (friend) ->
      friend.get('name').indexOf(query) != -1

  fetch: ->
      FB.api '/me/friends', (r) =>
        @reset(r.data)
