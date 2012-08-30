class FriendsView extends Backbone.View
  el: $ '#friends'

  initialize: ->
    @bind 'loggedin', @loggedin
    @bind 'loggedout', @loggedout
    
    @collection = new window.Friends
    @collection.bind 'reset', @render, this

  render: ->
    friends = @collection.search(@query()).map (d) -> 
      '<li class="lead"><img class="avatar" src="' + d.avatar() + '" alt="' + d.get('name') + ' "><span class="name">' + d.get('name') + '</span></li>'
    $(@el).find('ul').empty().append(friends)

  query: ->
    $("#search").val()

  loggedin: ->
    @collection.fetch()

  loggedout: ->
    @collection.empty()
    @render()

  events:
    'keyup #search': 'render'


window.friendsView = new FriendsView
