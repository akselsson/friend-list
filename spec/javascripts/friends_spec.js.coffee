
describe 'friends', ->
  it 'should pass', ->
    expect(true).toBe(true)

  it 'should be sorted by name', ->
    friend_a = new App.Friend {name: "a"}
    friend_b = new App.Friend {name: "b"}
    friends = new App.Friends [friend_b,friend_a]
    expect(friends.at(0)).toEqual(friend_a)
