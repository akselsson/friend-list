describe 'Friend', ->
  it 'should have a default avatar', ->
    friend = new App.Friend id: 'id'
    expect(friend.avatar()).toEqual('https://graph.facebook.com/id/picture?type=square')
  
  it 'should have a large avaatar', ->
    friend = new App.Friend id: 'id'
    expect(friend.avatar('large')).toEqual('https://graph.facebook.com/id/picture?type=large')
