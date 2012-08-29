class window.Friend extends Backbone.Model
  avatar: ->
    'https://graph.facebook.com/' + @get('id') + '/picture'
