class AppView extends Backbone.View
  el: $ '#friends'

  initialize: ->
    @friends = []
    @bind 'facebook:loggedin', @loggedin
    @bind 'facebook:loggedout', @loggedout

  render: ->
    friends = $.map @friends, (d) ->
      $('<li><img src="https://graph.facebook.com/' + d.id + '/picture" alt="' + d.name + ' ">' + d.name + '</li>')
    $(@el).empty().append(friends)

  loggedin: ->
      FB.api '/me/friends', (r) =>
        @friends = r.data
        @render()

  loggedout: ->
    @friends.empty()
    @render()


window.appView = new AppView
