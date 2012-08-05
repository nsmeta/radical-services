Handlebars.registerHelper 'userExists', ->
    Session.get('user_exists') ? no
Handlebars.registerHelper 'userEmpty', ->
    Session.get('user_empty') ? yes

Template.login_form_info.errorLevel_is = (level) ->
    errorLevel = Session.get('error_level')
    errorLevel or= 'none'
    return (errorLevel is level)

Template.login_form_info.errorLevel = ->
    Session.get('error_level') ? 'none'

Template.login_form.events =
    'submit form': (e) ->
        $this = $(e.target)
        e.preventDefault()
        $username = $this.find 'input[name=username]'
        $password = $this.find 'input[name=password]'
        $vpassword = $this.find 'input[name=vpassword]'

        username = $username.val()
        password = $password.val()
        vpassword = $vpassword.val()

        Meteor.call 'user_exists', username, (err, result) ->
            isSignin = result if err is undefined
            if isSignin
                Meteor.loginWithPassword username, password, (err) ->
                    if err
                        Session.set 'error_level', err.reason
                    else
                        Session.set 'error_level', 'none'
            else
                if password isnt vpassword
                    Session.set 'error_level', 'Passwords mismatch.'
                else if password.length < 6
                    Session.set 'error_level', 'Password should be at least 6 characters long.'
                else
                    Meteor.createUser
                        username: username
                        password: password, {}, (err) ->
                        if err
                            Session.set 'error_level', err.reason
                        else
                            Session.set 'error_level', 'none'



    'blur input[name=username]': (e) ->
        $username = $(e.target)
        username = $username.val()
        Session.set 'error_level', 'none'
        Session.set 'user_empty', (username.length is 0)
        Meteor.call 'user_exists', username, (err, result) ->
            Session.set('user_exists', result) if err is undefined

