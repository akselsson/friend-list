#= require models/friend

class App.Friends extends Backbone.Collection
  model: App.Friend
  url: -> '/me/friends'
  comparator: (friend) ->
    friend.get('name')

  search: (query) ->
    @filter (friend) ->
      friend.get('name').toLowerCase().indexOf(query.toLowerCase()) != -1

