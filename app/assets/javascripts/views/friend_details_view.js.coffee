class App.FriendDetailsView extends Backbone.View
  model: App.Friend
  el: $ ".main"
  render: ->
    template = _.template $('#friend-details-template').html(), @model
    $(@el).html(template)

