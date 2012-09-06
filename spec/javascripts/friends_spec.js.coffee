
describe 'friends', ->
  beforeEach ->
    @friend_a = new App.Friend {name: "a"}
    @friend_b = new App.Friend {name: "b"}
    @friends = new App.Friends [@friend_b,@friend_a]



  it 'should be sorted by name', ->
    expect(@friends.at(0)).toEqual(@friend_a)

  it 'should search by name', ->
    matches = @friends.search('a')
    expect(matches).toEqual([@friend_a])
  
  it 'should search by name case insensitive', ->
    matches = @friends.search('A')
    expect(matches).toEqual([@friend_a])
    

