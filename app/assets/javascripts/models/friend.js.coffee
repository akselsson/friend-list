class window.Friend extends Backbone.Model
  url: ->
    '/' + @id
  avatar: (size) ->
    size = size || 'square'
    'https://graph.facebook.com/' + @get('id') + '/picture?type=' + size
