Meteor.startup -> $('#login-email').focus()

Template.account.signed_in = -> Meteor.user()

Template.account.events =
    'submit #account': (e) ->
        e.preventDefault()
        email = $('#login-email').val()
        pass = $('#login-pass').val()

        Meteor.loginWithPassword email, pass, (err) ->
            console.log err
