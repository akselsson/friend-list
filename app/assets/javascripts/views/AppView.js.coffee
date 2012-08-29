class AppView extends Backbone.View
  el: $ '#friends'

  initialize: ->
    @bind 'facebook:loggedin', @loggedin
    @bind 'facebook:loggedout', @loggedout
    @collection = new window.Friends
    @collection.bind 'reset', @render, this

  render: ->
    friends = @collection.map (d) -> 
      '<li><img src="https://graph.facebook.com/' + d.id + '/picture" alt="' + d.get('name') + ' ">' + d.get('name') + '</li>'
    $(@el).empty().append(friends)

  loggedin: ->
    @collection.fetch()

  loggedout: ->
    @collection.empty()
    @render()


window.appView = new AppView
