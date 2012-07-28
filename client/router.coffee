Workspace = Backbone.Router.extend
    routes:
        'about': 'about',
        'login': 'login'
    about: ->
        console.log 'about page'
    login: ->
        console.log 'login page'

Meteor.startup ->
    Router = new Workspace
    Backbone.history.start pushState: true
