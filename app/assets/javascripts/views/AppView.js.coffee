class AppView extends Backbone.View
  el: $ '#friends'

  initialize: ->
    @bind 'facebook:loggedin', @loggedin
    @bind 'facebook:loggedout', @loggedout
    
    @collection = new window.Friends
    @collection.bind 'reset', @render, this

  render: ->
    friends = @collection.search($("#search").val()).map (d) -> 
      '<li><img src="' + d.avatar() + '" alt="' + d.get('name') + ' ">' + d.get('name') + '</li>'
    $(@el).find('ul').empty().append(friends)

  loggedin: ->
    @collection.fetch()

  loggedout: ->
    @collection.empty()
    @render()

  search: ->
    @render()

  events:
    'keyup #search': 'search'


window.appView = new AppView
