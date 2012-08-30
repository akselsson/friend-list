#= require models/friend

class window.Friends extends Backbone.Collection
  model: window.Friend
  url: '/me/friends'

  search: (query) ->
    @filter (friend) ->
      friend.get('name').toLowerCase().indexOf(query.toLowerCase()) != -1

