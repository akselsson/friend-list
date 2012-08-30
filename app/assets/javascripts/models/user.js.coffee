class window.User extends Backbone.Model
  url: 'me'
  avatar: ->
    'https://graph.facebook.com/' + @get('id') + '/picture'
