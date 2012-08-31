class FriendDetailsView extends Backbone.View
  model: window.Friend
  el: $ ".main"
  render: ->
    template = _.template $('#friend-details-template').html(), @model
    $(@el).html(template)

window.friendDetailsView = new FriendDetailsView
