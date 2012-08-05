Meteor.methods user_exists: (username) ->
    @unblock()
    regex = new RegExp "^#{username}$", 'i'
    return yes if Meteor.users.findOne username: regex
