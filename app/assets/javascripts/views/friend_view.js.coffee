class window.FriendView extends Backbone.View
  tagName: 'li'

  render: ->
    template = _.template $('#friend-template').html(), @model
    @$el.html(template).addClass('lead')

