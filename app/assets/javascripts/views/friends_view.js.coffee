class FriendsView extends Backbone.View
  el: $ '.main'

  initialize: ->
    @collection = new window.Friends
    @collection.bind 'reset', @search, this

  render: ->
    template = _.template $('#friends-template').html(), {}
    $(@el).html(template)
    @search()

  search: ->
    friends = @collection.search(@query()).map (d) -> 
      '<li class="lead"><img class="avatar" src="' + d.avatar() + '" alt="' + d.get('name') + ' "><span class="name">' + d.get('name') + '</span></li>'
    $(@el).find('ul').empty().append(friends)


  query: ->
    $("#search").val()

  fetch: ->
    @collection.fetch()

  events:
    'keyup #search': 'search'


window.friendsView = new FriendsView
