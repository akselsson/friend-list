class AppView extends Backbone.View
  el: $ '#friends'

  initialize: ->
    @bind 'facebook:loggedin', @loggedin
    @bind 'facebook:loggedout', @loggedout
    
    @collection = new window.Friends
    @collection.bind 'reset', @render, this

  render: ->
    friends = @collection.search(@query()).map (d) -> 
      '<li><img src="' + d.avatar() + '" alt="' + d.get('name') + ' ">' + d.get('name') + '</li>'
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


window.appView = new AppView
